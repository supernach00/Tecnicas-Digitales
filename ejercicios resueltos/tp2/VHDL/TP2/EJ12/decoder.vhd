library ieee;
use ieee.std_logic_1164.all;

entity decoder is
	port(
	
	decoIn : in integer range 0 to 7;
	decoOut : out std_logic_vector(3 downto 0)
	
	);

end decoder;

architecture arch1 of decoder is
begin

	with decoIn select
		decoOut <= "0111" when 0,
					  "0001" when 1,
				     "1000" when 2,
				     "0000" when 3,
				     "0011" when 4,
				     "1101" when 5,
				     "1010" when 6,
				     "1111" when 7;
				  
end architecture;