library IEEE;
use IEEE.std_logic_1164.all;

entity ej2tp2c is
port(
	A : in std_logic;
	B : in std_logic;
	C : in std_logic;
	
	R : out std_logic	
);
end ej2tp2c;

architecture arch1 of ej2tp2c is

begin

	R <= NOT(
		NOT(A OR B)
		OR
		NOT(NOT(C) OR A)
	);
end architecture;