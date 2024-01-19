library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.MyDefinitions.all;


entity RegClockGatingInputs is
	port(
		a, b, c, d : in std_logic_vector(nBitsInputs-1 downto 0);
		sel1, sel2 : in std_logic_vector(nBitsSels-1 downto 0);
		clk, rst : in std_logic;
		aOut, bOut, cOut, dOut : out std_logic_vector(nBitsInputs-1 downto 0);
		sel1Out, sel2Out : out std_logic_vector(nBitsSels-1 downto 0)
	);
end RegClockGatingInputs;



architecture Behavioral of RegClockGatingInputs is

	begin
		
		reg_process : process(clk)
			begin
				if (rising_edge(clk)) then
					if (rst = '1') then
						sel1Out <= (others => '0');
						sel2Out <= (others => '0');
					else
						aOut <= a;
						bOut <= b;
						cOut <= c;
						dOut <= d;
						sel1Out <= sel1;
						sel2Out <= sel2;
					end if;
				end if;
		end process reg_process;

end Behavioral;