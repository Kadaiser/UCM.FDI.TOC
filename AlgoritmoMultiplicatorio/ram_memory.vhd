library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram_memory is
    port( 
        clk		:  in  std_logic;
        we		:   in  std_logic;
        addr	: in  std_logic_vector(4 downto 0);
        din		:  in  std_logic_vector(15 downto 0);
        dout	: out std_logic_vector(15 downto 0) );
end ram_memory;

architecture arch_ram of ram_memory is

--    type ram_type is array (0 to 31) of std_logic_vector(dout'range);
    type ram_type is array (0 to (2**addr'length)-1) of std_logic_vector(dout'range);
    signal RAM: ram_type:=(
        X"0002", X"0003", X"0004", X"0005", X"0006", X"0007", X"0008", X"0009", 
        X"000A", X"000B", X"000C", X"000D", X"000E", X"000F", X"0010", X"0011", 
        X"0012", X"0013", X"0014", X"0015", X"0016", X"0017", X"0018", X"0019", 
        X"001A", X"001B", X"001C", X"001D", X"001E", X"001F", X"0020", X"0021" );
begin

memory_update: process(clk)
begin
    if rising_edge(clk) then
        if we = '1' then 
            RAM(to_integer(unsigned(addr))) <= din;
        else 
            dout <= RAM(to_integer(unsigned(addr)));
        end if;
    end if;
end process memory_update;

end arch_ram;

