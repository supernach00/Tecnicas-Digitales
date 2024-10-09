library IEEE;
use IEEE.std_logic_1164.all;

entity ej4tp2A is
	port(
		dataInA : in std_logic;
		dataInB : in std_logic;
		sel0 : in std_logic;
		sel1 : in std_logic;

		dataOut : out std_logic
	);
end ej4tp2A;

architecture arch1 of ej4tp2A is

begin

	dataOut <= dataInA when (sel0 = '0' and sel1 = '1') 
	else
	dataInB when (sel0 = '1' and sel1 = '0'); 
	
end architecture;