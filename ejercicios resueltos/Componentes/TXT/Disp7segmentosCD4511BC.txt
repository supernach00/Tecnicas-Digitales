library IEEE;
use ieee.std_logic_1164.all;

entity ej7tp2concurrente is

	port(
	ABCD : in std_logic_vector(3 downto 0);
	
	salida : out std_logic_vector(6 downto 0)
	
	);
end ej7tp2concurrente;

architecture arch1 of ej7tp2concurrente is

begin

WITH ABCD SELECT
	salida <= B"1111110" WHEN B"0000", -- 0
				 B"0110000" WHEN B"0001", -- 1
				 B"1101101" WHEN B"0010", -- 2
				 B"1111001" WHEN B"0011", -- 3
				 B"0110011" WHEN B"0100", -- 4
				 B"1101101" WHEN B"0101", -- 5
				 B"0011111" WHEN B"0110", -- 6
				 B"1110000" WHEN B"0111", -- 7
				 B"1111111" WHEN B"1000", -- 8
				 B"1110011" WHEN B"1001", -- 9
				 
				 B"0000000" WHEN OTHERS; -- 
				 
end architecture;