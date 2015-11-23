----------------------------------------------------------------------------------
-- Company: Facultad Informática de la Complutense
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    22:49:36 11/11/2015 
-- Design Name: 
-- Module Name:    fa_gp - Behavioral 
-- Project Name: Adder
-- Target Devices: 
-- Tool versions: 
-- Description: Sumador completo con generacion y propagacion de acarreo
--
-- Dependencies: uaa module
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FA_GP is
   port ( cin : in std_logic;
          x   : in std_logic;
          y   : in std_logic;
          g   : out std_logic;
          p   : out std_logic;
          s   : out std_logic);

end FA_GP;

architecture Behavioral of FA_GP is

begin

   g <= x and y;
	p <= (x xor y);
	s <= (x xor y) xor cin;

end Behavioral;