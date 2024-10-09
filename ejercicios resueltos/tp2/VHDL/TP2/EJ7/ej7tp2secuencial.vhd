library IEEE;
use ieee.std_logic_1164.all;

entity ej7tp2secuencial is 
	port(
	
	ABCD : in std_logic_vector(3 downto 0);
	
	salida : out std_logic_vector(6  downto 0)
	);
	
end ej7tp2secuencial;

architecture arch1 of ej7tp2secuencial is

begin
	process(ABCD)
	begin	
			case ABCD is
			when "0000" => salida <= "1111110"; -- 0
			when "0001" => salida <= "0110000"; -- 1
			when "0010" => salida <= "1101101"; -- 2
			when "0011" => salida <= "1111001"; -- 3
			when "0100" => salida <= "0110011"; -- 4
			when "0101" => salida <= "1101101"; -- 5
			when "0110" => salida <= "0011111"; -- 6
			when "0111" => salida <= "1110000"; -- 7
			when "1000" => salida <= "1111111"; -- 8
			when "1001" => salida <= "1110011"; -- 9
			
			when OTHERS => salida <= "0000000";
		end case;
	end process;

end architecture;