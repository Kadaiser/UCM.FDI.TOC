----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    11:30:36 11/02/2015 
-- Design Name: 
-- Module Name:    carry-ripple - Behavioral 
-- Project Name: Nadder
-- Target Devices: 
-- Tool versions: 
-- Description: sumador con propagacion de arrastre
--
-- Dependencies: full_adder
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


architecture arch_add_ripple of adder is
   
	component FA
	port ( cin  : in std_logic;
          op1  : in std_logic;
          op2  : in std_logic;
          add  : out std_logic;
          cout : out std_logic);
   end component;

   signal Carry: std_logic_vector (N downto 0);

begin
   Carry(0) <= cin;

	gen1: for i in 0 to n-1 generate
	   FullA: FA port map (
		              cin => Carry(i),
		              op1 => op1(i),
		              op2 => op2(i),
						  add => add(i),
		              cout => Carry(i+1));
   end generate gen1;
	cout <= Carry(n);
end arch_add_ripple;

