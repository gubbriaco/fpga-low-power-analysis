library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
library work;
use work.MyDefinitions.all;


entity RCAunsignedTB is
	generic(
		nBitsAdder : integer := 32
	);
end RCAunsignedTB;




architecture Behavioral of RCAunsignedTB is

	
	-- System Signal definitions
	signal i_clk : std_logic := '0';
	constant T_CLK : Time := 20 ns;

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
	
	-- Error Signal definitions
	signal TrueResult : integer;
	signal Error : integer;


	begin
	
		uut : RCAunsigned generic map(nBitsAdder) port map(
			input1TB, 
			input2TB, 
			outputTB
		);
		
		clk_process : process
        begin
				wait for T_CLK/2;
          i_clk <= not i_clk;
     end process clk_process;
		
		uut_process : process
			begin
				wait for 100ns;
				
				input1TB <= "01001000100101111001101001111000";
input2TB <= "10000101000110011110001011100010";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "11001011100110100010100010001101";
input2TB <= "00001100000100101110000011000001";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "01000111111010101001000100111001";
input2TB <= "10000010001011011010111000010000";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "11100101001100010010010101110000";
input2TB <= "00010100101001100110110000000110";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "10111111001100001100111100010100";
input2TB <= "01101110110101010000111100100001";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "00101011111101000000010111011101";
input2TB <= "10001010010101111001000001111110";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "10011111110001011011011111111101";
input2TB <= "11000111001111100110011101101010";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "10000000000000110110001110111101";
input2TB <= "00011111001010110001000110110101";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "01001001111101001101010100001011";
input2TB <= "11110100011101001001010100101010";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "01011001010101110011111110111000";
input2TB <= "00110011010110011111000110100111";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "01010011101110111101001111110110";
input2TB <= "11010101011111100110001011100010";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "00001110111111011111001101000001";
input2TB <= "00101100001011110000100010111100";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "10010101100101001000000111101110";
input2TB <= "00100010000101010010100011011000";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "10000110011001110001110000000101";
input2TB <= "00011110110111001011101000011110";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "01000010111111000010011011111001";
input2TB <= "00010011000000100010110100000010";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "10101100111010101100110000111011";
input2TB <= "00001110101110110000010001110010";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "00000010001001001000111100001000";
input2TB <= "01001111110111101010111001111100";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "01101110011010101011110111111100";
input2TB <= "10111010010111100111111110011110";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "00110101101110100000010100011101";
input2TB <= "11100001100000101010001000100011";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "10100111010001101010110101001110";
input2TB <= "10011000001001010110111011110100";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "11100101010010010011100010110011";
input2TB <= "00001100000001011010101111011110";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "10011100010111011111111010101111";
input2TB <= "10001000100100110110001110110011";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "01001110100000111011000100001110";
input2TB <= "10111100100000011110010011100010";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "00000000101001101111011101010111";
input2TB <= "11000000100010101100101100100110";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;
input1TB <= "10101000010110000111100000000000";
input2TB <= "00111101110000001100111100010100";
TrueResult <= conv_integer(unsigned(input1TB))+conv_integer(unsigned(input2TB));
Error <= TrueResult - conv_integer(unsigned(outputTB));
wait for T_CLK;


				
		end process uut_process;
		


end Behavioral;
