----------------------------------------------------------------------------------
-- Company: Universidad Complutense de Madrid [Facultad de Informática]
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    17:10:36 10/14/2015 
-- Design Name: 
-- Module Name:    FSM_munyeca - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM_munyeca is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           R : in  STD_LOGIC;
           C : in  STD_LOGIC;
           G : out  STD_LOGIC;
           L : out  STD_LOGIC);
end FSM_munyeca;

architecture Behavioral of FSM_munyeca is

type estados is (tranquila, habla, dormida, asustada);

signal estado, sig_estado: estados;

begin
---------------------------------------------------------
	process(rst, clk)
		begin
		if rst = '1' then
			estado <= tranquila;
		elsif rising_edge(clk) then
			estado <= sig_estado;
		end if;
	end process;
---------------------------------------------------------

	process(estado,R,C)
		begin
		case estado is
		
			when tranquila =>
				G <= '0';
				L <= '0';
				if (C = '1') then
					sig_estado <= dormida;
				else
					if (R = '1') then
						sig_estado <= habla;
					else
						sig_estado <= tranquila;
					end if;
				end if;
				
			when habla =>
				G <= '1';
				L <= '0';
				if (C = '1') then
					sig_estado <= dormida;
				else
					sig_estado <= habla;
				end if;
			
			when dormida =>
				G <= '0';
				L <= '0';
				if (R = '1') then
					sig_estado <= asustada;
				else
					sig_estado <= dormida;
				end if;
			
			when asustada =>
				G <= '0';
				L <= '1';
				if (R = '0') then
					if (C = '0') then
						sig_estado <= tranquila;
					else
						sig_estado <= dormida;
					end if;
				else
					sig_estado <= asustada;
				end if;
			end case;
		end process;
---------------------------------------------------------

end Behavioral;

