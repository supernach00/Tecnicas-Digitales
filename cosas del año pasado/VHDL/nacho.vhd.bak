library ieee;
use ieee.std_logic_1164.all;

entity nacho is 
	port 
	(
		-- entradas
		A : in std_logic;
		B: in std_logic;
		CLK : in std_logic;
		
		-- salidas 
		Q : out std_logic
	);
end nacho;

architecture Arq of nacho is

signal Qn : std_logic;
signal J : std_logic;
signal K : std_logic;

begin

pr0 : process (CLK, A, B, Qn) is
begin 

	if A = '0' then
		J <= Qn;
	elsif A = '1' then 
		J <= 'B';
	end if;
	
	if Qn = '0' then
		K <= NOT A;
	elsif Qn = '1' then
		K <= '0'
	end if;
		
	--flip flop
	if rising_edge(CLK) then
		if A AND B then
			Q <= NOT Q
		elsif NOT A AND NOT B then
			Q <= Q;
		elsif NOT A AND B then
			Q <= '0';
		elsif A AND NOT B then
			Q <= '1'
		end if;
	end if;
end process pr0;



end Arq;	