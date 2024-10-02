library verilog;
use verilog.vl_types.all;
entity Block1 is
    port(
        A               : out    vl_logic;
        pin_name2       : in     vl_logic;
        CLK             : in     vl_logic;
        DI              : in     vl_logic;
        pin_name1       : in     vl_logic;
        pin_name3       : out    vl_logic
    );
end Block1;
