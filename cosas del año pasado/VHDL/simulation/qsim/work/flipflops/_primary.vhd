library verilog;
use verilog.vl_types.all;
entity flipflops is
    port(
        D               : in     vl_logic;
        CLK             : in     vl_logic;
        set             : in     vl_logic;
        rst             : in     vl_logic;
        Q               : out    vl_logic
    );
end flipflops;
