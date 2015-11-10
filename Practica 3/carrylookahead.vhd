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

entity carrylookahead is
   generic(n: natural := 4);
	port( op1,op2: in std_logic_vector (n-1 downto 0);
	      cin:     in std_logic;
			add:     out std_logic_vector (n-1 downto 0);
			cout:    out std_logic);
end carrylookahead;

architecture Behavioral of carrylookahead is
	--componente sumador
   component FullAdderGP
	    port ( cin : in std_logic;
              x   : in std_logic;
              y   : in std_logic;
              g   : out std_logic;
              p   : out std_logic;
              s   : out std_logic);
	end component;
	--componente uaa
	component uaa
	   port ( cin : in std_logic ;
             G   : in std_logic_vector (3 downto 0);
             P   : in std_logic_vector (3 downto 0);
             Cx  : out std_logic_vector (2 downto 0);
				 cout: out std_logic);
	end component;
	--señales intermedias
	signal CarryG   : std_logic_vector(3 downto 0);
	signal CarryP   : std_logic_vector(3 downto 0);
	signal Carry    : std_logic_vector(n downto 0);
	signal CarryCx  : std_logic_vector(2 downto 0);
	signal CarryOut : std_logic; 
	
begin
	--condiciones de contorno
   Carry(0) <= cin;
	
	-----------------------------------------------------------------------------
	--
	--    CarryCx(0) <= G(0) or (P(0) and cin);
	--    CarryCx(1) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and cin);
	--    CarryCx(2) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and cin);
	--    CarryOut   <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) and G(0)) or (P(3) and P(2) and P(1) and P(0) and cin);
	--
	--            CarryOut     ******************************
	--             |-----------*                            *<---cin
	--             |           *                            *
	--             v           *                            *
	--                         *            UAA             *
	--                         *                            *
	--                         *                            *
	--                         *                            *
	--                         ******************************
	--                          |                         ^
	-- CarryCx 2 downto 0 <-----|                         |----- <CarryG(G),CarryP(P)> 3 downto 0
	--
	--
	--
	------------------------------------------------------------------------------
	
   uaaa: uaa port map(
							 cin  => cin,
							 G    => CarryG,
							 P    => CarryP,
							 Cx   => CarryCx,
							 cout => CarryOut);
	
	--Carry de anticipación que pasamos a FAGP
   Carry(n-1 downto 1) <= CarryCx;
	
	------------------------------------------------------------------------------
	--
	--
	--                     Carry(i)
	--                        |
	--        op2(i) op1(i)   |   ^  ^       op2(i-1) op1(i-1)
	--             |    |     |   |  |           |    |
	-- carryP(i) **********   |   | carryP(i-1)**********
	-- |---------*        *   |   |  |---------*        *
	-- carryG(i) *  FAGP  *   |   | carryG(i-1)*  FAGP  *
	-- |---------*        *<--|   |------------*        *
	--           **********                    **********
	--               |                             |
	--              s(i)                           s(i-1)
	--
	--
	--
	--
   -------------------------------------------------------------------------------
	
   gen1: for i in 0 to n-1 generate
	   FAGP: FullAdderGP port map (
		              cin => Carry(i),
		              x => op1(i),
		              y => op2(i),
		              g => CarryG(i),
		              p => CarryP(i),
						  s => add(i));
   end generate gen1;
	--contorno final Carry n es carryOut de uaaa => cout del modulo
	Carry(n) <= CarryOut;
	cout <= Carry(n);
end Behavioral;

