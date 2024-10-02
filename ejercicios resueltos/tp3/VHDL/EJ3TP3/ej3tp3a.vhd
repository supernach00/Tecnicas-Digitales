library ieee;
use ieee.std_logic_1164.all;

entity ej3tp3a is 
	port(
	
	--entradas
	D : in std_logic;
	R : in std_logic;
	S : in std_logic;
	CLK  : in std_logic;
	
	--salidas
	Q : out std_logic
	
	);
	
end ej3tp3a;

architecture arch1 of ej3tp3a is
begin

	process(CLK, R, S) is
		begin
			
			if R = '1' then
				Q <= '0';
			elsif S = '1' then
				Q <= '1';
			elsif rising_edge(CLK) then
				Q <= D;
			end if;
			
		end process;

end architecture;