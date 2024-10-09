library IEEE;
use IEEE.std_logic_1164.all;

entity ej2tp2b is
port(
	Q : in std_logic;
	W : in std_logic;
	E : in std_logic;
	H : out std_logic
	);
end ej2tp2b;

architecture arch1 of ej2tp2b is

 begin
 
		H <= (Q AND W AND E)    OR    (NOT(NOT(Q) OR W))    OR    (NOT(Q AND E));
 end architecture;
