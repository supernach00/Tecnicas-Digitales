library ieee;
use ieee.std_logic_1164.all;

entity punto1 is
	port(
	
	A : in std_logic_vector(3 downto 0);
	
	B : out std_logic_vector(2 downto 0)
	
	);
end punto1;

architecture arch1 of punto1 is
begin

	with A select
	B <= 		"100" when "0000",
				"011" when "0001",
				"011" when "0010",
				"010" when "0011",
				"011" when "0100",
				"010" when "0101",
				"010" when "0110",
				"001" when "0111",
				"011" when "1000",
				"010" when "1001",
				"010" when "1010",
				"001" when "1011",
				"010" when "1100",
				"001" when "1101",
				"001" when "1110",
				"000" when "1111";

end architecture;