library ieee;
use ieee.std_logic_1164.all;

entity generadorParidadImpar is
	
	port(
	
	genIn : in std_logic_vector(3 downto 0);
	genOut : out std_logic_vector(4 downto 0)
	
	);
	
end generadorParidadImpar;

architecture arch1 of generadorParidadImpar is
begin --puedo implementar esto con un wiht-select o con un process y un for loop. la primera opcion es la facil y simple, aunque si quisiese escalarlo la opcion del  process es mejor. voy a hacer la segunda nomas porque nunca hice un for.

process(genIn)
	variable contador : integer range 0 to 3;
	begin
	
	contador := 0;
	
	for i in genIn'range loop	
		if genIn(i) = '1' then
			contador := contador + 1;
		end if;
	end loop;
	
	if (contador mod 2 = 0) then
		genOut <= '1' & genIn;
	else
		genOut <= '0' & genIn;
	end if;
	
	end process;

end architecture;