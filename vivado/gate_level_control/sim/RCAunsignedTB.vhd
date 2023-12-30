library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
library work;
use work.MyDefinitions.all;


entity RCAunsignedTB is
	generic(
		nBitsAdder : integer := 4
	);
end RCAunsignedTB;




architecture Behavioral of RCAunsignedTB is

	-- Adder.vhd
	-- @description Adder component.
	-- @usage The Adder component is a circuit designed for binary addition. It takes two binary vectors as input and produces their sum as the output.
	-- @generic nBitsAdder : integer -> Number of bits useful for defining input and output of the adder.
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
	
	-- RCAunsigned Signal definitions
	signal input1TB : std_logic_vector(nBitsAdder-1 downto 0) := (others=>'0');
	signal input2TB : std_logic_vector(nBitsAdder-1 downto 0) := (others=>'0');
	signal outputTB : std_logic_vector(nBitsAdder downto 0);
	
	-- System Signal definitions
	signal i_clk : std_logic := '0';
	constant T_CLK : Time := 20 ns;
	
	-- Error Signal definitions
	signal TrueResult : integer;
	signal Error : integer;


	begin
	
		uut : RCAunsigned generic map(nBitsAdder) port map(
			input1TB, 
			input2TB, 
			outputTB
		);
		
		process
            begin
                wait for T_CLK/2;
                i_clk <= not i_clk;
        end process;
		
		uut_process : process
			begin
				wait for 2*T_CLK + 100 ns;
				
input1TB <= "0001";
input2TB <= "0101";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "1010";
input2TB <= "0000";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "0110";
input2TB <= "0101";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "1010";
input2TB <= "1111";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "0010";
input2TB <= "0000";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "1110";
input2TB <= "0110";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "0111";
input2TB <= "1111";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "0111";
input2TB <= "0111";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "0110";
input2TB <= "1001";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "1101";
input2TB <= "1001";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "1010";
input2TB <= "0111";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "1111";
input2TB <= "0111";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "1101";
input2TB <= "1001";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "0010";
input2TB <= "1010";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "1001";
input2TB <= "0101";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "0101";
input2TB <= "1000";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "0010";
input2TB <= "1100";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "0001";
input2TB <= "1010";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "1011";
input2TB <= "1100";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "0100";
input2TB <= "1010";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "1100";
input2TB <= "1011";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "1011";
input2TB <= "0110";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "1101";
input2TB <= "0001";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "0111";
input2TB <= "0111";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
input1TB <= "0001";
input2TB <= "1111";
wait for T_CLK/2;
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));



				
		end process uut_process;


end Behavioral;
