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
-- Description: full adder para el uso N carry-ripple,lookahead de 1 y 2 niveles
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

entity fa is
port (
		op1:	in	STD_LOGIC;
		op2:	in	STD_LOGIC;
		cin:	in	STD_LOGIC;
		add:	out STD_LOGIC;
		cout:	out STD_LOGIC
		);
end fa;

architecture Behavioral of fa is

begin

	add	<= op1 xor op2 xor cin;
	cout	<= (op1 and op2) or (op1 and cin) or (op2 and cin);

end Behavioral;

