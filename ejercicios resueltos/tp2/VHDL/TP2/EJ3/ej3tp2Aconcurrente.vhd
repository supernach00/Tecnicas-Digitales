library IEEE;
use IEEE.std_logic_1164.all;

entity ej3tp2Aconcurrente is
port(
	A : in std_logic;
	B : in std_logic;
	C : in std_logic;
	D : in std_logic;
	
	T : out std_logic
);
end ej3tp2Aconcurrente;

architecture arch1 of ej3tp2Aconcurrente is
	signal xor1_out, xor2_out, and_out, mux_sel : std_logic;
begin
	xor1_out <= NOT( A XOR B );
	xor2_out <= NOT(C) XOR D;
	and_out <= xor1_out AND xor2_out;
	
	-- MUX
	T <= and_out WHEN mux_sel = '0' ELSE '1';
	
	mux_sel <= D;
end architecture;
