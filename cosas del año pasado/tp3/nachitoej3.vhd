library ieee;
use ieee.std_logic_1164.all;

entity nachitoej3 is

	port
	(
		-- Input ports
		DataIn	: in  std_logic;
		CLK : in std_logic;
		DataOut : out std_logic
	);
	
end nachitoej3;

architecture arch1 of nachitoej3 is

signal Q	:  std_logic;

begin 

	process(DataIn, Q, CLK) is 
	begin 
		if rising_edge(CLK) then
			Q <= DataIn;
			
			DataOut <= ( (DataIn) AND (NOT(Q)) );
		end if;
		
	end process;
	
	
	
end arch1;
			
		