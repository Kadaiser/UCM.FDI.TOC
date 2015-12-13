----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:01:37 11/29/2015 
-- Design Name: 
-- Module Name:    reconocedor_clave - Behavioral 
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


entity reconocedor_clave is
    Port ( reset : 	in  STD_LOGIC;
           clk : 		in  STD_LOGIC;
           cambio :	in  STD_LOGIC;
           acierto :	out  STD_LOGIC;
           P :			in  STD_LOGIC;
           B :			in  STD_LOGIC);
end reconocedor_clave;

architecture Behavioral of reconocedor_clave is

	--Posibles estados
	type estados is (inicio, carga, desplazar1, desplazar2. desplazar3, desplazar4, comparar);
	--Señales de transicion de estados
	signal estado, estado_siguiente: estados;
begin

--===============================================--
---------Proceso de transicion de estados----------
--===============================================--
	process (clk, reset)
	begin
		if reset = '1' then
			estado <= inicio;
		elsif rising_edge (clk) then
			estado <= estado_siguiente;
		end if;
	end process;
	
--===============================================--
---------Proceso de siguiente estado---------------
--===============================================--

	combinacional : process ()


end Behavioral;

