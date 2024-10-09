library IEEE;
use IEEE.std_logic_1164.all;

entity ej3tp2Bsecuencial is
	port(
		A : in std_logic;
		B : in std_logic;
		C : in std_logic;
		D : in std_logic;
		
		T : out std_logic;
		Z : out std_logic
	);
	
end ej3tp2Bsecuencial;

architecture arch1 of ej3tp2Bsecuencial is

begin
	process(A, B, C, D)
	variable nand_out, nor_out, mux1_out, mux1_sel, mux2_out, mux2_sel : std_logic;
	begin
		
		nand_out := NOT(A AND B);
		nor_out := NOT(  NOT(D) OR B OR nand_out  );
		
		-- MUX 1
		mux1_sel := nor_out;
		
		IF mux1_sel = '0' THEN
			mux1_out := (nand_out);
		ELSE
			mux1_out := C;
		END IF;
		
		-- MUX 2
		mux2_sel := nand_out;
		
		IF mux2_sel = '0' THEN
			mux2_out := mux1_out;
		ELSE
			mux2_out := nor_out;
		END IF;
		
		-- SALIDAS
		
		Z <= mux2_out;
		T <= nor_out; 
		
	end process;

end architecture;

