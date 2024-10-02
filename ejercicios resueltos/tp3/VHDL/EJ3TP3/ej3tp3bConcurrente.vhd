library ieee;
use ieee.std_logic_1164.all;

entity ej3tp3bConcurrente is 
	port(
	
	--entradas
	D : in std_logic;
	R : in std_logic;
	S : in std_logic;
	CLK  : in std_logic;
	
	--salidas
	Q : out std_logic
	
	);
	
end ej3tp3bConcurrente;

architecture arch1 of ej3tp3bConcurrente is
begin

		Q <= '0' WHEN ((R = '1') AND (rising_edge(CLK))) ELSE
			  '1' WHEN ((S = '1') AND (rising_edge(CLK))) ELSE 
			   D  WHEN rising_edge(CLK); 
			 
end architecture;