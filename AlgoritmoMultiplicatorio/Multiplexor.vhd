----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:34 01/18/2016 
-- Design Name: 
-- Module Name:    Multiplexor - Behavioral 
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

entity Multiplexor is
	port( op1	: in STD_LOGIC_VECTOR(31 downto 0);
			op2	: in STD_LOGIC_VECTOR(31 downto 0);
			op		: in STD_LOGIC;
			dout	: out STD_LOGIC_VECTOR(31 downto 0)
		);

end Multiplexor;

architecture arch_Multiplexor of Multiplexor is
	
begin

	multiplexar : process(op,op1,op2)
		begin
			if op = '0' then
				dout <= op1;
			else
				dout<= op2;
			end if;
		end process multiplexar;
end arch_Multiplexor;

