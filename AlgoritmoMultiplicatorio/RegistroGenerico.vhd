----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:25:59 01/18/2016 
-- Design Name: 
-- Module Name:    RegistroGenerico - Behavioral 
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


entity Registro is
    port ( clk 		: in  STD_LOGIC;
           reg_ld 	: in  STD_LOGIC;
           rst 		: in  STD_LOGIC;
           reg_in 	: in  STD_LOGIC_VECTOR(31 downto 0);
           reg_out 	: out  STD_LOGIC_VECTOR(31 downto 0)
			  );
end Registro;

architecture arch_Registro of Registro is

begin

	cargar: process (clk, rst, reg_ld)

		begin
			if rst = '1' then
				reg_out <= (others => '0');
			elsif rising_edge(clk) then
				if reg_ld = '1' then
					reg_out <= reg_in;
				end if;
			end if;
		end process cargar;

end arch_Registro;

