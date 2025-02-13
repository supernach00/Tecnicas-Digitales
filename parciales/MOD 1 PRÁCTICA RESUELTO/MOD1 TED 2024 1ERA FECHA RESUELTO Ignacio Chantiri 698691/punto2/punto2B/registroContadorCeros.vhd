--registro que cuenta ceros de una entrada de 3 bits

library ieee;
use ieee.std_logic_1164.all;

entity registroContadorCeros is

	port(
	
	ES, CLK, RST : in std_logic;
	
	Z, Aaux : out std_logic_vector(2 downto 0)
	
	);
	
end registroContadorCeros;

architecture arch1 of registroContadorCeros is

signal A : std_logic_vector(3 downto 0);

component registroSPpuntoA is

	port(
		
			dataIn, RST, CLK : in std_logic;
			
			dataOut : out std_logic_vector(3 downto 0)
		
		);
		
end component;

component contadorCeros is

	port(
		
		A : in std_logic_vector(3 downto 0);
		
		B : out std_logic_vector(2 downto 0)
		
		);
		
end component;

begin

contadorCeros1 : contadorCeros
	
	port map(
	
	--entradas contador de ceros
	A => A,
	
	--salidas contador de ceros
	B => Z
	
	);

registroSPpuntoA1 : registroSPpuntoA

	port map(
	
	--entradas registro
	dataIn => ES,
	RST => RST,
	CLK => CLK,
	
	--salidas registro
	dataOut => A
	);
	
end architecture;	
