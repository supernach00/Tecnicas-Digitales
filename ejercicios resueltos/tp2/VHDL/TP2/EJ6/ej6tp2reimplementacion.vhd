library IEEE;
use ieee.std_logic_1164.all;

entity ej6tp2reimplementacion is

	port(
		ctrlS : in std_logic_vector(2 downto 0);
		ctrlD : in std_logic;
		dataIn : in std_logic_vector(7 downto 0);
		
		dataOut : out std_logic_vector(7 downto 0)
		
	);
	
end ej6tp2reimplementacion;

architecture arch1 of ej6tp2reimplementacion is

signal dataOutL, dataOutR : std_logic_vector(7 downto 0);

begin 
 
pr0 : process(ctrlS, ctrlD, dataIn) is
begin

	if (ctrlS(2) = '1') then
			dataOut <= "00000000";
	else
	
		if ctrlD = '1' then
		
			if ctrlS = "001" then
				dataOut <= dataIn(6 downto 0) & '0';
			elsif ctrlS = "010" then
				dataOut <= dataIn(5 downto 0) & "00";
			elsif ctrlS = "011" then
				dataOut <= dataIn(4 downto 0) & "000";
			elsif ctrlS = "000" then
				dataOut <= dataIn;	
			end if;
			
		elsif ctrlD = '0' then
		
			if ctrlS = "001" then
				dataOut <= '0' & dataIn(7 downto 1);
			elsif ctrlS = "010" then
				dataOut <= "00" & dataIn(7 downto 2) ;
			elsif ctrlS = "011" then
				dataOut <= "000" & dataIn(7 downto 3);
			elsif ctrlS = "000" then
				dataOut <= dataIn;	
			end if;
			
		end if;
	
	end if;

end process;    
     
end architecture; 