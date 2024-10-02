library ieee;
use ieee.std_logic_1164.all;

entity flipflops is 
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
end flipflops;

architecture Arq of flipflops is

begin

--pr0 : process (CLK, set, rst) is
--begin 
--
--	if rst = '1' then
--		Q <= '0';
--	elsif set = '1' then
--		Q <= '1';
--	elsif rising_edge(CLK) then
--		Q <= D;
--	end if;
--end process pr0;	


	Q <= '1' when set = '1' else 
			'0' when rst = '1' else 
			D when rising_edge(CLK);

end Arq;	