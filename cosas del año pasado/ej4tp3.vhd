library ieee;
use ieee.std_logic_1164.all;

entity ej4tp3 is

	port
	(
		-- Input ports
		DataIn	: in  std_logic;
		CLK : in std_logic;
		DataOut : out std_logic
	);
	
end ej4tp3;

architecture arch1 of ej4tp3 is

signal Q	:  std_logic;

begin 

	process(DataIn, Q, CLK) is 
	begin 
		if rising_edge(CLK) then
			Q <= DataIn;
		end if;
		
	end process;
	
	DataOut <= ( (DataIn) AND (NOT(Q)) );
	
end arch1;
			
		