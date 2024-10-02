library ieee;
use ieee.std_logic_1164.all;

entity ej2 is
    port
    (
        -- Input ports
        CLK : in std_logic;
        CLR : in std_logic;
        Contador : out std_logic_vector(2 downto 0)
    );
end ej2;

architecture arch1 of ej2 is
    component ffjk
        port
        (
            -- Input ports
            CLK : in std_logic;
            J : in std_logic;
            K : in std_logic;
            Q : out std_logic;
            Qnot : out std_logic;
            CLR : in std_logic
        );
    end component;

    signal Q0 : std_logic;
    signal Q1 : std_logic;
    signal Q2 : std_logic;

begin
    FF0 : ffjk
    port map
    (
        CLK => CLK,
        J => '1',
        K => '1',
        Q => Q0,
        Qnot => open,
        CLR => CLR
    );

    FF1 : ffjk
    port map
    (
        CLK => CLK,
        J => Q0,
        K => Q0,
        Q => Q1,
        Qnot => open,
        CLR => CLR
    );

    FF2 : ffjk
    port map
    (
        CLK => CLK,
        J => Q1 AND Q0,
        K => Q1 AND Q0,
        Q => Q2,
        Qnot => open,
        CLR => CLR
    );

    Contador <= Q2 & Q1 & Q0;
end arch1;
