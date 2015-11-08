----------------------------------------------------------------------------------
-- Company: Universidad Complutense de Madrid
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    17:13:12 10/14/2015 
-- Design Name: 
-- Module Name:    FSM_munyeca - mun 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
---------------------------------------
entity FSM_munyeca is
    Port ( clk,rst,R ,C : in std_logic;
           G : out  STD_LOGIC;
           L : out  STD_LOGIC;
			  leds : out std_logic_vector(6 downto 0));
end FSM_munyeca;
----------------------------------------
architecture mun of FSM_munyeca is
---- COMPONENTES

component divisor is
  port (
   rst        : in  std_logic;         -- asynch reset
	clk_100mhz : in  std_logic;         -- 100 MHz input clock
   clk_1hz    : out std_logic          -- 1 Hz output clock
    );
end component;


---- ESTADOS Y SEÑALES
type estados is(tranquila, habla1, habla2, habla3, dormida, asustada1, asustada2, asustada3);
signal estado, estado_sig:estados;
signal clk_1Hz:std_logic;

begin

-- modificacion reloj
mod_divisor:divisor port map(rst,clk, clk_1Hz);

--transicion estados
process (rst ,clk_1Hz)

begin
	if rst='1' then
		estado<= tranquila;
	elsif rising_edge(clk_1Hz)then
		estado<= estado_sig;
	end if;
end process ;		
		

--maquina de estados.
process (estado,R,C)
begin
	case estado is
	
		when tranquila =>
			G<='0';
			L<='0';
			leds <= "0000000";
				if(C = '1') then
				estado_sig<=dormida;
				else
					if(R='1')then
						estado_sig<= habla1;
					else
						estado_sig<= tranquila;
					end if;
				end if;
		
		
		when habla1=>
			G<='1';
			L<='0';
			leds <= "0000110";
				if(C='1') then
					estado_sig<=habla2;
				else
					estado_sig<= habla1;
				end if;
				
		when habla2=>
			G<='1';
			L<='0';
		leds <= "1001111";
				if(C='1') then
					estado_sig<=habla3;
				else
					estado_sig<= habla1;
				end if;
				
		when habla3=>
			G<='1';
			L<='0';
		leds <= "0001111";
				if(C='1') then
					estado_sig<=dormida;
				else
					estado_sig<= habla1;
				end if;

				
		when dormida=>
			G<='0';
			L<='0';
leds <= "1111111";
				if(R='1')then
					estado_sig<= asustada1;	
				else
					estado_sig<=dormida;
				end if;


		when asustada1=>
			G<='0';
			L<='1';
leds <= "0000110";				
				if(R='0') then
					if(C='0') then
						estado_sig<=tranquila;
					else
						estado_sig<= asustada2;
					end if;
				else
					estado_sig<=asustada1;
				end if;

				
		when asustada2=>
			G<='0';
			L<='1';
			leds <= "1001111";				
				if(R='0') then
					if(C='0') then
						estado_sig<=tranquila;
					else
						estado_sig<= asustada3;
					end if;
				else
					estado_sig<=asustada1;
				end if;
				
		when asustada3=>
			G<='0';
			L<='1';
			leds <= "0001111";
				if(R='0') then
					if(C='0') then
						estado_sig<=tranquila;
					else
						estado_sig<= dormida;
					end if;
				else
					estado_sig<=asustada1;
				end if;
			
				
end case;
end process ;	

end mun;
