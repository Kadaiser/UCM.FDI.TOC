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

entity carrylookahead2 is
 generic(N: natural := 16);
	port( op1	 :  in std_logic_vector (N-1 downto 0);
			op2	 :  in std_logic_vector (N-1 downto 0);
	      cin    :  in std_logic;
			add    :  out std_logic_vector (N-1 downto 0);
			cout   :  out std_logic);
end carrylookahead2;

architecture Behavioral of carrylookahead2 is

--componentes 

component uaalvl1 
   port ( cin  : in std_logic;
          G    : in std_logic_vector (3 downto 0);
          P    : in std_logic_vector (3 downto 0);
          Cx   : out std_logic_vector (2 downto 0);
          gout : out std_logic;
          pout : out std_logic);
end component;

component uaalvl2 
   port (  cin  : in std_logic;
           Gs   : in std_logic_vector (3 downto 0);
           Pss  : in std_logic_vector (3 downto 0);
           Cx   : out std_logic_vector (2 downto 0);
           cout : out std_logic);
end component;

 component FullAdderGP
	    port ( cin : in std_logic;
              x   : in std_logic;
              y   : in std_logic;
              g   : out std_logic;
              p   : out std_logic;
              s   : out std_logic);
	end component;
	
	--señales intermedias
	
	--señales engloban los 4 uaa de primer nivel
	signal CarryG    : std_logic_vector (n-1 downto 0);
	signal CarryP    : std_logic_vector (n-1 downto 0);
	signal CarryCx   : std_logic_vector (n-1 downto 0);
	signal CarryOutP : std_logic_vector (3 downto 0);
	signal CarryOutG : std_logic_vector (3 downto 0);
	
	--uaa de nivel 2
	signal CarryOut  : std_logic_vector (2 downto 0);
	signal coutF      : std_logic;
	
	
begin
	
	--uuaa de nivel 1
	uaalvl1_1: uaalvl1 port map(
										 cin  => cin,
	                            G    => CarryG(3 downto 0),
										 P    => CarryP(3 downto 0),
										 Cx   => CarryCx(3 downto 1),
										 gout => CarryOutP(0),
										 pout => CarryOutG(0));
										 
	uaalvl1_2: uaalvl1 port map(
										 cin  => cin,
										 G    => CarryG(7 downto 4),
										 P    => CarryP(7 downto 4),
										 Cx   => CarryCx(7 downto 5),
										 gout => CarryOutP(1),
										 pout => CarryOutG(1));
										 
	uaalvl1_3: uaalvl1 port map(
										 cin  => cin,
										 G    => CarryG(11 downto 8),
										 P    => CarryP(11 downto 8),
										 Cx   => CarryCx(11 downto 9),
										 gout => CarryOutP(2),
										 pout => CarryOutG(2));
										 
	uaalvl1_4: uaalvl1 port map(
										 cin  => cin,
										 G    => CarryG(15 downto 12),
										 P    => CarryP(15 downto 12),
										 Cx   => CarryCx(15 downto 13),
										 gout => CarryOutP(3),
										 pout => CarryOutG(3));
	--uaa segundo nivel
	uaalvl2_1: uaalvl2 port map(
									  cin  => cin,
									  Gs   => CarryOutG,
									  Pss  => CarryOutP,
									  Cx   => CarryOut,
									  cout => coutF);
									  
--contorno para CarryCx acarreo intermedio
CarryCx(0) <= cin;
CarryCx(4) <= CarryOut(0);
CarryCx(8) <= CarryOut(1);	
CarryCx(12)<= CarryOut(2);		

	gen1: for i in 0 to n-1 generate
		FAGP: FullAdderGP port map (
		              cin => CarryCx(i),
		              x => op1(i),
		              y => op2(i),
		              g => CarryG(i),
		              p => CarryP(i),
						  s => add(i));
	end generate gen1;
--carry out final de uaa2	
cout <= coutF;
	
end Behavioral;

