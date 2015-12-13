----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:37:08 11/29/2015 
-- Design Name: 
-- Module Name:    multiplexor - rtl 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:  Multiplexor generico de ((2**N)-1) entrada de bits
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


entity multiplexor is
	 generic (N : natural := 1);
    Port ( control : in  STD_LOGIC_VECTOR( N-1 downto 0);
           entrada : in  STD_LOGIC(((2**N)-1) downto 0);
           salida : out  STD_LOGIC);
end multiplexor;

architecture rtl of multiplexor is

begin

	salida <= datos(to_integrer(unsigned(control)));


end rtl;

