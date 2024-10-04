library ieee;
use ieee.std_logic_1164.all;

entity FF_D is
	port(
	
		D, RST, CLK : in std_logic;
		
		Q, notQ : out std_logic
		
	);

end FF_D;

architecture arch1 of FF_D is

signal Qaux : std_logic;

begin
	process(CLK, D, RST)
	begin
		if RST = '1' then
			Qaux <= '0';
		elsif rising_edge(CLK) then
			Qaux <= D; 
		end if;
	end process;
	Q <= Qaux;
	notQ <= NOT(Qaux);

end architecture;