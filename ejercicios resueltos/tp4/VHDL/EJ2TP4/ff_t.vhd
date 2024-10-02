library ieee;
use ieee.std_logic_1164.all;

entity ff_t is
	port
	(
		-- Input ports
		T, clk, set, rst, en: in  std_logic;
		-- Output ports
		Q, Q_n: out std_logic
	);
end ff_t;

architecture arch1 of ff_t is
	signal q_aux: std_logic;
begin
	process(clk, rst, set)
	begin
		if rst = '1' then   -- Reset asíncrono
			q_aux <= '0';
		elsif set = '1' then   -- Set asíncrono
			q_aux <= '1';
		elsif rising_edge(clk) then   -- Flanco positivo del reloj
			if en = '1' then  -- Si habilitado
				if T = '1' then
					q_aux <= not q_aux;  -- Cambio de estado si T = 1
				else
					q_aux <= q_aux;  -- Mantiene el estado si T = 0
				end if;
			end if;
		end if;
	end process;

	Q <= q_aux;
	Q_n <= not q_aux;

end arch1;
