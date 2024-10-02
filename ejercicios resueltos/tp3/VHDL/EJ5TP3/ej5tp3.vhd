library ieee;
use ieee.std_logic_1164.all;

entity ej5tp3a is
	port(
	
	A, B, CLK : in std_logic;
	Q : out std_logic
	
	);
end ej5tp3a;

architecture arch1 of ej5tp3 is

signal D, salidaAND, Qaux : std_logic;

component ffd is

	port (
		D : in std_logic;
		CLK : in std_logic;
		CLR : in std_logic;
		Q : out std_logic;
		Qnot : out std_logic
	);
end component;
begin

ffd1 : ffd is
	port map(
	
	D <= D;
	Qnot <= open;
	CLK <= CLK;
	CLR < open;
	Q <= Q;
	
	);
	
Qaux <= Q;
salidaAND <= A AND B;
D <= salidaAND OR Qaux;

end architecture;



	