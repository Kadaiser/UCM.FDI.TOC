----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    14:36:30 10/13/2015 
-- Design Name: 
-- Module Name:    RD - Behavioral 
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
------------------------------------------------------------
-- registro de desplazamiento entrada-salida paralelo
------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity reg_paralelo is
	port (rst, clk_100MHz, load: in std_logic;
		E: in std_logic_vector(3 downto 0);
		S: out std_logic_vector(3 downto 0));
end reg_paralelo;

architecture circuito of reg_paralelo is

signal clk_1Hz: std_logic;

component divisor is
port (rst, clk_100mhz: in STD_LOGIC;
clk_1hz: out STD_LOGIC);
end component;begin

Nuevo_reloj: divisor port map (rst, clk_100MHz, clk_1Hz);

--clk_1Hz <= clk_100MHz;
process(rst,clk_1Hz)
begin
	if rst='1' then
		S<="0000";
	elsif clk_1Hz'event and clk_1Hz='1' then
		if load='1' then
			S<=E;
		end if;
	end if;
end process;
end circuito;