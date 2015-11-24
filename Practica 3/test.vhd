----------------------------------------------------------------------------------
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

-------------------------------------------------------------------------------
-- Entidad
-------------------------------------------------------------------------------
entity tb_adder is
end tb_adder;

-------------------------------------------------------------------------------
-- Arquitectura
-------------------------------------------------------------------------------

architecture beh of tb_adder is
    constant N : natural := 8;
    -- Declaracion del componente que vamos a simular
    component adder
        generic( N : natural := N );
        port( X    : in  std_logic_vector(N-1 downto 0);
              Y    : in  std_logic_vector(N-1 downto 0);
              cin  : in  std_logic;
              S    : out std_logic_vector(N-1 downto 0);
              cout : out std_logic);
    end component;

    -- Entradas
    signal cin : std_logic;
    signal X   : std_logic_vector(N-1 downto 0) := (others => '0');
    signal Y   : std_logic_vector(N-1 downto 0) := (others => '0');

    -- Salidas
    signal S      : std_logic_vector(N downto 0);
    signal S_xpct : std_logic_vector(N downto 0);

    --Arquitectura que simulados
    
	 --for dut : adder use entity work.adder(arch_add_std);
    --for dut : adder use entity work.adder(arch_add_ripple);
    for dut : adder use entity work.adder(arch_add_uaa);
	 --for dut : adder use entity work.adder(arch_add16_2uaa);

begin

    -- Instanciacion de la unidad a simular 
    dut : adder
        generic map ( N => N )
        port map ( X    => X,
                   Y    => Y,
                   cin  => cin,
                   S    => S(N-1 downto 0),
                   cout => S(N) );

    -- Proceso de estimulos
    p_stim : process
        variable v_c : natural := 0;
        variable v_i : natural := 0;
        variable v_j : natural := 0;
    begin
        wait for 1 ps;
		      
		  if(N=16) then
                cin <= '0';
				X <= "0101010101010101";
				Y <= "1010101010101010";
				wait for 1 ps;
				S_xpct <= std_logic_vector(unsigned("0"&X) + unsigned("0"&Y)+ unsigned'(""&cin) ) ;
				wait for 10 ns;
				assert S = S_xpct report "Error: suma incorrecta" severity error;
                cin <= '1';
				wait for 1 ps;
				S_xpct <= std_logic_vector(unsigned("0"&X) + unsigned("0"&Y)+ unsigned'(""&cin) ) ;
				wait for 10 ns;
				assert S = S_xpct report "Error: suma incorrecta" severity error;
				
                cin <= '0';
				X <= "1011111111111111";
				Y <= "1011011000010000";
				wait for 1 ps;
				S_xpct <= std_logic_vector(unsigned("0"&X) + unsigned("0"&Y)+ unsigned'(""&cin) ) ;
				wait for 10 ns;
				assert S = S_xpct report "Error: suma incorrecta" severity error;
                cin <= '1';
				wait for 1 ps;
				S_xpct <= std_logic_vector(unsigned("0"&X) + unsigned("0"&Y)+ unsigned'(""&cin) ) ;
				wait for 10 ns;
				assert S = S_xpct report "Error: suma incorrecta" severity error;
		  else
			  c_loop : for v_c in 0 to 1 loop
					if v_c = 0 then cin <= '0';
					else            cin <= '1';
					end if;
					i_loop : for v_i in 0 to ((2**N)-1) loop
					  j_loop : for v_j in 0 to ((2**N)-1) loop
						 X      <= std_logic_vector(to_unsigned(v_i, N));
						 Y      <= std_logic_vector(to_unsigned(v_j, N));
						 S_xpct <= std_logic_vector(to_unsigned(v_i + v_j + v_c, N+1));
						 wait for 10 ns;
						 assert S = S_xpct
							report "Error: suma incorrecta"
							severity error;
--						 wait for 10 ns;
					  end loop j_loop;
					end loop i_loop;
			  end loop c_loop;
		  end if;
        wait;
    end process p_stim;
end beh;

