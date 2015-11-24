----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    16:37:36 11/05/2015 
-- Design Name: 
-- Module Name:    carrylookahead2 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: sumador con anticipación de arrastres
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


architecture arch_add16_2uaa of adder is



component uaa1 
   port ( cin  : in std_logic;
          G    : in std_logic_vector (3 downto 0);
          P    : in std_logic_vector (3 downto 0);
          Cx   : out std_logic_vector (2 downto 0);
          gout : out std_logic;
          pout : out std_logic);
end component;

component uaa2 
   port (  cin  : in std_logic;
           Gs   : in std_logic_vector (3 downto 0);
           Pss  : in std_logic_vector (3 downto 0);
           Cx   : out std_logic_vector (2 downto 0);
           cout : out std_logic);
end component;

 component FAGP
	    port ( cin : in std_logic;
              x   : in std_logic;
              y   : in std_logic;
              g   : out std_logic;
              p   : out std_logic;
              s   : out std_logic);
	end component;
	

	signal CarryG    : std_logic_vector (N-1 downto 0);
	signal CarryP    : std_logic_vector (N-1 downto 0);
	signal CarryCx   : std_logic_vector (N-1 downto 0);
	signal CarryOutP : std_logic_vector (3 downto 0);
	signal CarryOutG : std_logic_vector (3 downto 0);
	

	signal CarryOut  : std_logic_vector (2 downto 0);
	signal coutF      : std_logic;
	
	
begin
	

	uaa1_1: uaa1 port map(
										 cin  => cin,
	                            G    => CarryG(3 downto 0),
										 P    => CarryP(3 downto 0),
										 Cx   => CarryCx(3 downto 1),
										 gout => CarryOutP(0),
										 pout => CarryOutG(0));
										 
	uaa1_2: uaa1 port map(
										 cin  => cin,
										 G    => CarryG(7 downto 4),
										 P    => CarryP(7 downto 4),
										 Cx   => CarryCx(7 downto 5),
										 gout => CarryOutP(1),
										 pout => CarryOutG(1));
										 
	uaa1_3: uaa1 port map(
										 cin  => cin,
										 G    => CarryG(11 downto 8),
										 P    => CarryP(11 downto 8),
										 Cx   => CarryCx(11 downto 9),
										 gout => CarryOutP(2),
										 pout => CarryOutG(2));
										 
	uaa1_4: uaa1 port map(
										 cin  => cin,
										 G    => CarryG(15 downto 12),
										 P    => CarryP(15 downto 12),
										 Cx   => CarryCx(15 downto 13),
										 gout => CarryOutP(3),
										 pout => CarryOutG(3));

	uaa_2: uaa2 port map(
									  cin  => cin,
									  Gs   => CarryOutG,
									  Pss  => CarryOutP,
									  Cx   => CarryOut,
									  cout => coutF);

CarryCx(0) <= cin;
CarryCx(4) <= CarryOut(0);
CarryCx(8) <= CarryOut(1);	
CarryCx(12)<= CarryOut(2);		

	gen: for i in 0 to n-1 generate
		FullAGP: FAGP port map (
		              cin => CarryCx(i),
		              x => op1(i),
		              y => op2(i),
		              g => CarryG(i),
		              p => CarryP(i),
						  s => add(i));
	end generate gen;
	
cout <= coutF;
	
end arch_add16_2uaa;

