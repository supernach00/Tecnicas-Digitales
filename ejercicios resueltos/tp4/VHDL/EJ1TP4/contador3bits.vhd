library ieee;
use ieee.std_logic_1164.all;

entity contador3bits is
	PORT (
	
	CLK, SEL, CLR : IN std_logic;

	SALIDA : OUT std_logic_vector(2 downto 0)
	
	);
	
end contador3bits;

architecture arch1 of contador3bits is

signal Q0, Q0not, Q1, Q1not, Q2, Qaux1, Qaux2, CLRaux : std_logic;

	component FFJK is

		PORT(
		
			J, K, CLR, CLK : IN std_logic;
			
			Q, Qnot : OUT std_logic
		
		);
		
	END component;

	component MUX21 is 

		PORT(
			
				A, B, SEL : IN std_logic;
				
				Q : OUT std_logic
			
		);
		
	END component;

begin

FF1 : FFJK 
	port map (
	
	J => '1',
	K => '1',
	CLK => CLK,
	CLR => CLRaux,
	
	Q => Q0,
	Qnot => Q0not
	
	);

MUX1 : MUX21 
	port map (
	
	SEL => SEL, 
	A => Q0,
	B => Q0not,
	
	Q => Qaux1
	
	);

FF2 : FFJK 
	port map (
	
	J => '1',
	K => '1',
	CLK => Qaux1,
	CLR => CLRaux,
	
	Q => Q1,
	Qnot => Q1not
	
	
	);	

MUX2 : MUX21 
	port map (
	
	SEL => SEL, 
	A => Q1,
	B => Q1not,
	
	Q => Qaux2
	
	);
	
FF3 : FFJK 
	port map (
	
	J => '1',
	K => '1',
	CLK => Qaux2,
	CLR => CLRaux,
	
	Q => Q2,
	Qnot => open
	
	);	

SALIDA <= Q2 & Q1 & Q0;

--CLRaux <= '1' WHEN (Q2 = '1' and Q1 = '1' and Q0 = '0') ELSE CLR;
CLRaux <= '1' WHEN (Q2 = '0' and Q1 = '1' and Q0 = '0') ELSE CLR;

end architecture;