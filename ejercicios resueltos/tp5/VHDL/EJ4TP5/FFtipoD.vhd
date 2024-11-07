--IMPLEMENTACION DE UN FLIP-FLOP TIPO 'D'

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY FFtipoD IS
	PORT(
	
		D : IN std_logic;
		CLK : IN std_logic;
		SET : IN std_logic;
		RST : IN std_logic;
		
		Q : OUT std_logic;
		NQ : OUT std_logic
	
	);

END FFtipoD;

ARCHITECTURE arch1 OF FFtipoD IS

SIGNAL Qaux : std_logic;

BEGIN

	 PROCESS(CLK, RST, SET)
	 BEGIN
    IF RST = '1' THEN
        Qaux <= '0';
    ELSIF SET = '1' THEN
        Qaux <= '1';
    ELSIF rising_edge(CLK) THEN
        Qaux <= D;
    END IF;
END PROCESS;

Q <= Qaux;
NQ <= NOT Qaux;
	 
END ARCHITECTURE;