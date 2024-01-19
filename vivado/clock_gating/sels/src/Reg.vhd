library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Reg.vhd
-- @description Register component.
-- @usage The Reg component is designed as a register storage element, providing the ability to store and output a binary vector.
-- @generic nBitsReg : integer -> Number of bits useful for defining input and output of the register.
-- @in input : std_logic_vector(nBitsReg downto 0) -> Input binary vector to be stored in the register.
-- @out output : std_logic_vector(nBitsReg downto 0) - Output binary vector representing the stored binary vector.
entity Reg is
	generic (
		nBitsReg : integer
	);
	port (
		input : in std_logic_vector(nBitsReg-1 downto 0);
		clk : in std_logic;
		rst : in std_logic;
		output : out std_logic_vector(nBitsReg-1 downto 0)
	);
end Reg;




architecture Behavioral of Reg is

	begin
	
		reg_process : process(clk)
			begin
				if (rising_edge(clk)) then
					if (rst = '1') then
						output <= (others => '0');
					else
						output <= input;
					end if;
				end if;
		end process reg_process;


end Behavioral;
