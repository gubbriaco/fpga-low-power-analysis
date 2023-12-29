library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Mux.vhd
-- @description Multiplexer component.
-- @usage In this use case it is used for the choice of input based on the selector given by the parity check.
-- @in input1 : std_logic_vector(nInputsMux downto 0) -> First input vector to be multiplexed.
-- @in input2 : std_logic_vector(nInputsMux downto 0) -> Second input vector to be multiplexed.
-- @in sel : std_logic_vector(nSelsMux downto 0) -> Input selector to choose which of the two inputs to process.
-- @out output : std_logic_vector(nInputsMux downto 0) -> Output vector selected based on the parity check result.
entity Mux is
	generic (
		nInputsMux : integer;
		nSelsMux : integer
	);
	port (
		input1, input2 : in std_logic_vector(nInputsMux-1 downto 0);
		sel : in std_logic_vector(nSelsMux-1 downto 0);
		output : out std_logic_vector(nInputsMux-1 downto 0)
	);
end Mux;



architecture Behavioral of Mux is

	begin
	
		mux_process : process(input1, input2, sel)
			begin
				if (sel = '1') then
					output <= input1;
				else
					output <= input2;
				end if;
		end process mux_process;


end Behavioral;
