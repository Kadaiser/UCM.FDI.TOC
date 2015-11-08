----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:14:28 11/08/2015 
-- Design Name: 
-- Module Name:    uaa - Behavioral 
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

entity uaa is
		 Port ( Cin : in  STD_LOGIC;
					G	:	in std_logic_vector(3 downto 0);
					P	:	in std_logic_vector(3 downto 0);
					Cx	:	out std_logic_vector(2 downto 0);
				  Cout : out  STD_LOGIC);
	end uaa;

architecture Behavioral of uaa is

component fa_gp is
		Port ( x : in  STD_LOGIC;
					  y : in  STD_LOGIC;
					  cin : in  STD_LOGIC;
					  g : out  STD_LOGIC;
					  p : out  STD_LOGIC;
					  s : out  STD_LOGIC);
		end component;



begin


end Behavioral;

