library ieee;
use ieee.std_logic_1164.all;

entity ej11tp2 is
	port(
	
	N1, N2, N3 : in std_logic_vector(1 downto 0);
	
	S1, S2: out std_logic_vector(3 downto 0)
	
	);
	
end ej11tp2;

architecture arch1 of ej11tp2 is

component multiplicador2bits is

	port(
	
	A0, A1, B0, B1 : in std_logic;
	
	Z : out std_logic_vector(3 downto 0);
	A1A0, B1B0 : out std_logic_vector(1 downto 0)
	
	);
	
end component;

begin

	mult1 : multiplicador2bits
		port map(
		
			A0 => N1(0),
			A1 => N1(1),
			
			B0 => N2(0),
			B1 => N2(1),
			
			Z => S1,
			A1A0 => OPEN,
			B1B0 => OPEN
		
		);
	
	mult2 : multiplicador2bits
		port map(
		
			A0 => N2(0),
			A1 => N2(1),
			
			B0 => N3(0),
			B1 => N3(1),
			
			Z => S2,
			A1A0 => OPEN,
			B1B0 => OPEN
		
		);

end architecture;