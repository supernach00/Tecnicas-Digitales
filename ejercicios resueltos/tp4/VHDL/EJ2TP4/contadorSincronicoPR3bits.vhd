library ieee;
use ieee.std_logic_1164.all;

entity contadorSincronicoPR3bits is

	port(
	
	CLK, SET, RST, EN, SEL : in std_logic;
	
	LED : out std_logic;
	SALIDA : out std_logic_vector(2 downto 0)
	
	);
	
end contadorSincronicoPR3bits;

architecture arch1 of contadorSincronicoPR3bits is

signal Q0, notQ0, T2, Q1, notQ1, outMux2, Q2, T3 : std_logic;

component ff_t is

	port
	(
		-- Input ports
		T, clk, set, rst, en: in  std_logic;
		-- Output ports
		Q, Q_n: out std_logic
	);
	
end component;

component MUX21 is

	port(
	
		A, B, SEL : IN std_logic;
		
		Q : OUT std_logic
	
	);
end component;

begin

ff1 : ff_t

	port map(
	
	T => '1',
	clk => CLK,
	rst => RST,
	en => EN,
	set => SET,
	
	Q => Q0,
	Q_n => notQ0
	
	);
	
mux1 : MUX21

	port map(
	
	A => Q0,
	B => notQ0,
	SEL => SEL,
	
	Q => T2
	
	);
	

ff2 : ff_t

	port map(
	
	T => T2,
	clk => CLK,
	rst => RST,
	en => EN,
	set => SET,
	
	Q => Q1,
	Q_n => notQ1
	
	);

mux2 : MUX21

	port map(
	
	A => Q1,
	B => notQ1,
	SEL => SEL,
	
	Q => outMux2
	
	);

ff3 : ff_t

	port map(
	
	T => T3,
	clk => CLK,
	rst => RST,
	en => EN,
	set => SET,
	
	Q => Q2,
	Q_n => open
	
	);
	
T3 <= outMux2 AND T2;
SALIDA <= Q2 & Q1 & Q0;
LED <= (Q0 AND Q2 AND notQ1) OR (Q0 AND Q1 AND Q2);
	
end architecture;