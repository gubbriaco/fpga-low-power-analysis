library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FullAdderTB is
end FullAdderTB;



architecture Behavioral of FullAdderTB is

	-- System Signal definitions
	signal i_clk : std_logic := '0';
	constant T_CLK : Time := 10 ns;
	
	-- Components declaration
	component FullAdder
		port(
			input1, input2, carryInput : in std_logic;
			carryOutput, output : out std_logic
		);
	end component;
	
	-- FullAdder Signals definitions
	signal in1, in2, cin : std_logic;
	signal cout, outFA : std_logic;
	
	
	begin
		
		uut : FullAdder port map(
			in1,
			in2,
			cin,
			cout,
			outFA
		);
		
		clk_process : process
        begin
				wait for T_CLK/2;
          i_clk <= not i_clk;
     end process clk_process;
	 
		uut_process : process
			begin
				in1 <= '0';
				in2 <= '0';
				cin <= '0';
				wait for T_CLK/2;
				in1 <= '0';
				in2 <= '0';
				cin <= '1';
				wait for T_CLK/2;
				in1 <= '0';
				in2 <= '1';
				cin <= '0';
				wait for T_CLK/2;
				in1 <= '0';
				in2 <= '1';
				cin <= '1';
				wait for T_CLK/2;
				in1 <= '1';
				in2 <= '0';
				cin <= '0';
				wait for T_CLK/2;
				in1 <= '1';
				in2 <= '0';
				cin <= '1';
				wait for T_CLK/2;
				in1 <= '1';
				in2 <= '1';
				cin <= '0';
				wait for T_CLK/2;
				in1 <= '1';
				in2 <= '1';
				cin <= '1';
				wait for T_CLK/2;
		end process uut_process;
		

end Behavioral;
