----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:12:57 11/08/2015 
-- Design Name: 
-- Module Name:    fa_gp - Behavioral 
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

entity fa_gp is
    Port ( x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           g : out  STD_LOGIC;
           p : out  STD_LOGIC;
           s : out  STD_LOGIC);
end fa_gp;

architecture Behavioral of fa_gp is

begin

	g <= x and y;
	p <= x xor y;
	s <= (x xor y) xor cin;

end Behavioral;

