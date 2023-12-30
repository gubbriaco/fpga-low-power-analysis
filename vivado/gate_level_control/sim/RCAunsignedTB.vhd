library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_textio.all;
use IEEE.STD_LOGIC_arith.ALL;
library STD;
use STD.textio.all;
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
	
	-- Output to file signal definition
	signal write_output: integer := 0;
	

	begin
	
		uut : RCAunsigned generic map(nBitsAdder) port map(
			input1TB, 
			input2TB, 
			outputTB
		);
		
		writing : process
			-- CHANGE THE PATH OF THE TEXT FILE ACCORDING TO WHERE IT IS LOCATED
			file output_file : text open write_mode is
            "D:\Disco D\universita\magistrale\progettazione-low-power\progetti\progetto-3\vivado\gate_level_control\sim\RCAunsignedOutput.txt";
			variable row : line;
			
			begin
				wait for 100ns;
				for i in 0 to 25 loop 
					write_output <= conv_integer( unsigned( outputTB ) );
					write( row, outputTB );
					writeline( output_file, row );
					wait for T_CLK;
				end loop;
				file_close( output_file );
				wait;
			end process;			
		
		clk_process : process
        begin
				wait for T_CLK/2;
          i_clk <= not i_clk;
     end process clk_process;
		
		uut_process : process
			begin
				wait for 100ns;
				
input1TB <= "11101001101100110101111101101001";
input2TB <= "01100100000000100000100000101011";
wait for T_CLK;
input1TB <= "10011010100110011000011001110110";
input2TB <= "11010110100110011010100000010111";
wait for T_CLK;
input1TB <= "10111111001000001000000000100000";
input2TB <= "10010100010001100111010101101001";
wait for T_CLK;
input1TB <= "01000011011011110011110000010000";
input2TB <= "00011000100011000010011001101011";
wait for T_CLK;
input1TB <= "00110110000101001111110010010111";
input2TB <= "11001110001111100000111011000010";
wait for T_CLK;
input1TB <= "01101100110011000110000010001000";
input2TB <= "00110000101110001000000000001011";
wait for T_CLK;
input1TB <= "11110111100111101101101111010111";
input2TB <= "10101010111011000000100010110011";
wait for T_CLK;
input1TB <= "11010100011001101100001001000101";
input2TB <= "11110101101011001010011111011111";
wait for T_CLK;
input1TB <= "10101110110111010011110001101010";
input2TB <= "01101100001101011011101111011010";
wait for T_CLK;
input1TB <= "10110111011000010100001110000001";
input2TB <= "10100111010010001111011101111101";
wait for T_CLK;
input1TB <= "01011001111110100111100111000100";
input2TB <= "01001111111110001100111101000110";
wait for T_CLK;
input1TB <= "01000100110001010110000101100111";
input2TB <= "10111001110001110010111101011111";
wait for T_CLK;
input1TB <= "11100111101001000111010001111100";
input2TB <= "10110001111110010010001111100100";
wait for T_CLK;
input1TB <= "01110001100010011001001001100001";
input2TB <= "11001100101101010001010110000000";
wait for T_CLK;
input1TB <= "10111100101100111001010010000101";
input2TB <= "11101010100101001000011101001011";
wait for T_CLK;
input1TB <= "00011111110011100011001101111011";
input2TB <= "01000110010101000110100101001100";
wait for T_CLK;
input1TB <= "00000111110101100001111000111110";
input2TB <= "01110011001111111100110000000101";
wait for T_CLK;
input1TB <= "11101011011100010000001001111100";
input2TB <= "00101101000110010010010101110110";
wait for T_CLK;
input1TB <= "11110001000111110111101100010101";
input2TB <= "01010110001100110111101101101011";
wait for T_CLK;
input1TB <= "01110101111100100111110001010000";
input2TB <= "00010101111100101100111011101110";
wait for T_CLK;
input1TB <= "01110111100101010000011110111111";
input2TB <= "01101100101111111011101001010110";
wait for T_CLK;
input1TB <= "01101101000111101111101101111110";
input2TB <= "11110101101001101010000000111110";
wait for T_CLK;
input1TB <= "00101101110001110111010111011001";
input2TB <= "01111001110000000000101000011110";
wait for T_CLK;
input1TB <= "01010010111110010101100101111110";
input2TB <= "00000110101010101001101010010001";
wait for T_CLK;
input1TB <= "00101010101010011011000000011111";
input2TB <= "00010011010100010101110100100001";
wait for T_CLK;




				
		end process uut_process;
		


end Behavioral;
