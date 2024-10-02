LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY MUX21 IS
	PORT(
	
		A, B, SEL : IN std_logic;
		
		Q : OUT std_logic
	
	);
	
END MUX21;

ARCHITECTURE arch1 OF MUX21 IS

BEGIN

	process(SEL, A, B)
	begin
		
		if SEL = '1' then
			Q <= A;
		elsif SEL = '0' then
			Q <= B;
		end if;
				
	end process;

END ARCHITECTURE;