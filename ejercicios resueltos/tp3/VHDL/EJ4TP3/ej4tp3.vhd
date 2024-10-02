library ieee;
use ieee.std_logic_1164.all;

entity ej4tp3 is

	port(
	
		DataIn : IN std_logic;
		CLK : IN std_logic;
		
		DataOutA : OUT std_logic;
 		DataOutB : OUT std_logic
	
	);

end ej4tp3;

architecture arch1 of ej4tp3 is

signal salidaFF1A, salidaFF2A, salidaNegadaFF2A, salidaFF1B, salidaFF2B, salidaNegadaFF2B: std_logic;


component FFtipoD

	port
	(
		D : IN std_logic;
		CLK : IN std_logic;
		PRE : IN std_logic;
		RST : IN std_logic;
		
		Q : OUT std_logic;
		NQ : OUT std_logic
	
	);

end component;

begin

	-- FLIP FLOPS PARA DATAOUTA
	
	ffD1:FFtipoD

	port map 
	(
		D => DataIn,
		CLK => CLK,
		NQ => open,
		Q => salidaFF1A,
		
		RST => '0',
		PRE => '0'
	);

   ffD2:FFtipoD

	port map 
	(
		D => salidaFF1A,
		Q => open,
		NQ => salidaNegadaFF2A,
		CLK => CLK,
			
		PRE => '0',
		RST => '0'
		
	);
	
		ffD3:FFtipoD
		
   -- FLIP FLOPS PARA DATAOUTB

	port map 
	(
		D => DataIn,
		CLK => CLK,
		NQ => open,
		Q => salidaFF1B,
		
		RST => '0',
		PRE => '0'
	);

   ffD4:FFtipoD

	port map 
	(
		D => salidaFF1B,
		Q => salidaFF2B,
		NQ => open,
		CLK => CLK,
			
		PRE => '0',
		RST => '0'
		
	);


	DataOutA <= (salidaNegadaFF2A) AND (salidaFF1A);
	DataOutB <= (salidaFF2B) AND (NOT(salidaFF1B));

end architecture;