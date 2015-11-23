----------------------------------------------------------------------------------
-- Company: Facultad Informática de la Complutense
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    22:49:36 11/11/2015 
-- Design Name: 
-- Module Name:    adder
-- Project Name: Adder
-- Target Devices: 
-- Tool versions: 
-- Description: Interfaz del sumador de longitud N
--
-- Dependencies:
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

architecture adder_std of adder is

   signal X_i, Y_i, S_i: unsigned(N downto 0);
   signal Cin_i: unsigned(0 downto 0);
 
begin
   X_i <= unsigned("0" & X);
   Y_i <= unsigned("0" & Y);
   Cin_i <= "" & cin;
   S_i <= X_i + Y_i + Cin_i;
   S <= std_logic_vector(S_i(N-1 downto 0));
   Cout <= S_i(N);
end Behavioral;

