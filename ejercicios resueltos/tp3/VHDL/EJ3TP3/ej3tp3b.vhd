library ieee;
use ieee.std_logic_1164.all;

entity ej3tp3b is 
	port(
	
	--entradas
	D : in std_logic;
	R : in std_logic;
	S : in std_logic;
	CLK  : in std_logic;
	
	--salidas
	Q : out std_logic
	
	);
	
end ej3tp3b;

architecture arch1 of ej3tp3b is
begin

	process(CLK) is
		begin
			
		if rising_edge(CLK) then
			if R = '1' then
				Q <= '0';
			elsif S = '1' then
				Q <= '1';
			else Q <= D;
			end if;
		end if;
			
		end process;

end architecture;