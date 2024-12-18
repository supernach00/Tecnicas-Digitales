--carry select de 16 bits

library IEEE;
use ieee.std_logic_1164.all;

entity sumador8bits is
	port(
	
		carry_in : in std_logic;
		AAAAAAAA, BBBBBBBB : in std_logic_vector(7 downto 0);
		SUMA : out std_logic_vector(8 downto 0);
		carry_out : out std_logic;
		salida8bits : out std_logic_vector(7 downto 0) --salida sin el carry de salida.
	
	);
	
end sumador8bits;

architecture arch1 of sumador8bits is

signal C0, carryout1, carryout2: std_logic;
signal salidaAux1, salidaAux2 : std_logic_vector(3 downto 0);

component Sumador4bits is
	port(
	
	carry_in : in std_logic; -- esta entrada es la que controla si suma y resta, y ademas coincide con lo que debe valer el carry de entrada (la suma para convertir ca1 a ca2)
	AAAA, BBBB : in std_logic_vector(3 downto 0);
	salida5bits : out std_logic_vector(4 downto 0); -- es de un bit mas ya que en la suma el carry puede agregarlo. en el restador se ignora.
	carry_out : out std_logic;
	salida4bits : out std_logic_vector(3 downto 0)
	);
end component;

begin

sum1 : Sumador4bits 

	port map(
	
		carry_in => carry_in,
		AAAA => AAAAAAAA(3 downto 0),
		BBBB => BBBBBBBB(3 downto 0),
		salida4bits => open,
		carry_out => carryout1,
		salida4bits => salidaAux1
	);
	
sum2 : Sumador4bits 

	port map(
	
		carry_in => carryout1,
		AAAA => AAAAAAAA(7 downto 4),
		BBBB => BBBBBBBB(7 downto 4),
		salida5bits => open,
		carry_out => carryout2,
		salida4bits => salidaAux2
	
	);

	SUMA <= carryout2 & salidaAux2 & salidaAux1;
	carry_out <= carryout2;
	salida8bits <= salidaAux2 & salidaAux1;
	
end architecture;	