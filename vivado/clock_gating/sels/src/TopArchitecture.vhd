library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.MyDefinitions.all;


-- TopArchitecture.vhd
	-- @description TopArchitecture component.
	-- @usage The TopArchitecture component was designed to be tested as a UUT in the TB.
	-- @in a : std_logic_vector(nBitsInputs-1 downto 0) -> Input binary vector representing the a signal to be added.
	-- @in b : std_logic_vector(nBitsInputs-1 downto 0) -> Input binary vector representing the b signal to be added.
	-- @in c : std_logic_vector(nBitsInputs-1 downto 0) -> Input binary vector representing the c signal to be added.
	-- @in d : std_logic_vector(nBitsInputs-1 downto 0) -> Input binary vector representing the d signal to be added.
	-- @in sel1 : std_logic_vector(nBitsSels-1 downto 0) -> Input binary vector representing sel2 signal.
	-- @in sel2 : std_logic_vector(nBitsSels-1 downto 0) -> Input binary vector representing sel1 signal.
	-- @out z : std_logic_vector(nBitsInputs downto 0) - Output binary vector of the component.
entity TopArchitecture is
	port (
		a, b, c, d : in std_logic_vector(nBitsInputs-1 downto 0);
		sel1, sel2 : in std_logic_vector(nBitsSels-1 downto 0);
		clk, rst : in std_logic;
		z : out std_logic_vector(nBitsInputs downto 0)
	);
end TopArchitecture;




architecture Behavioral of TopArchitecture is

-- components declaration --------------------------------------------
	-- Reg.vhd
	-- @description Register component.
	-- @usage The Reg component is designed as a register storage element, providing the ability to store and output a binary vector.
	-- @generic nBitsReg : integer -> Number of bits useful for defining input and output of the register.
	-- @in input : std_logic_vector(nBitsReg downto 0) -> Input binary vector to be stored in the register.
	-- @out output : std_logic_vector(nBitsReg downto 0) - Output binary vector representing the stored binary vector.
	component Reg
		generic(
			nBitsReg : integer
		);
		port(
			input : in std_logic_vector(nBitsReg-1 downto 0);
			clk : in std_logic;
			rst : in std_logic;
			output : out std_logic_vector(nBitsReg-1 downto 0)
		);
	end component;
	
	-- ParityCheck.vhd
	-- @description Parity Check (XOR tree) component.
	-- @usage In this use case it is used for the generation of the multiplexer related selector.
	-- @generic nBitsParityCheck : integer -> Number of bits useful for defining input of the ParityCheck module.
	-- @in input : std_logic_vector(nBitsParityCheck downto 0) -> Input binary vector on which the parity check is performed.
	-- @out output : std_logic -> Output signal indicating the parity check result (even or odd parity).
	component ParityCheck
		generic(
			nBitsParityCheck : integer
		);
		port(
			input : in std_logic_vector(nBitsParityCheck-1 downto 0);
			output : out std_logic
		);
	end component;
	
	-- Mux.vhd
	-- @description Multiplexer component.
	-- @usage In this use case it is used for the choice of input based on the selector given by the parity check.
	-- @generic nInputsMux : integer -> Number of bits useful for defining input and output of the multiplexer.
	-- @generic nSelsMux : integer -> Number of bits useful for defining selector of the multiplexer.
	-- @in input1 : std_logic_vector(nInputsMux downto 0) -> First input vector to be multiplexed.
	-- @in input2 : std_logic_vector(nInputsMux downto 0) -> Second input vector to be multiplexed.
	-- @in sel : std_logic_vector(nSelsMux downto 0) -> Input selector to choose which of the two inputs to process.
	-- @out output : std_logic_vector(nInputsMux downto 0) -> Output vector selected based on the parity check result.
	component Mux
		generic(
			nInputsMux : integer
		);
		port(
			input1, input2 : in std_logic_vector(nInputsMux-1 downto 0);
			sel : in std_logic;
			output : out std_logic_vector(nInputsMux-1 downto 0)
		);
	end component;
	
	-- RCAunsigned.vhd
	-- @description RCAunsigned component.
	-- @usage The RCAunsigned component is a circuit designed for binary addition. It takes two binary vectors as input and produces their sum as the output.
	-- @generic nBitsAdder : integer -> Number of bits useful for defining input and output of the RCAunsigned.
	-- @in input1 : std_logic_vector(nBitsAdder-1 downto 0) -> First input binary vector for addition.
	-- @in input2 : std_logic_vector(nBitsAdder-1 downto 0) -> Second input binary vector for addition.
	-- @out output : std_logic_vector(nBitsAdder downto 0) -> Output binary vector representing the sum of input1 and input2.
	component RCAunsigned
		generic(
			nBitsAdder : integer
		);
		port(    
			input1, input2 : in std_logic_vector(nBitsAdder-1 downto 0);
			output : out std_logic_vector(nBitsAdder downto 0)
		);
	end component;
	
	
	component RegClockGatingSels 
		port(
			a, b, c, d : in std_logic_vector(nBitsInputs-1 downto 0);
			sel1, sel2 : in std_logic_vector(nBitsSels-1 downto 0);
			clk, rst : in std_logic;
			aOut, bOut, cOut, dOut : out std_logic_vector(nBitsInputs-1 downto 0);
			sel1Out, sel2Out : out std_logic_vector(nBitsSels-1 downto 0)
		);
	end component;
	

-- signals declaration --------------------------------------------
	-- Register Inputs signals definitions
		-- Inputs
	signal aReg : std_logic_vector(nBitsInputs-1 downto 0);
	signal bReg : std_logic_vector(nBitsInputs-1 downto 0);
	signal cReg : std_logic_vector(nBitsInputs-1 downto 0);
	signal dReg : std_logic_vector(nBitsInputs-1 downto 0);
		-- Sels
	signal sel1Reg : std_logic_vector(nBitsSels-1 downto 0);
	signal sel2Reg : std_logic_vector(nBitsSels-1 downto 0);
	
	-- RCAunsigned Sels signal definition
	signal sel12RCA : std_logic_vector(nBitsSels downto 0);
	
	-- ParityCheck Sel signal definition
	signal selRCAInputs : std_logic;
	
	-- AC and BD RCAunsigned signals definitions
	signal acRCA : std_logic_vector(nBitsInputs downto 0);
	signal bdRCA : std_logic_vector(nBitsInputs downto 0);
	
	-- Mux signals definitions
	signal acbdMux : std_logic_vector(nBitsInputs downto 0);
	
	-- Register Output signal definition
	signal zReg : std_logic_vector(nBitsInputs downto 0);


-- begin ------------------------------------------------------------
	begin
	
		-- Register Inputs definitions
		RegClockGatingSelsDef : RegClockGatingSels port map(
			a,
			b,
			c,
			d,
			sel1,
			sel2,
			clk,
			rst,
			aReg,
			bReg,
			cReg,
			dReg,
			sel1Reg,
			sel2Reg
		);
		
		-- RCAunsigned Sels definition
		RCAunsignedSel1Sel2 : RCAunsigned generic map(nBitsSels) port map(sel1Reg, sel2Reg, sel12RCA);
		
		-- ParityCheck definition
		ParityCheckSel12 : ParityCheck generic map(nBitsSels+1) port map(sel12RCA, selRCAInputs);
		
		-- AC and BD RCAunsigned definitions
		RCAunsignedAC : RCAunsigned generic map(nBitsInputs) port map(aReg, cReg, acRCA);
		RCAunsignedBD : RCAunsigned generic map(nBitsInputs) port map(bReg, dReg, bdRCA);
		
		-- Mux definition
		MuxAC : Mux generic map(nBitsInputs+1) port map(acRCA, bdRCA, selRCAInputs, acbdMux);
		
		-- Register Output definition
		RegZ : Reg generic map(nBitsInputs+1) port map(acbdMux, clk, rst, zReg);
		
		-- Signal result allocation
		z <= zReg;
		

end Behavioral;
