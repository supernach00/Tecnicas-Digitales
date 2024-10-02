library ieee;
use ieee.std_logic_1164.all;

entity ej3tp3aConcurrente is 
	port(
	
	--entradas
	D : in std_logic;
	R : in std_logic;
	S : in std_logic;
	CLK  : in std_logic;
	
	--salidas
	Q : out std_logic
	
	);
	
end ej3tp3aConcurrente;

architecture arch1 of ej3tp3aConcurrente is

signal PRE : std_logic;

begin
	
	Q <=   '0' WHEN (R = '1') ELSE
			 '1' WHEN (S = '1') ELSE
			  D  WHEN rising_edge(clk);
			  
end architecture;