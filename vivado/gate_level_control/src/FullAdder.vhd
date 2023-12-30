library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- FullAdder.vhd
-- @description Full Adder component.
-- @usage The FullAdder component is a single-bit binary sum module.
-- @in input1 : std_logic -> First input binary for addition.
-- @in input2 : std_logic -> Second input binary for addition.
-- @in carryInput : std_logic -> Carry input binary for addition.
-- @out carryOutput : std_logic -> Carry output of the sum of input1 and input2.
-- @out output : std_logic -> Output binary representing the sum of input1 and input2.
entity FullAdder is
	port(
		input1, input2, carryInput : in std_logic;
		carryOutput, output : out std_logic
	);
end FullAdder; 
architecture Behavioral of FullAdder is
	
	-- @description Xor Gate Full Adder component.
	-- @usage The XorGate component is a single-bit binary module.
	-- @in input1 : std_logic -> First input binary for XOR.
	-- @in input2 : std_logic -> Second input binary for XOR.
	-- @out output : std_logic -> Output binary representing XOR between of input1 and input2.
    component XorGateFullAdder
        port (
			input1, input2 : in std_logic;
             output : out std_logic
		);
    end component;
	
	-- @description Or Gate Full Adder component.
	-- @usage The OrGate component is a single-bit binary module.
	-- @in input1 : std_logic -> First input binary for OR.
	-- @in input2 : std_logic -> Second input binary for OR.
	-- @out output : std_logic -> Output binary representing the OR between input1 and input2.
    component OrGateFullAdder
        port (
			input1, input2 : in std_logic;
             output : out std_logic
		);
    end component;
	
	-- @description And Gate Full Adder component.
	-- @usage The AndGate component is a single-bit binary module.
	-- @in input1 : std_logic -> First input binary for AND.
	-- @in input2 : std_logic -> Second input binary for AND.
	-- @out output : std_logic -> Output binary representing the AND between input1 and input2.
    component AndGateFullAdder
        port (
			input1, input2 : in std_logic;
             output : out std_logic
		);
    end component;
	
	-- Full Adder signals definitions
	signal cin : std_logic := '0';
	signal xor1 : std_logic;
	signal xor2 : std_logic;
	signal and1 : std_logic;
	signal xor3 : std_logic;
	
	
	begin
		
		xor1_gate_full_adder : XorGateFullAdder port map(
			input1, 
			input2, 
			xor1
		);
		
		xor2_gate_full_adder : XorGateFullAdder port map(
			xor1, 
			cin, 
			output
		);
		
		and1_gate_full_adder : AndGateFullAdder port map(
			input1, 
			input2, 
			and1
		);
		
		xor3_gate_full_adder : XorGateFullAdder port map(
			xor1, 
			cin, 
			xor3
		);
		
		or1_gate_full_adder : OrGateFullAdder port map(
			xor3, 
			and1, 
			carryOutput
		);
		
end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- @description Xor Gate Full Adder component.
-- @usage The XorGate component is a single-bit binary module.
-- @in input1 : std_logic -> First input binary for XOR.
-- @in input2 : std_logic -> Second input binary for XOR.
-- @out output : std_logic -> Output binary representing XOR between of input1 and input2.
entity XorGateFullAdder is
	port (
		input1, input2 : in std_logic;
		output : out std_logic
	);
end XorGateFullAdder;
architecture struct of XorGateFullAdder is
	begin
		output <= input1 xor input2;
end struct; 




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- @description Or Gate Full Adder component.
-- @usage The OrGate component is a single-bit binary module.
-- @in input1 : std_logic -> First input binary for OR.
-- @in input2 : std_logic -> Second input binary for OR.
-- @out output : std_logic -> Output binary representing the OR between input1 and input2.
entity OrGateFullAdder is
	port (
		input1, input2 : in std_logic;
		output : out std_logic
	);
end OrGateFullAdder;
architecture struct of OrGateFullAdder is
	begin
		output <= input1 or input2;
end struct;




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- @description And Gate Full Adder component.
-- @usage The AndGate component is a single-bit binary module.
-- @in input1 : std_logic -> First input binary for AND.
-- @in input2 : std_logic -> Second input binary for AND.
-- @out output : std_logic -> Output binary representing the AND between input1 and input2.
entity AndGateFullAdder is
	port (
		input1, input2 : in std_logic;
		output : out std_logic
	);
end AndGateFullAdder;
architecture struct of AndGateFullAdder is
	begin
		output <= input1 and input2;
end struct; 