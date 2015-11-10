----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    16:29:07 11/05/2015 
-- Design Name: 
-- Module Name:    uaalvl2 - Behavioral 
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
use IEEE.STD_LOgIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uaalvl2 is
generic(n : natural := 3);
    port ( cin  : in std_logic;
           Gs   : in std_logic_vector (3 downto 0);
           Pss  : in std_logic_vector (3 downto 0);
           Cx   : out std_logic_vector (2 downto 0);
           cout : out std_logic);
end uaalvl2;

architecture Behavioral of uaalvl2 is

begin

   Cx(0) <= Gs(0) or (Pss(0) and cin);
	Cx(1) <= Gs(1) or (Pss(1) and Gs(0)) or (Pss(1) and Pss(0) and cin);
	Cx(2) <= Gs(2) or (Pss(2) and Gs(1)) or (Pss(2) and Pss(1) and Gs(0)) or (Pss(2) and Pss(1) and Pss(0) and cin);
	cout  <= Gs(3) or (Pss(3) and Gs(2)) or (Pss(3) and Pss(2) and Gs(1)) or (Pss(3) and Pss(2) and Pss(1) and Gs(0)) or (Pss(3) and Pss(2) and Pss(1) and Pss(0) and cin);

end Behavioral;

