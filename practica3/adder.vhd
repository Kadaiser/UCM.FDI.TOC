----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:55:03 11/08/2015 
-- Design Name: 
-- Module Name:    adder - Behavioral 
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

entity adder is
	generic (N : natural := 16);
	port( X:		in std_logic_vector(N-1 downto 0);
			Y:		in std_logic_vector(N-1 downto 0);
			cin: 	in std_logic;
			S:		out std_logic_vector (N-1 downto 0);
			cout:	out std_logic
		);
end adder;

architecture adder_std of adder is
	signal X_i, Y_i, S_i: unsigned (N downto 0);
	signal c_i: unsigned (0 downto 0);

begin
	X_i <= unsigned("0" & X);
	Y_i <= unsigned("0" & Y);
	c_i <= "" & cin;
	S_i <= X_i + Y_i + c_i;
	
	S <= std_logic_vector(S_i(N-1 downto 0));
	cout <= S_i(N);
	
end adder_std;

