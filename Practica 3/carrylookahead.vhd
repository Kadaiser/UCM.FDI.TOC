----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    12:11:51 11/02/2015 
-- Design Name: 
-- Module Name:    carrylookahead - Behavioral 
-- Project Name: carryllokahead 1 nivel
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

architecture arch_add_uaa of adder is

   component FAGP
	    port ( cin : in std_logic;
              x   : in std_logic;
              y   : in std_logic;
              g   : out std_logic;
              p   : out std_logic;
              s   : out std_logic);
	end component;

	component uaa
	   port ( cin : in std_logic ;
             G   : in std_logic_vector (3 downto 0);
             P   : in std_logic_vector (3 downto 0);
             Cx  : out std_logic_vector (2 downto 0);
				 cout: out std_logic);
	end component;

	signal CarryG   : std_logic_vector(3 downto 0);
	signal CarryP   : std_logic_vector(3 downto 0);
	signal Carry    : std_logic_vector(n downto 0);
	signal CarryCx  : std_logic_vector(2 downto 0);
	signal CarryOut : std_logic; 
	
begin

   Carry(0) <= cin;

	
   uaaa: uaa port map(
							 cin  => cin,
							 G    => CarryG,
							 P    => CarryP,
							 Cx   => CarryCx,
							 cout => CarryOut);

   Carry(n-1 downto 1) <= CarryCx;

	
   gen1: for i in 0 to n-1 generate
	   FullAGP: FAGP port map (
		              cin => Carry(i),
		              x => op1(i),
		              y => op2(i),
		              g => CarryG(i),
		              p => CarryP(i),
						  s => add(i));
   end generate gen1;


	Carry(n) <= CarryOut;
	cout <= Carry(n);
end arch_add_uaa;

