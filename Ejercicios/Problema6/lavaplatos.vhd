----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:22:41 10/16/2015 
-- Design Name: 
-- Module Name:    lavaplatos - Behavioral 
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

entity lavaplatos is
    Port ( clk : in  STD_LOGIC;
           start : in  STD_LOGIC;
           ciclo_rapido : in  STD_LOGIC;
           water_in : out  STD_LOGIC;
           water_hot : out  STD_LOGIC;
           aspas : out  STD_LOGIC;
           detergente : out  STD_LOGIC;
           dry : out  STD_LOGIC);
end lavaplatos;

architecture Behavioral of lavaplatos is

type estados is (inicial, lavado1, lavado2, lavado3, lavado4, aclarado1, aclarado2, secado);

signal estado, est_siguiente:estados;

	----------------------------------------------------
	SINCORONO: process(clk, rst)
	begin
		if start ='0' then
			estado <= inicial;
	
		elsif rising_edge(clk) then
			estado <= est_siguiente;
	
		end if
	
		end process SINCRONO;
	
	-----------------------------------------------------
	-----------------------------------------------------
	COMBINACIONAL: process (estado, ciclo_rapido) --ciclo_rapid es imprescindible para la correcta transicion de estados
		begin
		
		case estado is
			when inicial =>
				water_in 	<= '0';
				whater_hot 	<= '0';
				aspas 		<= '0';
				detergente 	<= '0';
				dry			<=	'0'
				est_siguiente 	<= lavado1;
				
			when lavado1=>
				water_in 	<= '1';
				whater_hot 	<= '1';
				aspas 		<= '1';
				detergente 	<= '0';
				dry			<=	'0'
				est_siguiente 	<= lavado2;
				
			when lavado2 =>
				water_in 	<= '0';
				whater_hot 	<= '0';
				aspas 		<= '1';
				detergente 	<= '1';
				dry			<=	'0'
				if ciclo_rapido then
				est_siguiente 	<= lavado3;
				else
				est_siguiente 	<= lavado4
				end if;
				
				
		end case;
		end process COMBINACIONAL;

end Behavioral;

