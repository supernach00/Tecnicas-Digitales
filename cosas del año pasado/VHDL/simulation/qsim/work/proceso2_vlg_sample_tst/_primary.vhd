library verilog;
use verilog.vl_types.all;
entity proceso2_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        D               : in     vl_logic;
        rst             : in     vl_logic;
        set             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end proceso2_vlg_sample_tst;
