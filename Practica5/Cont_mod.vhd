----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:03:58 12/13/2015 
-- Design Name: 
-- Module Name:    Cont_mod - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;


entity Cont_mod is
	generic(n : natural);
	port(	reset		:	in STD_LOGIC;
			cont		:	in STD_LOGIC;
			clk		:	in STD_LOGIC;
			salida	:	in STD_LOGIC_VECTOR(n-1 downto 0)
			);
end Cont_mod;

architecture Behavioral of Cont_mod is

begin
	process(reset, clk, cont)
		begin
			if rst = '1' then
				salida <= (others => '0');
			elsif rising_edge(clk) then
				if unsigned(salida) = 52 then
					salida <= (others => '0');
				elsif cont = '1' then
					salida <= unsigned(salida) + 1;
				elsif cont = '0' then
					salida <= salida;
				end if;
			end if;
		end process;
	
end Behavioral;

