----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:40:11 10/14/2015 
-- Design Name: 
-- Module Name:    reconocedor_patron - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reconocedor_patron is
	port (rst : in STD_LOGIC;
			clk : in STD_LOGIC;
			x: in STD_LOGIC;
			Z: out STD_LOGIC);
end reconocedor_patron;

architecture rec of reconocedor_patron is

type estados is (S0,S1,S2,S3);

signal estado, est_siguiente:estados;


begin

	----------------------------------------------------
	process(clk, rst)
	begin
		if rst ='1' then
			estado <= '0';
	
		elsif rising_edge(clk) then
			estado <=est_siguiente;
	
		end if
	
		end process;
	
	-----------------------------------------------------
	process COMBINACIONAL(estado, X)
		begin
		
		case estado is
			when S0 =>
				if x = '1' then
					z <= '0';
					est_siguiente <= S0;
				else
					est_siguiente <= S1;
				end if;
				
		case estado is
			when S1 =>
				z <= '0';
				if x = '0' then
					est_siguiente <= S1;
				else
					est_siguiente <= S0;
				end if;
				
		case estado is
			when S2 =>
				if x = '1' then
					z <= '0';
					est_siguiente <= S3;
				else
					est_siguiente <= S2;
				end if;
				
		case estado is
			when S3 =>
				if X = '1' then
					z <= X;
					est_siguiente <= S1;
				else
					z <= '0';
					est_siguiente <= S0;
				end if;
				
		end case;
		end process;

end rec;

