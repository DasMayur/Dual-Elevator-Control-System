library verilog;
use verilog.vl_types.all;
entity LLiftC is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        req_floor       : in     vl_logic_vector(6 downto 0);
        stop            : out    vl_logic_vector(1 downto 0);
        door            : out    vl_logic_vector(1 downto 0);
        Up              : out    vl_logic_vector(1 downto 0);
        Down            : out    vl_logic_vector(1 downto 0);
        y1              : out    vl_logic_vector(6 downto 0);
        y2              : out    vl_logic_vector(6 downto 0)
    );
end LLiftC;
