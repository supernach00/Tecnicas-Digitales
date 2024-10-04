library ieee;
use ieee.std_logic_1164.all;

entity registroSPpuntoA is
	port(
	
		dataIn, RST, CLK : in std_logic;
		
		dataOut : out std_logic_vector(3 downto 0)
	
	);
	
end registroSPpuntoA;

architecture arch1 of registroSPpuntoA is

signal B3, B2, B1, B0 : std_logic;

component FF_D is

	port(
	
		D, RST, CLK : in std_logic;
		
		Q, notQ : out std_logic
		
	);
	
end component;

begin

	FF_D1 : FF_D
		port map(
		
			--entradas FF_D1
			RST => RST,
			CLK => CLK,
			D => dataIn,
			
			--salidas FF_D1
			
			Q => B3,
			notQ => open
			
		);
		
	FF_D2 : FF_D
		port map(
		
			--entradas FF_D2
			RST => RST,
			CLK => CLK,
			D => B3,
			
			--salidas FF_D2
			
			Q => B2,
			notQ => open
			
		);

	FF_D3 : FF_D
		port map(
		
			--entradas FF_D3
			RST => RST,
			CLK => CLK,
			D => B2,
			
			--salidas FF_D3
			
			Q => B1,
			notQ => open
			
		);
		
	FF_D4 : FF_D
		port map(
		
			--entradas FF_D4
			RST => RST,
			CLK => CLK,
			D => B1,
			
			--salidas FF_D4
			
			Q => B0,
			notQ => open
			
		);

	dataOut <= B3 & B2 & B1 & B0;
	
end architecture;