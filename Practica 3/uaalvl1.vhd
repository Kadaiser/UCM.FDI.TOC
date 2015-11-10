----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    16:21:03 11/05/2015 
-- Design Name: 
-- Module Name:    uaalvl1 - Behavioral 
-- Project Name: Carrylookahead 2 niveles
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uaalvl1 is
   generic(n: natural := 3); 
   port ( cin  : in std_logic;
          G    : in std_logic_vector (3 downto 0);
          P    : in std_logic_vector (3 downto 0);
          Cx   : out std_logic_vector (2 downto 0);
          gout : out std_logic;
          pout : out std_logic);
end uaalvl1;

architecture Behavioral of uaalvl1 is

begin
			
			Cx(0) <= g(0) or (p(0) and cin);
	      Cx(1) <= g(1) or (p(1) and g(0)) or (p(1) and p(0) and cin);
	      Cx(2) <= g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and cin);
			gout <= G(3) or (G(2) and P(3)) or (G(1) and P(2) and P(3)) or (G(0) and P(1) and P(2) and P(3));
			pout <= P(3) and P(2) and P(1) and P(0);


end Behavioral;

