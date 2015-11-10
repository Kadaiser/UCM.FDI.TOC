----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    11:30:36 11/02/2015 
-- Design Name: 
-- Module Name:    GenericNadder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: diseño de sumador
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

entity adder is
   generic( N: natural := 16);
   port(X    : in std_logic_vector(N-1 downto 0);
	     Y    : in std_logic_vector(N-1 downto 0);
        cin  : in std_logic;
        S    : out std_logic_vector(N-1 downto 0);
        cout : out std_logic);
end adder;
architecture Behavioral of adder is

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