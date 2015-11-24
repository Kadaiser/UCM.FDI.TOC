----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    11:21:18 11/02/2015 
-- Design Name: 
-- Module Name:    fulladder - Behavioral 
-- Project Name: NAdder
-- Target Devices: 
-- Tool versions: 
-- Description: implementación del componente full adder para el uso N carry-ripple,lookahead de 1 y 2 niveles
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

entity FA is
port ( cin : in std_logic ;
       op1 : in std_logic ;
       op2 : in std_logic ;
       add : out std_logic ;
       cout : out std_logic );
end FA ;

architecture Behavioral of FA is

begin

	add <= op1 xor op2 xor cin;
	cout <= (op1 and op2) or (op1 and cin) or (op2 and cin);
	
end Behavioral;

