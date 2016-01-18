library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity tb_alg is
end tb_alg;
 
architecture behavior of tb_alg is 
    -- component declaration for the unit under test (uut)
    component algorithmic
    port(
        clk :    in  std_logic;
        reset :  in  std_logic;
        inicio : in  std_logic;
        n :      in  std_logic_vector(4 downto 0);
        x :      in  std_logic_vector(15 downto 0);
        y :      out  std_logic_vector(31 downto 0);
        fin :    out  std_logic;
        error :  out  std_logic );
    end component;
    
    --inputs
    signal clk :    std_logic := '0';
    signal reset :  std_logic := '1';
    signal inicio : std_logic := '0';
    signal n :      std_logic_vector(4 downto 0) := (others => '0');
    signal x :      std_logic_vector(15 downto 0) := (others => '0');

    --outputs
    signal y :      std_logic_vector(31 downto 0);
    signal fin :    std_logic;
    signal err :    std_logic;

   -- clock period definitions
   constant clk_period : time := 10 ns;
 
begin
 
    -- instantiate the unit under test (uut)
    uut: algorithmic port map (
        clk    => clk,
        reset  => reset,
        inicio => inicio,
        n      => n,
        x      => x,
        y      => y,
        fin    => fin,
        error  => err );

    -- clock process definitions
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
    
    --Prueba a0 = x
    --i=0 -> a1 = a0 * 2 [M(0)] =    2*x  (x=3 ->    6)
    --i=1 -> a2 = a1 * 3 [M(1)] =    6*x  (x=3 ->   18)
    --i=2 -> a3 = a2 * 4 [M(2)] =   24*x  (x=3 ->   72)
    --i=3 -> a4 = a3 * 5 [M(3)] =  120*x  (x=3 ->  360)
    --i=4 -> a5 = a4 * 6 [M(4)] =  720*x  (x=3 -> 2160)
    --i=5 -> a6 = a5 * 7 [M(5)] = 5040*x  (x=3 ->15012)
 
    --Prueba a0 = x y n=6
    --i=0 -> a1 = a  * 7 [M(5)] =    7*x  (x=3 ->   21)
    --i=1 -> a2 = a  * 6 [M(4)] =   42*x  (x=3 ->  126)
    --i=2 -> a3 = a  * 5 [M(3)] =  210*x  (x=3 ->  630)
    --i=3 -> a4 = a  * 4 [M(2)] =  840*x  (x=3 -> 2520)
    --i=4 -> a5 = a  * 3 [M(1)] = 2520*x  (x=3 -> 7560)
    --i=5 -> a6 = a  * 2 [M(0)] = 5040*x  (x=3 ->15120)

    -- stimulus process
    stim_proc: process
    variable v_n : natural := 0;
    variable v_x : natural := 0;
    variable v_a : natural := 0;
    variable v_i : natural := 0;
    begin        

        -- Reset
        reset <= '1';
        wait until falling_edge(clk);
        reset  <= '0';

        n_loop : for v_n in 1 to 10 loop --Prueba exhaustiva
        --n_loop : for v_n in 2 to 2 loop --Prueba unitaria
            n <= std_logic_vector(to_unsigned(v_n, 5));
            x_loop : for v_x in 1 to 5 loop  --Prueba exhaustiva
            --x_loop : for v_x in 1 to 1 loop --Prueba unitaria
                x <= std_logic_vector(to_unsigned(v_x, 16));
                wait until falling_edge(clk);
                inicio <= '1';
                wait until falling_edge(clk);
                inicio <= '0';
                wait until fin = '1';
                
                --Test (n+1)!*x (La RAM tiene V(0)=2, V(1)=3 ...)
                v_a := v_x;
                test_loop : for v_i in 2 to (v_n+1) loop
                    v_a := v_a * v_i;
                end loop test_loop;

                assert std_logic_vector(to_unsigned(v_a,y'length)) = y
                    report "Error with n: " & integer'IMAGE(v_n) & " and x: " & integer'IMAGE(v_x) & " got " & integer'IMAGE(v_a)
                    severity error;

            end loop x_loop;
        end loop n_loop;

        wait;
   end process;
end;
