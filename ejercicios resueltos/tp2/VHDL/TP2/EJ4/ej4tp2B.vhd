library IEEE;
use IEEE.std_logic_1164.all;

entity ej4tp2B is
	port(
		dataInA : in std_logic;
		dataInB : in std_logic;
		sel0 : in std_logic;
		sel1 : in std_logic;
		
		dataOut : out std_logic
	);
end ej4tp2B;	

architecture arch1 of ej4tp2B is
	begin
		
		pr0: process(sel0, sel1, dataInA, dataInB) is
			begin
				if (sel0 = '0' and sel1 = '1') then
					dataOut <= dataInA;
				elsif (sel0 = '1' and sel1 = '0') then
					dataOut <= dataInB;
				end if;
			end process;
end architecture;
		