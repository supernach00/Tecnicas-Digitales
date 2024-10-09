library IEEE;
use ieee.std_logic_1164.all;

entity ej911tp2 is

	port(
	
	A0, A1, B0, B1 : in std_logic;
	
	Z : out std_logic_vector(3 downto 0);
	A1A0, B1B0 : out std_logic_vector(1 downto 0)
	);
	
end ej911tp2;

architecture arch1 of ej911tp2 is 


begin

	Z(0) <= 	(A0 AND B0);
	Z(1) <=  (A1 AND NOT(B1) AND B0) OR 
				(A0 AND B1 AND NOT(B0)) OR
				(NOT(A1) AND A0 AND B1) OR
				(A1 AND NOT(A0) AND B0);
	Z(2) <=  (A1 AND NOT(A0) AND B1) OR
				(A1 AND B1 AND NOT(B0));
	Z(3) <=  (A1 AND A0 AND B1 AND B0);
	
	A1A0 <= A1 & A0;
	B1B0 <= B1 & B0;
			
end architecture;