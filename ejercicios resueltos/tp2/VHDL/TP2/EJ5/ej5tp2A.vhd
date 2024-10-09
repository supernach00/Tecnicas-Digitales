library IEEE;
use ieee.std_logic_1164.all;

entity ej5tp2A is
	port(
		ctrl : in std_logic_vector(1 downto 0);
		rst : in std_logic;
		dataInA : in std_logic;
		dataInB : in std_logic;
		
		dataOut : out std_logic
	);

end ej5tp2A;

architecture arch1 of ej5tp2A is

begin
		r0: process (ctrl,rst,dataInA,dataInB) is 
		
			begin 
				if rst = '1' then 
			 dataOut   <= '1';  
				elsif ctrl(1) = '1' or ctrl(0) = '0' then 
			 dataOut   <= dataInB;  
				elsif (ctrl(1) xor ctrl(0)) = '1' then 
			 dataOut   <= dataInA; 
				else 
			 dataOut   <= '0'; 
				end if; 
   
		end process; 
end architecture;