library ieee;
use ieee.std_logic_1164.all;

entity nacho is 
	port 
	(
		-- entradas
		A : in std_logic;
		B : in std_logic;
		CLK : in std_logic;
		
		-- salidas 
		Q : out std_logic
	);
end nacho;

architecture Arq of nacho is

signal Qn : std_logic := '0';
signal J : std_logic;
signal K : std_logic;
signal Qaux : std_logic;

begin

pr0 : process (CLK, A, B, Qn) is
begin 
	if rising_edge(CLK) then
	if A = '0' then
		J <= Qn;
	elsif A = '1' then 
		J <= B;
	end if;
	
	if Qn = '0' then
		K <= NOT A;
	elsif Qn = '1' then
		K <= '0';
	end if;
	end if;
end process pr0;

ffjk : process (J,K,CLK) is
	--flip flop
begin
	
	if rising_edge(CLK) then
		if (J = '1' AND K = '1') then
			Qaux <= NOT Qn;
		elsif (J = '0' AND K = '0') then
			Qaux <= Qn;
		elsif (J = '0' AND K = '1') then
			Qaux <= '0';
		elsif (J = '1' AND K = '0') then
			Qaux <= '1';
		end if;
	end if;

end process ffjk;

process(Qaux, Qn) is
begin 

	if rising_edge(CLK) then
		if Qaux = '1' then	
			Qn <= '1';
		elsif Qaux = '0' then
			Qn <= '0';
		end if;
	end if;
	
end process;

Q <= Qaux;

end Arq;	