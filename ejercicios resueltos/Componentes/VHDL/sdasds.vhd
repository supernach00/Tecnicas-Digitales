LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY FFT IS
		PORT(
		
			T, CLK, RST, EN : in std_logic;
			
			Q, notQ : out std_logic
		
		);
END FFT;

ARCHITECTURE arch1 of FFT IS
	
	SIGNAL Qaux : std_logic := '0';
	
	BEGIN
	
		PROCESS(CLK, RST, T, EN, Qaux)
		BEGIN
		
			IF EN = '1' THEN
				IF RST = '1' THEN
				
					Qaux <= '0';
					
				ELSIF rising_edge(CLK) THEN
					
					IF (T = '1') THEN
					
						Qaux <= not(Qaux);
						
					ELSIF (T = '0') THEN
					
						Qaux <= Qaux;
					
					END IF;
				
				END IF;
				
			END IF;
			
		END PROCESS;
	
	Q <= Qaux;
	notQ <= NOT(Qaux);
	
	END ARCHITECTURE;