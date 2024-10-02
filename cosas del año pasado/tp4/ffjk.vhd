library ieee;
use ieee.std_logic_1164.all;

entity ffjk is

	port
	(
		-- Input ports
		
		CLK : in std_logic;
		J : in std_logic; 
		K	: in  std_logic;
		Q : out std_logic;
		Qnot : out std_logic;
		CLR : in std_logic
		
	);
	
end ffjk;

architecture arch1 of ffjk is

signal Qaux : std_logic;

begin 

	process(J, K, CLK, Qaux, CLR) is 
	begin 
		
		if (CLR = '1') then 
			Qaux <= '0';
			
		elsif rising_edge(CLK) then
		
			if (J='0') AND (K='0') then
				Qaux <= Qaux;
				
			elsif (J='0') AND (K='1') then
				Qaux <= '0';
				
			elsif (J='1') AND (K='0') then
				Qaux <= '1';
				
			elsif (J='1') AND (K='1') then
				Qaux <= NOT(Qaux);	
		end if;
		end if;
	end process;
	
	Q <= Qaux;
	Qnot <= NOT(Qaux);
	
end arch1;
			
		