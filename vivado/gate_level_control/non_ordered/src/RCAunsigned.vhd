library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.MyDefinitions.all;


-- RCAunsigned.vhd
-- @description RCAunsigned component.
-- @usage The RCAunsigned component is a circuit designed for binary addition. It takes two binary vectors as input and produces their sum as the output.
-- @generic nBitsAdder : integer -> Number of bits useful for defining input and output of the adder.
-- @in input1 : std_logic_vector(nBitsAdder-1 downto 0) -> First input binary vector for addition.
-- @in input2 : std_logic_vector(nBitsAdder-1 downto 0) -> Second input binary vector for addition.
-- @out output : std_logic_vector(nBitsAdder downto 0) -> Output binary vector representing the sum of input1 and input2.
entity RCAunsigned is
	generic(
		nBitsAdder : integer := nBitsInputs
	);
	port(    
		input1, input2 : in std_logic_vector(nBitsAdder-1 downto 0);
		output : out std_logic_vector(nBitsAdder downto 0)
	);
end RCAunsigned;



architecture Behavioral of RCAunsigned is
	
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
	signal carry : std_logic_vector(nBitsAdder downto 0);
	signal cin : std_logic := '0';
	

	begin
	
		carry(0) <= cin;
		
		fa_for_generate : for i in 0 to nBitsAdder-1 generate
			FA : FullAdder port map(
				input1(i),
				input2(i),
				carry(i),
				carry(i+1),
				output(i)
			);
		end generate fa_for_generate;

		output(nBitsAdder) <= carry(nBitsAdder);
		

end Behavioral;
