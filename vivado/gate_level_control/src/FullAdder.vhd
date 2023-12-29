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
	-- @description Half Adder component.
	-- @usage The HalfAdder component is a single-bit binary sum module.
	-- @in input1 : std_logic -> First input binary for addition.
	-- @in input2 : std_logic -> Second input binary for addition.
	-- @out carryOutput : std_logic -> Carry output of the sum of input1 and input2.
	-- @out output : std_logic -> Output binary representing the sum of input1 and input2.
    component HalfAdder 
        port (
			input1, input2 : in std_logic;
            carryOutput, output : out std_logic
		);
    end component;
	
	-- @description Or Gate Full Adder component.
	-- @usage The HalfAdder component is a single-bit binary sum module.
	-- @in input1 : std_logic -> First input binary for addition.
	-- @in input2 : std_logic -> Second input binary for addition.
	-- @out output : std_logic -> Output binary representing the sum of input1 and input2.
    component OrGateFullAdder
        port (
			input1, input2 : in std_logic;
            output : out std_logic
		);
    end component;
	
	-- Full Adder signals definitions
	signal output1, carryOutput1, carryOutput2: std_logic;
	
	
	begin
	
		HA1 : HalfAdder port map(input1, input2, carryOutput1, output1);
		HA2 : HalfAdder port map(output1, carryInput, carryOutput2, output);
		OrFA : OrGateFullAdder port map(carryOutput1, carryOutput2, carryOutput);
		
end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- @description Half Adder component.
-- @usage The HalfAdder component is a single-bit binary sum module.
-- @in input1 : std_logic -> First input binary for addition.
-- @in input2 : std_logic -> Second input binary for addition.
-- @out carryOutput : std_logic -> Carry output of the sum of input1 and input2.
-- @out output : std_logic -> Output binary representing the sum of input1 and input2.
entity HalfAdder is
	port (
		input1, input2 : in std_logic;
		carryOutput, output : out std_logic
	);
end HalfAdder;
architecture struct of HalfAdder is
	begin
		output <= input1 xor input2;
		carryOutput <= input1 and input2;
end struct;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- @description Or Gate Full Adder component.
-- @usage The HalfAdder component is a single-bit binary sum module.
-- @in input1 : std_logic -> First input binary for addition.
-- @in input2 : std_logic -> Second input binary for addition.
-- @out output : std_logic -> Output binary representing the sum of input1 and input2.
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