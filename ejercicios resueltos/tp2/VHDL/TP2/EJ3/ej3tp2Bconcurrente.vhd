library IEEE;
use IEEE.std_logic_1164.ALL;

entity ej3tp2Bconcurrente is
	port(
		A : in std_logic;
		B : in std_logic;
		C : in std_logic;
		D : in std_logic;
		
		Z : out std_logic;
		T : out std_logic
	);
end ej3tp2Bconcurrente;

architecture arch1 of ej3tp2Bconcurrente is

	signal and_out, or_out, mux1_out, mux2_out, mux1_sel, mux2_sel : std_logic;
	
	begin
		and_out <= NOT(A AND B);
		or_out <= NOT(  NOT(D) OR B OR and_out  );
		
		-- MUX 1
		mux1_sel <= or_out;
		mux1_out <= (and_out) WHEN mux1_sel = '0' ELSE C;
		
		-- MUX 2
		mux2_sel <= and_out;
		mux2_out <= (mux1_out) WHEN mux2_sel = '0' ELSE or_out;
		
		-- SALIDAS
		
		Z <= mux2_out;
		T <= or_out;
		
end architecture;