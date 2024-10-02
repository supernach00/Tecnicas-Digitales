LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY FFJK IS
	PORT(
	
		J, K, CLR, CLK : IN std_logic;
		
		Q, Qnot : OUT std_logic
	
	);
	
END FFJK;

ARCHITECTURE arch1 OF FFJK IS

signal Qaux : std_logic;

BEGIN

	process(CLK, J, K)
	begin
		
		if CLR = '1' then
			Qaux <= '0';
		elsif (rising_edge(CLK)) then
			if J = '1' AND K = '0' then
				Qaux <= '1';
			elsif J = '0' AND K = '1' then
				Qaux <= '0';
			elsif J = '1' AND K = '1' then
				Qaux <= NOT(Qaux);
			elsif J = '0' AND K = '0' then
				Qaux <= Qaux;
			end if;
		end if;
				
	end process;
	
	Q <= Qaux;
	Qnot <= NOT(Qaux);

END ARCHITECTURE;