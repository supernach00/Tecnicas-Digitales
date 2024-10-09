LIBRARY IEEE; --HOY ME PINTA HACER TODO EL CODIGO EN MAYUSCULAS CUAL E;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed;

ENTITY ej12tp2 IS
	PORT(
	
		dataIn : in integer range 0 to 7;
		dataOut : OUT std_logic_vector(4 DOWNTO 0)
	
	);
END ej12tp2;

ARCHITECTURE arch1 OF ej12tp2 IS

SIGNAL cable : std_logic_vector(3 DOWNTO 0);

COMPONENT decoder IS

	PORT(
	
	decoIn : IN integer RANGE 0 TO 7;
	decoOut : OUT std_logic_vector(3 DOWNTO 0)
	
	);
	
END COMPONENT;
	
COMPONENT generadorParidadImpar IS

	PORT(
	
	genIn : IN std_logic_vector(3 DOWNTO 0);
	genOut : OUT std_logic_vector(4 DOWNTO 0)
	
	);
	
END COMPONENT;


BEGIN

	DECO1 : decoder
		PORT MAP(
		
		decoIn => dataIn,
		decoOut => cable
		);
	
	GEN1 : generadorParidadImpar
		PORT MAP(
		
		genIn => cable,
		genOut => dataOut
		);
	
END ARCHITECTURE;
