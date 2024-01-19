library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- ParityCheck.vhd
-- @description Parity Check (XOR tree) component.
-- @usage In this use case it is used for the generation of the multiplexer related selector.
-- @generic nBitsParityCheck : integer -> Number of bits useful for defining input of the ParityCheck module.
-- @in input : std_logic_vector(nBitsParityCheck downto 0) -> Input binary vector on which the parity check is performed.
-- @out output : std_logic -> Output signal indicating the parity check result (even or odd parity).
entity ParityCheck is
	generic (
		nBitsParityCheck : integer
	);
	port (
		input : in std_logic_vector(nBitsParityCheck-1 downto 0);
		output : out std_logic
	);
end ParityCheck;
	


architecture Behavioral of ParityCheck is

	begin
	
		parity_check_process : process(input)
			variable tmp : std_logic;
			begin
				tmp := '0';
				for i in input' range loop
					tmp := tmp xor input(i);
				end loop; 
				output <= tmp;
		end process parity_check_process;
		

end Behavioral;
