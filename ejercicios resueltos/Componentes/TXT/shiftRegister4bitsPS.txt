--shift register de 4 bits paralelo-serie
--requiere: FFtipoD
library IEEE;
use IEEE.std_logic_1164.all;

entity shiftRegister4bitsPS is

	port(
	
		entrada : in std_logic_vector(3 downto 0); --4 BITS
		CLK : in std_logic; --CLOCK
		RST : in std_logic; --RESET
		SET : in std_logic; --SET
		ENA : in std_logic; --ENABLE
		LOAD : in std_logic; --LOAD (SI ESTA ACTIVO, SE CARGAN LOS BITS DEL DATO "ENTRADA" A CADA FF)
		
		salida : out std_logic --1 BIT
	
	);
	
end shiftRegister4bitsPS;

architecture arch1 of shiftRegister4bitsPS is

signal Q1, Q2, Q3, Q4 : std_logic;
signal SETT, RSTT : std_logic_vector(3 downto 0);
signal D : std_logic_vector(3 downto 0);

component FFtipoD is

	port(
	
		D : IN std_logic;
		CLK : IN std_logic;
		SET : IN std_logic;
		RST : IN std_logic;
		
		Q : OUT std_logic;
		NQ : OUT std_logic
		
	);

end component;	
	
begin

FF1 : FFtipoD
	port map(
	
		D => '0',
		CLK => CLK,
		SET => SETT(3),
		RST => RSTT(3),
		
		Q => Q1, 
		NQ => open
	
	);

FF2 : FFtipoD
	port map(
	
		D => Q1,
		CLK => CLK,
		SET => SETT(2),
		RST => RSTT(2),
		
		Q => Q2,
		NQ => open
	
	);
	
FF3 : FFtipoD
	port map(
	
		D => Q2,
		CLK => CLK,
		SET => SETT(1),
		RST => RSTT(1),
		
		Q => Q3,
		NQ => open
	
	);
	
FF4 : FFtipoD
	port map(
	
		D => Q3,
		CLK => CLK,
		SET => SETT(0),
		RST => RSTT(0),
		
		Q => Q4,
		NQ => open
	
	);
process(RSTT, SETT, CLK, LOAD, RST, SET, entrada)
begin
if RST = '1' then
	RSTT <= "1111";
elsif LOAD = '1' then
	RSTT <= NOT(entrada);
	SETT <= entrada;
elsif LOAD = '0' then
	RSTT <= "0000";
	SETT <= "0000";
end if;
end process;

salida <= Q4;

end architecture;