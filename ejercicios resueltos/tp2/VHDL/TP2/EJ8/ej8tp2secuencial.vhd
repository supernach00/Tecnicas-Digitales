library IEEE;
use ieee.std_logic_1164.all;

entity ej8tp2secuencial is
	port(
	
		C : in std_logic_vector(1 downto 0);
		D : in std_logic;
		entrada : in std_logic_vector(3 downto 0);
		
		salida : out std_logic_vector(3 downto 0)
		
	);
end ej8tp2secuencial;

architecture arch1 of ej8tp2secuencial is
begin
	process(C, D, entrada)
	
		begin
		
		if D = '0' then
			if C = "00" then
				salida <= entrada;
			elsif C = "01" then
				salida <= entrada(0) & entrada(3 downto 1);
			elsif C = "10" then
				salida <= entrada(1 downto 0) & entrada(3 downto 2);
			elsif C = "11" then
				salida <= entrada(2 downto 0) & entrada(3);
			end if;
			
		elsif D = '1' then
			if C = "00" then
				salida <= entrada;
			elsif C = "01" then
				salida <= entrada(2 downto 0) & entrada(3);
			elsif C = "10" then
				salida <= entrada(1 downto 0) & entrada(3 downto 2);
			elsif C = "11" then
				salida <= entrada(0) & entrada(3 downto 1);
			end if;
		
		else 
			salida <= "0000";
		end if;
		
	end process;	
end architecture;