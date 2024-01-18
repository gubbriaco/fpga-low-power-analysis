library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
library work;
use work.MyDefinitions.all;


entity RCAunsignedTB is
end RCAunsignedTB;



architecture Behavioral of RCAunsignedTB is
	
	-- System Signal definitions
	signal i_clk : std_logic := '0';
	constant T_CLK : Time := 10 ns;
	
	-- Components declaration
	component RCAunsigned
		generic(
			nBitsAdder : integer := nBitsInputs
		);
		port(    
			input1, input2 : in std_logic_vector(nBitsAdder-1 downto 0);
			output : out std_logic_vector(nBitsAdder downto 0)
		);
	end component;
	
	-- RCAunsigned Signals definitions
	signal in1, in2 : std_logic_vector(nBitsInputs-1 downto 0);
	signal outRCA : std_logic_vector(nBitsInputs downto 0);
	
	-- Debugging Signals definitions
	signal TrueResult, Error : integer;
	

	begin
	
		uut : RCAunsigned generic map(nBitsInputs) port map(
			in1,
			in2,
			outRCA
		);
		
		clk_process : process
			begin
				wait for T_CLK/2;
         i_clk <= not i_clk;
     end process clk_process;
		
		uut_process : process
			begin
				wait for 2*T_CLK + 100 ns;
				for v1 in 0 to 2**(nBitsInputs)-1 loop
					in1 <= conv_std_logic_vector(v1, nBitsInputs);
           for v2 in 0 to 2**(nBitsInputs)-1 loop      
              in2 <= conv_std_logic_vector(v2, nBitsInputs);
              wait for T_CLK/2;
						TrueResult <= v1+v2;
						Error <= TrueResult - conv_integer(unsigned(outRCA));
           end loop;
					wait for T_CLK/2;
         end loop;
		end process uut_process;


end Behavioral;
