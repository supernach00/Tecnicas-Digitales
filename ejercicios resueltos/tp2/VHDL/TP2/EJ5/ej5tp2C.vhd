library IEEE;
use ieee.std_logic_1164.all;

entity ej5tp2C is
	port(
		ctrl : in std_logic_vector(1 downto 0);
		rst : in std_logic;
		dataInA : in std_logic;
		dataInB : in std_logic;
		
		dataOut : out std_logic
	);

end ej5tp2C;

architecture arch1 of ej5tp2C is

begin	 
		pr0: process (ctrl,rst,dataInA,dataInB) is 
		begin 
			dataOut      <= '0'; 
			 
			 
			if ctrl(1) = '1' or ctrl(0) = '0' then 
		 dataOut   <= dataInB; 
			end if; 
				 
			if (ctrl(1) xor ctrl(0)) = '1' then 
		 dataOut   <= dataInA; 
			end if; 
		 
			if rst = '1' then 
		 dataOut   <= '1'; 
			end if; 
		end process; 
		
end architecture;