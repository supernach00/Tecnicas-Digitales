--BARREL SHIFTER DE 4 BITS DE DOS DIRECCIONES.

library IEEE;
use ieee.std_logic_1164.all;

entity ej8tp2concurrente is

	port(
	
	C: in std_logic_vector(1 downto 0); --SELECTOR MODULO
	entrada : std_logic_vector(3 downto 0);
	D : in std_logic; -- SELECTOR DIRECCION
	
	salida : out std_logic_vector(3 downto 0)
	
	);
	
end ej8tp2concurrente;

architecture arch1 of ej8tp2concurrente is

begin

	WITH C & D SELECT
		-- SIN DESPLAZAMIENTO
		salida <= entrada WHEN "00" & '1',
					 entrada WHEN "00" & '0',

				--DESPLAZAMIENTOS A LA DERECHA:
					 entrada(0) & entrada(3 downto 1) WHEN "01" & '0', --mod 1
					 entrada(1 downto 0) & entrada(3 downto 2) WHEN "10" & '0', --mod 2
					 entrada(2 downto 0) & entrada(3) WHEN "11" & '0', --mod 3
		
				--DESPLAZAMIENTOS A LA IZQUIERDA:
					 entrada(2 downto 0) & entrada(3) WHEN "01" & '1', --mod 1
					 entrada(1 downto 0) & entrada(3 downto 2) WHEN "10" & '1', --mod 2
					 entrada(0) & entrada(3 downto 1) WHEN "11" & '1', --mod 3
		
		(others => '0') when others;
	
end architecture;