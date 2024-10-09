library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith;
use ieee.std_logic_unsigned;
use ieee.std_logic_signed;

entity ej10tp2 is
	port(
	
	A, B : in std_logic_vector(7 downto 0);
	
	AesMayor, BesMayor, sonIguales : out std_logic
	
	);
	
end ej10tp2;

architecture arch1 of ej10tp2 is
begin

AesMayor <= '1' when A > B 
					 else '0';
BesMayor <= '1' when B > A
					 else '0';
sonIguales <= '1' when B = A
					 else '0';

end architecture;