----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    11:30:36 11/02/2015 
-- Design Name: 
-- Module Name:    GenericNadder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: diseño de sumador
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


entity adder is
   generic( N: natural := 16);
   port(X    : in std_logic_vector(N-1 downto 0);
	     Y    : in std_logic_vector(N-1 downto 0);
        cin  : in std_logic;
        S    : out std_logic_vector(N-1 downto 0);
        cout : out std_logic);
end adder;