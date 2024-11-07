-- shift register serie-paralelo.
--requiere: FFtipoD

library IEEE;
use IEEE.std_logic_1164.all;

entity shiftRegister4bitsSP is 
	port(
	
		entrada : in std_logic; --1BIT
		CLK : in std_logic; --CLOCK
		RST : in std_logic; --RESET
		SET : in std_logic; --SET
		ENA : in std_logic; --ENABLE
		
		salida : out std_logic_vector(3 downto 0) --4BITS
		
	);
	
end shiftRegister4bitsSP;

architecture arch1 of shiftRegister4bitsSP is

signal Q1, Q2, Q3, Q4 : std_logic;

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
		
begin

FF1 : FFtipoD

	port map (
	
		D => entrada,
		CLK => CLK,
		SET => SET,
		RST => RST,
		
		Q => Q1,
		NQ => open
	
	);
	
FF2 : FFtipoD

	port map (
	
		D => Q1,
		CLK => CLK,
		SET => SET,
		RST => RST,
		
		Q => Q2,
		NQ => open
	
	);

FF3 : FFtipoD

	port map (
	
		D => Q2,
		CLK => CLK,
		SET => SET,
		RST => RST,
		
		Q => Q3,
		NQ => open
	
	);

FF4 : FFtipoD

	port map (
	
		D => Q3,
		CLK => CLK,
		SET => SET,
		RST => RST,
		
		Q => Q4,
		NQ => open
	
	);
process(CLK, RST, SET, ENA, Q1, Q2, Q3, Q4)
begin
if RST = '1' then

	salida <= "0000" ;
	
	elsif SET = '1' then
	
		salida <= "1111";
		
	elsif ENA = '1' then
	
		if rising_edge(CLK) then
		
			salida <= Q1 & Q2 & Q3 & Q4; --4bits
			
		end if;
end if;
end process;
		
end architecture;