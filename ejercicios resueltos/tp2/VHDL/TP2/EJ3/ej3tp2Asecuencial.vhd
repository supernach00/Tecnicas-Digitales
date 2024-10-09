library IEEE;
use IEEE.std_logic_1164.all;

entity ej3tp2Asecuencial is
port(
	A : in std_logic;
	B : in std_logic;
	C : in std_logic;
	D : in std_logic;
	
	T : out std_logic
);
end ej3tp2Asecuencial;

architecture arch1 of ej3tp2Asecuencial is
	signal xor1_out, xor2_out, and_out : std_logic; -- ESTA MAL XQ DEBERIA DECLARAR COMO VARIABLES EN VEZ DE SENIALES, PERO BUENO NO LO VOY A HACER DE NUEVO, EN EL B YA LO HICE BIEN.
begin
	xor1_out <= NOT( A XOR B );
	xor2_out <= NOT(C) XOR D;
	and_out <= xor1_out AND xor2_out;
	
	-- MUX 
	process(D)
	begin
		IF D = '1' THEN
			T <= '1';
		ELSE
			T <= and_out;
		END IF;
	end process;
	
end architecture;
