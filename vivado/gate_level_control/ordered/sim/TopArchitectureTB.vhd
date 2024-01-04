library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.MyDefinitions.all;


entity TopArchitectureTB is
end TopArchitectureTB;




architecture Behavioral of TopArchitectureTB is

	-- System Signal definitions
	signal i_clk : std_logic := '0';
	constant T_CLK : Time := 10 ns;
	signal i_rst : std_logic := '0';

	-- Components declaration
	component TopArchitecture is
		port (
			a, b, c, d : in std_logic_vector(nBitsInputs-1 downto 0);
			sel1, sel2 : in std_logic_vector(nBitsSels-1 downto 0);
			clk, rst : in std_logic;
			z : out std_logic_vector(nBitsInputs downto 0)
		);
	end component;
	
	-- TopArchitecture Signals definitions
	signal aTB : std_logic_vector(nBitsInputs-1 downto 0) := (others=>'0');
	signal bTB : std_logic_vector(nBitsInputs-1 downto 0) := (others=>'0');
	signal cTB : std_logic_vector(nBitsInputs-1 downto 0) := (others=>'0');
	signal dTB : std_logic_vector(nBitsInputs-1 downto 0) := (others=>'0');
	signal sel1TB : std_logic_vector(nBitsSels-1 downto 0) := (others=>'0');
	signal sel2TB : std_logic_vector(nBitsSels-1 downto 0) := (others=>'0');
	signal zTB : std_logic_vector(nBitsInputs downto 0);
	

	begin
	
		uut : TopArchitecture port map(
				aTB,
				bTB,
				cTB,
				dTB,
				sel1TB,
				sel2TB,
				i_clk,
				i_rst,
				zTB
			);
		
		
		clk_process : process
        begin
				wait for T_CLK/2;
          i_clk <= not i_clk;
     end process clk_process;
	 
		-- rst_process : process
        -- begin
				-- wait for 20ns;
           -- i_rst <= not i_rst;
				-- wait for 10ns;
				-- i_rst <= not i_rst;
     -- end process rst_process;
	 
	 
		uut_process : process
			begin
				wait for 100ns;
				i_rst <= '1';
				wait for 10ns;
				i_rst <= '0';
			
aTB <= "00010111010001001111011000111001";
bTB <= "11010010011001010010110101101111";
cTB <= "10110000110001010100100011010111";
dTB <= "10100000101100101111001011111110";
sel1TB <= "01011011";
sel2TB <= "11111001";
wait for T_CLK;
aTB <= "11110010100011110000101001001101";
bTB <= "01011000000101011011100111101000";
cTB <= "01010010001011111000110001110001";
dTB <= "11001111110011000011001010010000";
sel1TB <= "10010001";
sel2TB <= "10101110";
wait for T_CLK;
aTB <= "01110001110101111011111111100110";
bTB <= "00010001000001100001111101011001";
cTB <= "10010000000011011111011001000101";
dTB <= "10010100100100001110101010000110";
sel1TB <= "01100011";
sel2TB <= "00001101";
wait for T_CLK;
aTB <= "10010101001010110011110001100101";
bTB <= "00011101001000111000100110111010";
cTB <= "11010000010000010000011101111111";
dTB <= "01000011011000001110001101110011";
sel1TB <= "11010000";
sel2TB <= "01011001";
wait for T_CLK;
aTB <= "01100100011001110011110101000111";
bTB <= "10110011010101100010101110000001";
cTB <= "01000101100101111011111110000100";
dTB <= "10111001100110111111111001001000";
sel1TB <= "01010100";
sel2TB <= "00101000";
wait for T_CLK;
aTB <= "10110101011111000111000111100011";
bTB <= "10100000011000011001111000110001";
cTB <= "11100101000101001011110111000001";
dTB <= "01010101110111110011011011000010";
sel1TB <= "10011111";
sel2TB <= "10110001";
wait for T_CLK;
aTB <= "11111111011101010001011111110101";
bTB <= "00100010010101110011101100011010";
cTB <= "10101111110001011000010111011001";
dTB <= "01000011000100111110110100000001";
sel1TB <= "11011010";
sel2TB <= "10110110";
wait for T_CLK;
aTB <= "01111011001010100110011100110111";
bTB <= "01101111100100111001001100001010";
cTB <= "11101111001101010100001001101100";
dTB <= "01100011101100011011011010100101";
sel1TB <= "10101100";
sel2TB <= "11010110";
wait for T_CLK;
aTB <= "00101101111001000011101010000101";
bTB <= "01001100111100010001111011011110";
cTB <= "00100001110000001000000110110101";
dTB <= "11000110101111011001011101100111";
sel1TB <= "01001001";
sel2TB <= "10001111";
wait for T_CLK;
aTB <= "11111100110011111101001111010100";
bTB <= "11111110100001111110001110011100";
cTB <= "11100100110111010100001010000011";
dTB <= "01100001111101011111110010000101";
sel1TB <= "11001111";
sel2TB <= "00100111";
wait for T_CLK;
aTB <= "01001000110111000010100010001010";
bTB <= "10001011011111100010001011001000";
cTB <= "01001010010010101011001000000100";
dTB <= "01001111011110000001111100011111";
sel1TB <= "11011010";
sel2TB <= "01100001";
wait for T_CLK;
aTB <= "01111001100010000001011111111110";
bTB <= "11110011000001011100010000010100";
cTB <= "11111001101011101011100110101011";
dTB <= "10111011000100110110000011001100";
sel1TB <= "10010100";
sel2TB <= "11101010";
wait for T_CLK;
aTB <= "10000100110100010110111010010011";
bTB <= "11111100001101001110011010000100";
cTB <= "11000010011101101110100000011010";
dTB <= "10100000111110111000000010011100";
sel1TB <= "11010111";
sel2TB <= "10110100";
wait for T_CLK;
aTB <= "01001110000111000101001100110000";
bTB <= "10101010101110110010010100001001";
cTB <= "00010110000001100100110011111111";
dTB <= "01011000110101001011110111110010";
sel1TB <= "01100001";
sel2TB <= "00100111";
wait for T_CLK;
aTB <= "10100011110100101100100001001001";
bTB <= "00010001111001100001110101110000";
cTB <= "01100010011001101110010101010111";
dTB <= "00110111011100010010100111100101";
sel1TB <= "10000000";
sel2TB <= "01111010";
wait for T_CLK;
aTB <= "10111100110011100011111110010011";
bTB <= "11011001001110010111001110011100";
cTB <= "01010001000001011010011101000110";
dTB <= "00001000001001110010111101100110";
sel1TB <= "10011110";
sel2TB <= "01101100";
wait for T_CLK;
aTB <= "01000011000001101001110000000001";
bTB <= "01110101011011000010100000001000";
cTB <= "01111101110010101000011010111010";
dTB <= "00110010011001110100110010101011";
sel1TB <= "11000001";
sel2TB <= "00110101";
wait for T_CLK;
aTB <= "00100100101010100001100110000101";
bTB <= "00101111110101111010100101000001";
cTB <= "11010010010111100001011100110101";
dTB <= "01000110010101100000000111101010";
sel1TB <= "11011101";
sel2TB <= "11000010";
wait for T_CLK;
aTB <= "00110011111100111100100110110110";
bTB <= "10010100010111110110000111101000";
cTB <= "11010111110100000010100011100010";
dTB <= "00111101000111000011101001000111";
sel1TB <= "00110111";
sel2TB <= "11000001";
wait for T_CLK;
aTB <= "10110100100011111110011111100100";
bTB <= "11111111011001101001001101110000";
cTB <= "10100010011101001010100010000100";
dTB <= "11011000101110010110100000011100";
sel1TB <= "10110100";
sel2TB <= "00001101";
wait for T_CLK;
aTB <= "11011100101110100011101100000011";
bTB <= "00000111000000011010100100000011";
cTB <= "11101111100111111010000110110100";
dTB <= "11110010000110000000001010111010";
sel1TB <= "00110011";
sel2TB <= "01010101";
wait for T_CLK;
aTB <= "01111101110010100010001000101100";
bTB <= "00000011001100000100111101010110";
cTB <= "01110001101100101010101010100110";
dTB <= "10011111010110101011110001001001";
sel1TB <= "01001100";
sel2TB <= "11101000";
wait for T_CLK;
aTB <= "00110101010101000010101010100011";
bTB <= "11000001101111001100000001111111";
cTB <= "00010111000010101101111010101011";
dTB <= "11011110011100101010001100000101";
sel1TB <= "01101101";
sel2TB <= "11101100";
wait for T_CLK;
aTB <= "00011110011001011001111011001101";
bTB <= "11101011010001011010011111111110";
cTB <= "10000001000100011000011010011001";
dTB <= "11001110101111110001011111011010";
sel1TB <= "11110010";
sel2TB <= "01000001";
wait for T_CLK;
aTB <= "11110101110000101001010010110111";
bTB <= "10111010000000101100011011000110";
cTB <= "10100111111111011011010110101101";
dTB <= "01101010111101110100001100010000";
sel1TB <= "10100010";
sel2TB <= "10001100";
wait for T_CLK;
aTB <= "11000111111011011101111010000100";
bTB <= "10101111011110000011011000100000";
cTB <= "10100011101111000101100100011110";
dTB <= "11111000101110111101010000111010";
sel1TB <= "00100010";
sel2TB <= "01100110";
wait for T_CLK;
aTB <= "10000000000111100010011110000000";
bTB <= "00101001011000001111101110010100";
cTB <= "10111011011110111100110101011001";
dTB <= "10110111000111010000100010000011";
sel1TB <= "10000001";
sel2TB <= "10111000";
wait for T_CLK;
aTB <= "10011000000110001010010100100000";
bTB <= "01001000111101101111000100100101";
cTB <= "11100010000101000011101100000111";
dTB <= "11001000110001111000110110011111";
sel1TB <= "00100011";
sel2TB <= "10111100";
wait for T_CLK;
aTB <= "10000000001001101001101011111100";
bTB <= "10101010001011010101110010000001";
cTB <= "01010010110010010001111100010111";
dTB <= "10011110010001100111100010110010";
sel1TB <= "01110001";
sel2TB <= "00110110";
wait for T_CLK;
aTB <= "11100000100101110000110001011011";
bTB <= "11101110000011101001010100010101";
cTB <= "00110101000100011110011100110111";
dTB <= "10011011101001111001110001111110";
sel1TB <= "10010100";
sel2TB <= "01101011";
wait for T_CLK;
aTB <= "01010000001100100101100100101010";
bTB <= "11011001111000011100110010001011";
cTB <= "01110010010101001000000001110011";
dTB <= "10100010001000100101000100100000";
sel1TB <= "00110011";
sel2TB <= "01010111";
wait for T_CLK;
aTB <= "10010000100110000100011011000000";
bTB <= "00000001001100010010011000010001";
cTB <= "10101000001110000000001111001010";
dTB <= "11011110000001011011101011110100";
sel1TB <= "10011011";
sel2TB <= "10001000";
wait for T_CLK;
aTB <= "00001100111001011010111111111010";
bTB <= "11111011001101101010100000111010";
cTB <= "10001011000110101011101011010001";
dTB <= "11001001001000101001001010010001";
sel1TB <= "00100000";
sel2TB <= "01110100";
wait for T_CLK;
aTB <= "10000000111000001100101111100101";
bTB <= "11001011111101111011011010111001";
cTB <= "10001011100010011100010100001000";
dTB <= "00011001011111010001111111001010";
sel1TB <= "00100101";
sel2TB <= "00011011";
wait for T_CLK;
aTB <= "00001010000000101100011010101001";
bTB <= "00101111010110010001110100101001";
cTB <= "01001011000110100110001101101101";
dTB <= "01111111110001001100010101001011";
sel1TB <= "11011101";
sel2TB <= "01011011";
wait for T_CLK;
aTB <= "11110001011100101100010010111011";
bTB <= "10110100100110000000100010000111";
cTB <= "10111101100111001110000111010011";
dTB <= "00100010101110110100000001011011";
sel1TB <= "00110100";
sel2TB <= "11010011";
wait for T_CLK;
aTB <= "00111100001010110010111001011010";
bTB <= "11101000101001011110101000100001";
cTB <= "00101001000101010000111000101011";
dTB <= "11101011000010001001101101000100";
sel1TB <= "10001001";
sel2TB <= "01011110";
wait for T_CLK;
aTB <= "00110101010110110010001000100100";
bTB <= "01001011100001001001001001010001";
cTB <= "10011011111110101111101001111110";
dTB <= "00111000010011100000100101000000";
sel1TB <= "10000110";
sel2TB <= "01011011";
wait for T_CLK;
aTB <= "01111101110010111000000100010000";
bTB <= "10000000101010110101011111011101";
cTB <= "11010100111110101001001001110011";
dTB <= "01110110010010001000100101111101";
sel1TB <= "10111110";
sel2TB <= "01100001";
wait for T_CLK;
aTB <= "10011001001000110011100101001110";
bTB <= "10111001101101001011000010011101";
cTB <= "00100111111101010001110001010000";
dTB <= "11100000000110110111010011101011";
sel1TB <= "10101001";
sel2TB <= "11110011";
wait for T_CLK;
aTB <= "01110011001011101010011011110010";
bTB <= "10010011010011111001011110000111";
cTB <= "00110101110110010010110110000001";
dTB <= "00110000010000100000010111100100";
sel1TB <= "01100110";
sel2TB <= "00011111";
wait for T_CLK;
aTB <= "11010010001110011010010100101101";
bTB <= "10110110111101011000010110001001";
cTB <= "10111010100111111110111001000001";
dTB <= "11011000101111100111110111000100";
sel1TB <= "11011100";
sel2TB <= "00010010";
wait for T_CLK;
aTB <= "11100100110101000001011000111011";
bTB <= "11010110011001101110011110000011";
cTB <= "00000000101011100000000010011110";
dTB <= "11100010000110000000000111010000";
sel1TB <= "00011101";
sel2TB <= "10101011";
wait for T_CLK;
aTB <= "00000011011010100101101011001011";
bTB <= "00000101111010100011101100000010";
cTB <= "00000100100100011101011111000111";
dTB <= "11111101000101010110001000001000";
sel1TB <= "10110000";
sel2TB <= "11100010";
wait for T_CLK;
aTB <= "01110110011101100000000100111100";
bTB <= "00100011011010011000001001001011";
cTB <= "00111100110000100110110000101110";
dTB <= "10011001011111111011100001000011";
sel1TB <= "11101111";
sel2TB <= "10111010";
wait for T_CLK;
aTB <= "10001010100101111000100101001100";
bTB <= "11111010101111101000100011000001";
cTB <= "00101010100110010110101000111110";
dTB <= "11010100011110010111100100101000";
sel1TB <= "00000010";
sel2TB <= "11000110";
wait for T_CLK;
aTB <= "01111111011100101011111011111000";
bTB <= "01011111110010011000010101111110";
cTB <= "01110110110001100010101010110000";
dTB <= "00000001011101110110111001000110";
sel1TB <= "01011110";
sel2TB <= "01001010";
wait for T_CLK;
aTB <= "00010010001001110100110110111100";
bTB <= "01101001100110100010100000100001";
cTB <= "00011110101101011110011011110011";
dTB <= "00101111010010101111111101000011";
sel1TB <= "01000111";
sel2TB <= "01110101";
wait for T_CLK;
aTB <= "11101000101111100010010100001000";
bTB <= "01011100100101100101000110011001";
cTB <= "11001000011110110111001111011111";
dTB <= "00110001101011011000110110100101";
sel1TB <= "01010000";
sel2TB <= "10011101";
wait for T_CLK;
aTB <= "10100100001101000001100110010000";
bTB <= "10001000111000101101100110111010";
cTB <= "10101100101100010110011010010111";
dTB <= "00101000011000100000010100010001";
sel1TB <= "11011101";
sel2TB <= "11110001";
wait for T_CLK;
aTB <= "00100110100001001100011011101011";
bTB <= "01010011100111100111111111110110";
cTB <= "10111111110111001011010001110011";
dTB <= "00111000100111101110101010011110";
sel1TB <= "01001001";
sel2TB <= "11000000";
wait for T_CLK;
aTB <= "11110001100011101001100010111110";
bTB <= "01101011000000000010101110011100";
cTB <= "10011111111011001111010101001000";
dTB <= "00101100001111101011100010110110";
sel1TB <= "00111100";
sel2TB <= "10110010";
wait for T_CLK;
aTB <= "10110110110110000111110001000011";
bTB <= "00010101000011010110110111101000";
cTB <= "10010010100001100101111110100100";
dTB <= "11010111000010010101010001100110";
sel1TB <= "11111011";
sel2TB <= "01000100";
wait for T_CLK;
aTB <= "01010011000010110110101101011111";
bTB <= "10011100100101010100000100011100";
cTB <= "11111011110000011100100011101000";
dTB <= "01010101100010100100110000101011";
sel1TB <= "01010000";
sel2TB <= "10011111";
wait for T_CLK;
aTB <= "11100111001100111100110100011111";
bTB <= "10111000010011111111101001110110";
cTB <= "10011110101001101101010001100010";
dTB <= "11010001000011011001001110001100";
sel1TB <= "10010010";
sel2TB <= "10000110";
wait for T_CLK;
aTB <= "00011110101010111100000010110111";
bTB <= "00010101010100001101101101011000";
cTB <= "10001010101101100000001010011011";
dTB <= "01011101101111001111001110111010";
sel1TB <= "10000110";
sel2TB <= "10101101";
wait for T_CLK;
aTB <= "11000011110001000100001001111000";
bTB <= "11100101010001010001100000111110";
cTB <= "01001000111111111110100010100011";
dTB <= "11011011100000101100011001011100";
sel1TB <= "00010101";
sel2TB <= "00010010";
wait for T_CLK;
aTB <= "01001101101100110100000101100100";
bTB <= "01101110110001110011110010100110";
cTB <= "11101111011111011110000000100010";
dTB <= "11100100000110101101011111010101";
sel1TB <= "00100010";
sel2TB <= "11011001";
wait for T_CLK;
aTB <= "01110100001110000101000011000000";
bTB <= "01010011100011100100101011111101";
cTB <= "00000111110111001010001111110011";
dTB <= "00011101011100011111011011101101";
sel1TB <= "11000010";
sel2TB <= "00110110";
wait for T_CLK;
aTB <= "00110000111011110010110010110101";
bTB <= "10011111011011110111000001110000";
cTB <= "01111110001001110100110110000011";
dTB <= "10011001000110001011111001110111";
sel1TB <= "01100001";
sel2TB <= "10010111";
wait for T_CLK;
aTB <= "01101110000011111001111101001111";
bTB <= "00001111111111011101110001011000";
cTB <= "11000000101000000101011011001111";
dTB <= "11011111101101111111011100100111";
sel1TB <= "00101000";
sel2TB <= "01101001";
wait for T_CLK;
aTB <= "00011110001101100010010001000111";
bTB <= "00111010101000011000100110010101";
cTB <= "11001111110000110000001000101000";
dTB <= "10010111001111000111100101111010";
sel1TB <= "01110010";
sel2TB <= "00101010";
wait for T_CLK;
aTB <= "10001010011010111111000001000110";
bTB <= "00110001010100000001110010001001";
cTB <= "01101111000001011110111011111101";
dTB <= "11001001111011001010001110100000";
sel1TB <= "10000101";
sel2TB <= "01101011";
wait for T_CLK;
aTB <= "11000001101110100010101110110010";
bTB <= "10001111010010010011000101001110";
cTB <= "00101110001000100010000111110100";
dTB <= "11001100010011010000100101000011";
sel1TB <= "11010010";
sel2TB <= "11000111";
wait for T_CLK;
aTB <= "11001110000010001011000100111111";
bTB <= "11111011001101110100101001100111";
cTB <= "10110100100001100110111000110110";
dTB <= "10100110111001000010011010010011";
sel1TB <= "01110001";
sel2TB <= "00000101";
wait for T_CLK;
aTB <= "10010111000011000011100011010100";
bTB <= "01100010101110111001111111010010";
cTB <= "01001111010110001110000001010011";
dTB <= "00110110101101010000010100011010";
sel1TB <= "10010110";
sel2TB <= "11011111";
wait for T_CLK;
aTB <= "01001111111010011111101010110001";
bTB <= "00101010001000101100011001001110";
cTB <= "10100000010101011101001000010010";
dTB <= "01101010110000010001010000111111";
sel1TB <= "01100011";
sel2TB <= "00000010";
wait for T_CLK;
aTB <= "10011100101001001110010010110000";
bTB <= "00101010110110111000111111001010";
cTB <= "01110001011110101011111101111001";
dTB <= "11100101000111001011010011111001";
sel1TB <= "00110000";
sel2TB <= "11101111";
wait for T_CLK;
aTB <= "10000011010001111111001001110100";
bTB <= "11110101010110010010010010101111";
cTB <= "11011001100111111001011011100010";
dTB <= "10010011111000111000011011100001";
sel1TB <= "11000011";
sel2TB <= "11110010";
wait for T_CLK;
aTB <= "01111101010010001110101110110000";
bTB <= "01001011011111111111111111011011";
cTB <= "10010011011000110000111101011010";
dTB <= "00010010110101011010100001110000";
sel1TB <= "01011000";
sel2TB <= "00101001";
wait for T_CLK;
aTB <= "10111110110100001000101010011111";
bTB <= "00110010010100010100011101101001";
cTB <= "11100000010101100110101101001110";
dTB <= "00101000100000101100001000010011";
sel1TB <= "01001101";
sel2TB <= "01110111";
wait for T_CLK;
aTB <= "00011011101001110110110011001001";
bTB <= "11011010010000111000000111111011";
cTB <= "10001110000010110011011001111101";
dTB <= "01111100011011101101101111011101";
sel1TB <= "11101110";
sel2TB <= "01101010";
wait for T_CLK;
aTB <= "00001001111111110011101101000110";
bTB <= "00001010101100000100000111010110";
cTB <= "11101110101110010101000111110011";
dTB <= "10010011010101111000111110101111";
sel1TB <= "10111110";
sel2TB <= "01100111";
wait for T_CLK;
aTB <= "11001011101111110110100010001001";
bTB <= "01001101110001001100100010101100";
cTB <= "11100011001101000101001010001010";
dTB <= "00001011011000110000011001000101";
sel1TB <= "01101101";
sel2TB <= "00001011";
wait for T_CLK;
aTB <= "00100111100010001011000111101001";
bTB <= "01011111101110011101100010111000";
cTB <= "11101100100110001001011110100010";
dTB <= "11100100000000111111001100001100";
sel1TB <= "11110110";
sel2TB <= "00000110";
wait for T_CLK;
aTB <= "10010001010000000011100101100100";
bTB <= "00001110011100011011111000011000";
cTB <= "11010110111101111100100001000100";
dTB <= "11000111110100101001000111010001";
sel1TB <= "00000111";
sel2TB <= "01101101";
wait for T_CLK;
aTB <= "11110110011011000111101101010001";
bTB <= "10111000100010101010000001010101";
cTB <= "01010110100110110000001110000110";
dTB <= "00101101011010100011000011001001";
sel1TB <= "00101011";
sel2TB <= "11111111";
wait for T_CLK;
aTB <= "10001001010100100100101100011000";
bTB <= "11110101111110110110000101101100";
cTB <= "01000001000100001001011110110011";
dTB <= "11010000100100101011111010011111";
sel1TB <= "11110101";
sel2TB <= "11000101";
wait for T_CLK;
aTB <= "10001011111010000001010101111001";
bTB <= "01100001001011000000100000100111";
cTB <= "11101011100001111111110111101011";
dTB <= "10001011010110011111111000110110";
sel1TB <= "01011100";
sel2TB <= "10101000";
wait for T_CLK;
aTB <= "10010101011011000110010011011010";
bTB <= "00111100100101010101111111011011";
cTB <= "01100010100111010001001000100010";
dTB <= "01000110000110010110010011110101";
sel1TB <= "01110100";
sel2TB <= "10111100";
wait for T_CLK;
aTB <= "10001111001110001110111001001011";
bTB <= "01101101101111101011100000111010";
cTB <= "00010101100010010011010111110111";
dTB <= "11000011101010111110001100011001";
sel1TB <= "10010010";
sel2TB <= "11100010";
wait for T_CLK;
aTB <= "11011010110101110010111111000001";
bTB <= "01110010001101000111000010000101";
cTB <= "11011100111110101101000111001101";
dTB <= "10110000110111100111111101110010";
sel1TB <= "01100011";
sel2TB <= "11100011";
wait for T_CLK;
aTB <= "01010101011010100001101010110010";
bTB <= "11001100110111101111000100111000";
cTB <= "00101010110110010110001010111000";
dTB <= "11111011001001001101000001011000";
sel1TB <= "10111001";
sel2TB <= "11100000";
wait for T_CLK;
aTB <= "00000100101000001000001100101010";
bTB <= "10010101110000000111101011000000";
cTB <= "00000010001000101100000100110001";
dTB <= "01101111110011000000011001111101";
sel1TB <= "01110111";
sel2TB <= "00111110";
wait for T_CLK;
aTB <= "10110111100111011001001100001010";
bTB <= "11111111110101011110000111111010";
cTB <= "10000111011110001110010010100100";
dTB <= "00001110011101001000011100000001";
sel1TB <= "10100110";
sel2TB <= "11100010";
wait for T_CLK;
aTB <= "11111101100111011100010110000110";
bTB <= "10110100110011110011101010111011";
cTB <= "00011010001100111010101100010111";
dTB <= "10011111110110111101111010101011";
sel1TB <= "11111101";
sel2TB <= "01111100";
wait for T_CLK;
aTB <= "00010111001000011110010001000110";
bTB <= "00111010001010111001001100010110";
cTB <= "01000111111101010111111110101000";
dTB <= "00010000111001001011001000111000";
sel1TB <= "10111000";
sel2TB <= "00011010";
wait for T_CLK;
aTB <= "11000011011001010010001100011011";
bTB <= "11110110100001011110010000000101";
cTB <= "11101001100000101010110101001110";
dTB <= "00011100010100100111100011101011";
sel1TB <= "00010110";
sel2TB <= "11111101";
wait for T_CLK;
aTB <= "01011100111011100010100111111100";
bTB <= "00110010010101111111011011011011";
cTB <= "01001010011011011000010101101100";
dTB <= "11000100011110011110111100111100";
sel1TB <= "00001101";
sel2TB <= "01110011";
wait for T_CLK;
aTB <= "01101001010001010101110000001110";
bTB <= "01001111111101000011011101110010";
cTB <= "11001100001101100011100000100101";
dTB <= "10001101010100000010100001011101";
sel1TB <= "10101101";
sel2TB <= "11010100";
wait for T_CLK;
aTB <= "00110100100011011101011110110101";
bTB <= "01010100101101101010100011101101";
cTB <= "01010001000000110111001111101011";
dTB <= "00001010000100010011011010001011";
sel1TB <= "00101001";
sel2TB <= "00010100";
wait for T_CLK;
aTB <= "10001101110010000110111100110101";
bTB <= "00111100111000010101000001011011";
cTB <= "00001011001101000101010010101101";
dTB <= "00100011011001010110001000010100";
sel1TB <= "11101100";
sel2TB <= "10100011";
wait for T_CLK;
aTB <= "11001101100001010010001110011000";
bTB <= "01101000000110011000100101000000";
cTB <= "11110101101101011000000001100010";
dTB <= "01111001000011100100000001100000";
sel1TB <= "01000010";
sel2TB <= "00000111";
wait for T_CLK;
aTB <= "00100000001010100100100100011110";
bTB <= "00110000100100111111011011001001";
cTB <= "00100100010100111100000011111000";
dTB <= "01000100010110000000011101010100";
sel1TB <= "10000101";
sel2TB <= "10000001";
wait for T_CLK;
aTB <= "00001101011000010010101110111101";
bTB <= "11011101010011000100011010110111";
cTB <= "01111111100011010111110110011111";
dTB <= "10111010101000100011001111011111";
sel1TB <= "10110100";
sel2TB <= "10000111";
wait for T_CLK;
aTB <= "00010100000011110000000010111001";
bTB <= "11101011001110111001101011001101";
cTB <= "01110100011110001111111010111110";
dTB <= "10101110111110000010011110111000";
sel1TB <= "01011010";
sel2TB <= "01011011";
wait for T_CLK;
aTB <= "11011111100100101101110001000001";
bTB <= "11001010101110001110001010000101";
cTB <= "11101101101000111100100100010000";
dTB <= "00110110010010001100111011100000";
sel1TB <= "11011010";
sel2TB <= "01100010";
wait for T_CLK;
aTB <= "11100110001000011100100001111111";
bTB <= "01100100001000110111101101011110";
cTB <= "00000001011111001111011010000110";
dTB <= "00101100010010111011100010001011";
sel1TB <= "00011110";
sel2TB <= "11101110";
wait for T_CLK;
aTB <= "10000001000010111111100011001110";
bTB <= "11100111101100110010001110100100";
cTB <= "10011111101110101010001100001011";
dTB <= "00101111111010010010110010100100";
sel1TB <= "01100100";
sel2TB <= "10111001";
wait for T_CLK;
aTB <= "11000100001010110110101001000110";
bTB <= "00100010110100111011111101110101";
cTB <= "00101111001011011000001110111101";
dTB <= "00100001111010101101110110101110";
sel1TB <= "01011110";
sel2TB <= "10001101";
wait for T_CLK;
				
		end process uut_process;


end Behavioral;
