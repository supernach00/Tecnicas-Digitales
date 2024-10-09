library IEEE;
use ieee.std_logic_1164.all;

entity ej7tp2secuencial_low is 
	port(
	
	ABCD : in std_logic_vector(3 downto 0);
	segPol : in std_logic;
	
	salida : out std_logic_vector(6  downto 0)
	);
	
end ej7tp2secuencial_low;

architecture arch1 of ej7tp2secuencial_low is

begin
	process(ABCD)
	
	variable salidaAux : std_logic_vector(6 downto 0);
	
	begin	
			case ABCD is
			when "0000" => salidaAux := "1111110"; -- 0
			when "0001" => salidaAux := "0110000"; -- 1
			when "0010" => salidaAux := "1101101"; -- 2
			when "0011" => salidaAux := "1111001"; -- 3
			when "0100" => salidaAux := "0110011"; -- 4
			when "0101" => salidaAux := "1101101"; -- 5
			when "0110" => salidaAux := "0011111"; -- 6
			when "0111" => salidaAux := "1110000"; -- 7
			when "1000" => salidaAux := "1111111"; -- 8
			when "1001" => salidaAux := "1110011"; -- 9
			
			when OTHERS => salidaAux := "0000000";
		end case;
		
		if segPol = '1' then
			salida <= salidaAux;
		else
			salida <= NOT(salidaAux);
		end if;
			
	end process;


end architecture;