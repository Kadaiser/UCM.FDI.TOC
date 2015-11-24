----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    11:45:38 11/16/2015 
-- Design Name: 
-- Module Name:    UAA - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Unidad de anticipación de acarreo para sumador de 4 bits
--
-- Dependencies: carrylookhead
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity UAA is

	generic(N:natural := 4);
	
	port (	Cin:	in STD_LOGIC;
				G	:	in STD_LOGIC_VECTOR(N-1 downto 0);
				P	:	in	STD_LOGIC_VECTOR(N-1 downto 0);
				Cx	:	out STD_LOGIC_VECTOR(N-2 downto 0);
				Cout:	out STD_LOGIC);
end UAA;

architecture Behavioral of UAA is

begin

   Cx(0) <= G(0) or (P(0) and Cin);
   Cx(1) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and Cin);
   Cx(2) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and Cin);
   Cout  <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) and G(0)) or (P(3) and P(2) and P(1) and P(0) and Cin);
	
	
end Behavioral;

