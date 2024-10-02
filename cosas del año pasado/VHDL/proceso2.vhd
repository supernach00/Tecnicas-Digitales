library ieee;
use ieee.std_logic_1164.all;

entity ej5 is 
	port 
	(
		-- entradas
		D : in std_logic;
		CLK : in std_logic;
		set: in std_logic;
		rst : in std_logic;
		
		-- salidas 
		Q : out std_logic
	);
end ej5;

architecture Arq of ej5 is

begin

--pr0 : process (CLK, set, rst) is
--begin 
--	
--	if rising_edge(CLK) then
--		if rst = '1' then
--			Q <= '0';
--		elsif set = '1' then 
--			Q <= '1';
--		else 
--			Q <= D;
--		end if;
--	
--	end if;
--end process pr0;	



end Arq;	