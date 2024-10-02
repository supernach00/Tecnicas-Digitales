library ieee;
use ieee.std_logic_1164.ALL;

entity ffd is
	port (
		D : in std_logic;
		CLK : in std_logic;
		CLR : in std_logic;
		Q : out std_logic;
		Qnot : out std_logic
	);
	
end ffd;

architecture arch1 of ffd is

signal Qaux : std_logic;

begin
	process(D, CLK, CLR)
	begin
		
		if (CLR = '1') then
			Qaux <= '0';
			
		elsif rising_edge(CLK) then
			Qaux <= D;
		
		end if;
	end process;
	
	Q <= Qaux;
	Qnot <= NOT(Qaux);
	
end arch1;
				
			