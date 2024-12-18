library IEEE;
use IEEE.std_logic_1164.all;

entity ej2tp2a is
port(
	H : in std_logic;
	K : in std_logic;
	L : in std_logic;
	T : out std_logic
	);
end ej2tp2a;

architecture arch1 of ej2tp2a is

 begin
 
		T <= (H AND K AND L) OR (K AND NOT(L));
 end architecture;
