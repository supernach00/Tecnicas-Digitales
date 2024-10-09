library IEEE;
use IEEE.std_logic_1164.all;

entity ej2tp2d is
port(
	A : in std_logic;
	B : in std_logic;
	C : in std_logic;
	
	O : out std_logic
);
end ej2tp2d;

architecture arch1 of ej2tp2d is
begin

	O <= NOT(NOT(A)  OR  NOT(B XOR C))
	OR
	(NOT(A) XOR C);
	
end architecture;