library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Adder.vhd
-- @description Adder component.
-- @usage The Adder component is a circuit designed for binary addition. It takes two binary vectors as input and produces their sum as the output.
-- @generic nBitsAdder : integer -> Number of bits useful for defining input and output of the adder.
-- @in input1 : std_logic_vector(nBitsAdder-1 downto 0) -> First input binary vector for addition.
-- @in input2 : std_logic_vector(nBitsAdder-1 downto 0) -> Second input binary vector for addition.
-- @out output : std_logic_vector(nBitsAdder downto 0) -> Output binary vector representing the sum of input1 and input2.
entity Adder is
	generic(
		nBitsAdder : integer
	);
	port(    
		input1, input2 : in std_logic_vector(nBitsAdder-1 downto 0);
		output : out std_logic_vector(nBitsAdder downto 0)
	);
end Adder;



architecture Behavioral of Adder is
	
	-- FullAdder.vhd
	-- @description Full Adder component.
	-- @usage The FullAdder component is a single-bit binary sum module.
	-- @in input1 : std_logic -> First input binary for addition.
	-- @in input2 : std_logic -> Second input binary for addition.
	-- @in carryInput : std_logic -> Carry input binary for addition.
	-- @out carryOutput : std_logic -> Carry output of the sum of input1 and input2.
	-- @out output : std_logic -> Output binary representing the sum of input1 and input2.
	component FullAdder
		port(
			input1, input2, carryInput : in std_logic;
			carryOutput, output : out std_logic
		);
	end component; 
	
	-- Full Adder Carry signal definition
	signal carry : std_logic_vector(30 downto 0);
	

	begin
		
		FA0: FullAdder port map(
			input1(0), 
			input2(0), 
			'0', 
			carry(0), 
			output(0)
		);
		
		FA31: FullAdder port map(
			input1(31), 
			input2(31), 
			carry(30), 
			output(32), 
			output(31)
		);
		
		full_adder_generate: for i in 1 to 30 generate
			FAi : FullAdder port map (
				input1(i), 
				input2(i), 
				carry(i-1), 
				carry(i), 
				output(i)
			);
		end generate full_adder_generate;

end Behavioral;
