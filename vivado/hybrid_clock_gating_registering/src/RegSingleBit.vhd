library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity RegSingleBit is
	port (
		input : in std_logic;
		clk : in std_logic;
		rst : in std_logic;
		output : out std_logic
	);
end RegSingleBit;



architecture Behavioral of RegSingleBit is

	begin
	
		reg_process : process(clk)
			begin
				if (rising_edge(clk)) then
					if (rst = '1') then
						output <= '0';
					else
						output <= input;
					end if;
				end if;
		end process reg_process;


end Behavioral;