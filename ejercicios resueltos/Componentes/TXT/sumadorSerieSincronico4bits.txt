--sumador sincronico de 4 bits
--requiere: FFtipoD, shiftRegister4bitsSP, shiftRegister4bitsPS, fullAdder

library ieee;
use ieee.std_logic_1164.all;

entity sumadorSerieSincronico4bits is
	port(
	
		CLK : in std_logic;
		AAAA, BBBB : in std_logic_vector(3 downto 0);
		SET, RST : in std_logic;
		LOAD : in std_logic;
		
		SSSSS : out std_logic_vector(4 downto 0)
	
	);
	
end sumadorSerieSincronico4bits;

architecture arch1 of sumadorSerieSincronico4bits is

component fullAdder is

	port(
	
		carry_in, A, B : in std_logic;
		suma, carry_out : out std_logic
	
	);

end component;

component FFtipoD is

	PORT(
	
		D : IN std_logic;
		CLK : IN std_logic;
		SET : IN std_logic;
		RST : IN std_logic;
		
		Q : OUT std_logic;
		NQ : OUT std_logic
	
	);

end component;

component shiftRegister4bitsPS is

	PORT(
		
			entrada : in std_logic_vector(3 downto 0); --4 BITS
			CLK : in std_logic; --CLOCK
			RST : in std_logic; --RESET
			SET : in std_logic; --SET
			ENA : in std_logic; --ENABLE
			LOAD : in std_logic; --LOAD (SI ESTA ACTIVO, SE CARGAN LOS BITS DEL DATO "ENTRADA" A CADA FF)
			
			salida : out std_logic --1 BIT
		
		);

end component;

component shiftRegister4bitsSP is

	PORT(
		
			entrada : in std_logic; --1BIT
			CLK : in std_logic; --CLOCK
			RST : in std_logic; --RESET
			SET : in std_logic; --SET
			ENA : in std_logic; --ENABLE
			
			salida : out std_logic_vector(3 downto 0) --4BITS
			
		);

end component;

signal D, Q, SUMA, A, B : std_logic;
signal SSSSaux : std_logic_vector(3 downto 0);

begin

--ff que guarda el carry

FFD1 : FFtipoD

	PORT MAP(
	
		D => D,
		CLK => CLK,
		SET => SET,
		RST => RST,
		
		Q => Q,
		NQ => open
	
	);
	
--register de salida SP

SRSP1 : shiftRegister4bitsSP

	PORT MAP (

		entrada => SUMA, --1BIT
		CLK => CLK,
		RST => RST,
		SET => SET,
		ENA => '1',
			
		salida => SSSSaux --4bits, suma final sin ponerle el carry en el mas significativo

	);	
	
--los dos registers de entradaa para AAAA y BBBB:

SRPS1 : shiftRegister4bitsPS

	PORT MAP(
	
		entrada => AAAA, --4BITS
		CLK => CLK,
		RST => RST,
		SET => SET,
		ENA => '1',
		LOAD => LOAD,
			
		salida => A --1BIT
	
	);
	
SRPS2 : shiftRegister4bitsPS

	PORT MAP(
	
		entrada => BBBB, --4BITS
		CLK => CLK,
		RST => RST,
		SET => SET,
		ENA => '1',
		LOAD => LOAD,
			
		salida => B --1BIT
	
	);
	
FA1 : fullAdder 
	
	PORT MAP (
	
		A => A,
		B => B,
		carry_in => Q, --a la salida del FFD
		suma => SUMA,
		carry_out => D -- a la entrda del FFD
	
	);
	
SSSSS <= D & SSSSaux;	-- le agrego el carry en el bit mas significativo, y tomo la suma al reves
	
end architecture;