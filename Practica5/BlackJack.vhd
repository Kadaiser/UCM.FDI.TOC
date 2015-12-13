----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:20:41 12/13/2015 
-- Design Name: 
-- Module Name:    BlackJack - Behavioral 
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

entity BlackJack is
    Port ( 	reset				: in	STD_LOGIC;
				Inicio 			: in	STD_LOGIC;
				Otra_carta 		: in	STD_LOGIC;
				ready 			: out	STD_LOGIC;
				Plantarse 		: in	STD_LOGIC;
				carta_error		: out	STD_LOGIC;
				Perdido 			: out	STD_LOGIC;
				Carta_actual 	: out	STD_LOGIC_VECTOR(3 downto 0); -- 4 bits para valores entre 0 a 10
				Acumulado 		: out	STD_LOGIC_VECTOR(4 downto 0)); -- 5 bits para valores entre 0 a 21
end BlackJack;

architecture Behavioral of BlackJack is

begin


end Behavioral;

