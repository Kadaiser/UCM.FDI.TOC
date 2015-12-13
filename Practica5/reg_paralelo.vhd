----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:35:40 12/13/2015 
-- Design Name: 
-- Module Name:    reg_paralelo - Behavioral 
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

entity reg_paralelo is
	generic (n	:	natural);
    Port ( entrada	: in  STD_LOGIC_VECTOR(n-1 downto 0);
           clk			: in  STD_LOGIC;
           reset		: in  STD_LOGIC;
           load 		: in  STD_LOGIC;
           salida		: in  STD_LOGIC_VECTOR(n-1 downto 0)
			  );
end reg_paralelo;

architecture Behavioral of reg_paralelo is

begin

	process(clk, reset, load)
		begin
				if reset = '1' then
					salida <= (others => '0');
				elsif rising_edge (clk) then
					if load = '1' then
						salida <= entrada;
					elsif load = '0' then
						salida <= salida;
					end if;
				end if;
			end process;
			
end Behavioral;

