----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    11:35:45 11/16/2015 
-- Design Name: 
-- Module Name:    FullAdderGP - Behavioral 
-- Project Name: 	Multiplicador
-- Target Devices: 
-- Tool versions: 
-- Description: Sumador Completo de 1 bit con generacion de propagación de acarreo
--
-- Dependencies: UAA
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;


entity FullAdderGP is
	port (	X	:	in STD_LOGIC;
				Y	:	in STD_LOGIC;
				Cin:	in	STD_LOGIC;
				G	:	out	STD_LOGIC;
				P	:	out	STD_LOGIC;
				S	:	out	STD_LOGIC);
end FullAdderGP;

architecture Behavioral of FullAdderGP is

begin

	G <=	X and Y;
	P <=	X xor Y;
	S <=	(X xor Y) xor Cin;

end Behavioral;

