library IEEE;
use ieee.std_logic_1164.all;

entity ej6tp2 is
	port(
		ctrlS : in std_logic_vector(2 downto 0);
		ctrlD : in std_logic;
		dataIn : in std_logic_vector(7 downto 0);
		
		dataOut : out std_logic_vector(7 downto 0)
		
	);
end ej6tp2;

architecture arch1 of ej6tp2 is

signal dataOutL, dataOutR : std_logic_vector(7 downto 0);

begin 
 
dataOutL <= dataIn(6 downto 0) & '0'   when (ctrlD = '1' and ctrlS    = "001") else  
            dataIn(5 downto 0) & "00"  when (ctrlD = '1' and ctrlS    = "010") else  
            dataIn(4 downto 0) & "000" when (ctrlD = '1' and ctrlS    = "011") else 
            dataIn                     when (ctrlD = '1' and ctrlS    = "000") else 
            X"00"                      when (ctrlD = '1' and ctrlS(2) = '1'  ) else 
            (others => '0'); 
 
 
with ctrlD & ctrlS select  
   dataOutR <=  '0'   & dataIn(7 downto 1) when '0' & "001", 
        "00"  & dataIn(7 downto 2) when '0' & "010", 
        "000" & dataIn(7 downto 3) when "0011", 
        dataIn when "0000", 
        "00000000"     when "0100" | "0101" | "0110" | "0111",   
        (others => '0')   when others; 
 
dataOut  <= dataOutL when ctrlD = '1' else dataOutR;        
     
end architecture; 
