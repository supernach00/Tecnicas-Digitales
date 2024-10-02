--IMPLEMENTACION DE UN FLIP-FLOP TIPO 'D'

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY FFtipoD IS
	PORT(
	
		D : IN std_logic;
		CLK : IN std_logic;
		PRE : IN std_logic;
		RST : IN std_logic;
		
		Q : OUT std_logic;
		NQ : OUT std_logic
	
	);

END FFtipoD;

ARCHITECTURE arch1 OF FFtipoD IS

signal Qaux : std_logic;

begin
	process(CLK, RST)
	begin
		
		if (RST = '1') then
			Qaux <= '0';
			
		elsif rising_edge(CLK) then
			Qaux <= D;
		
		end if;
	end process;
	
	Q <= Qaux;
	NQ <= NOT(Qaux);
	

END ARCHITECTURE;