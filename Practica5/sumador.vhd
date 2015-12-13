----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:05:25 12/13/2015 
-- Design Name: 
-- Module Name:    sumador_simple - Behavioral 
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

entity sumador_simple is
	generic(n : natural);
    Port ( ope1	 	: in  STD_LOGIC_VECTOR(n-1 downto 0);
           ope2 		: in  STD_LOGIC_VECTOR(n-1 downto 0);
           resultado : out  STD_LOGIC_VECTOR(n-1 downto 0)
			  );
end sumador_simple;

architecture Behavioral of sumador_simple is

begin
	
	resultado <= STD_LOGIC_VECTOR(unsigned(ope1) + unsigned(ope2));

end Behavioral;

