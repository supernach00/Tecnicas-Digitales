library verilog;
use verilog.vl_types.all;
entity nacho is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        CLK             : in     vl_logic;
        Q               : out    vl_logic
    );
end nacho;
