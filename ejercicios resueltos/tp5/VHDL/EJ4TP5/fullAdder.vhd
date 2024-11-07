--FULL ADDER

library IEEE;
use IEEE.std_logic_1164.all;

entity fullAdder is
	port(
	
		carry_in, A, B : in std_logic;
		suma, carry_out : out std_logic
	
	);

end fullAdder;

architecture arch1 of fullAdder is
	
	signal salidaAXORB : std_logic;
	
	begin
	
		salidaAXORB <= A XOR B;
		suma <= salidaAXORB XOR carry_in;
		carry_out <= (salidaAXORB AND carry_in) OR (A AND B); 

end architecture;