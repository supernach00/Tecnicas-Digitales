-- sumador restador 4 bits

library IEEE;
use IEEE.std_logic_1164.all;

entity Sumador4bits is
	port(
	
	carry_in : in std_logic; -- esta entrada es la que controla si suma y resta, y ademas coincide con lo que debe valer el carry de entrada (la suma para convertir ca1 a ca2)
	AAAA, BBBB : in std_logic_vector(3 downto 0);
	carry_out : out std_logic;
	salida4bits : out std_logic_vector(3 downto 0); --la suma sin el carry final
	salida5bits : out std_logic_vector(4 downto 0) -- es de un bit mas ya que en la suma el carry puede agregarlo.
	);

end Sumador4bits;

architecture arch1 of Sumador4bits is

signal carry_outAUX : std_logic;
signal salida4bitsAUX : std_logic_vector(3 downto 0);
signal co0, co1, co2, co3 : std_logic; -- seniales aux para los carrys de salida de cada full adder.

component fullAdder is
	port(
		
			carry_in, A, B : in std_logic;
			suma, carry_out : out std_logic
		
		);
end component;

begin

FA0 : fullAdder
	port map(

		carry_in => carry_in,
		A => AAAA(0),
		B => BBBB(0),
		suma => salida4bitsAUX(0),
		carry_out => co0
	
	);
	
FA1 : fullAdder
	port map(

		carry_in => co0,
		A => AAAA(1),
		B => BBBB(1),
		suma => salida4bitsAUX(1),
		carry_out => co1
	
	);

FA2 : fullAdder
	port map(

		carry_in => co1,
		A => AAAA(2),
		B => BBBB(2),
		suma => salida4bitsAUX(2),
		carry_out => co2
	
	);

FA3 : fullAdder
	port map(

		carry_in => co2,
		A => AAAA(3),
		B => BBBB(3),
		suma => salida4bitsAUX(3),
		carry_out => carry_outAUX
	
	);	

salida5bits <= carry_outAUX & salida4bitsAUX;
salida4bits <= salida4bitsAUX;
carry_out <= carry_outAUX;
	
end architecture;