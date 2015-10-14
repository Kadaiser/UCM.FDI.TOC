----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    16:20:22 10/13/2015 
-- Design Name: 
-- Module Name:    contador - Behavioral 
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

entity contador is
    Port (	rst, clk_100mhz, load: in std_logic;
				Z: out STD_LOGIC_VECTOR (3 downto 0));
end contador;

architecture Behavioral of contador is
	component reg_paralelo
	port(	rst, clk_100mhz, load: in std_logic;
			E: in STD_LOGIC_VECTOR (3 downto 0);
			S: out STD_LOGIC_VECTOR (3 downto 0));
	end component;
	component sumador
	port(	A: in STD_LOGIC_VECTOR (3 downto 0);
			B: in STD_LOGIC_VECTOR (3 downto 0);
			C: out STD_LOGIC_VECTOR (3 downto 0));
	end component;

	signal A: STD_LOGIC_VECTOR (3 downto 0); 
	signal Ssumador: STD_LOGIC_VECTOR (3 downto 0);
	signal C: STD_LOGIC_VECTOR (3 downto 0);
	
begin
	A <= "0001";
	mod_reg_paralelo: reg_paralelo port map(rst, clk_100mhz , load, C, Ssumador);
	mod_sumador: sumador port map (A, Ssumador ,C);
	Z <= Ssumador;


end Behavioral;

