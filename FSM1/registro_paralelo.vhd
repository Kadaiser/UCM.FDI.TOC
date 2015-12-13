----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:10:50 11/29/2015 
-- Design Name: 
-- Module Name:    registro_multifuncion - registro 
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

entity registro_multifuncion is
	 generic (N : natural := 3);
    Port ( entrada : 		in  STD_LOGIC_VECTOR (N-1 downto 0);
           salida : 			out  STD_LOGIC_VECTOR (N-1 downto 0);
           rst : 				out  STD_LOGIC_VECTOR;
			  load:				in  STD_LOGIC_VECTOR;
           clk : 				in  STD_LOGIC_VECTOR;
           clear : 			in  STD_LOGIC_VECTOR;
           shift_left : 	in  STD_LOGIC_VECTOR;
           shift_rigth : 	in  STD_LOGIC_VECTOR;
           insert_left : 	in  STD_LOGIC_VECTOR;
           insert_right : 	in  STD_LOGIC_VECTOR;
           insert_in : 		in  STD_LOGIC_VECTOR);
			  
end registro_multifuncion;

architecture registro of registro_multifuncion is

signal desplazamiento_l, desplazamiento_r : STD_LOGIC_VECTOR;

	component multiplexor
		port(	control: in 	STD_LOGIC_VECTOR;
				entrada: in 	STD_LOGIC_VECTOR(1 downto 0);
				salida:	out	STD_LOGIC_VECTOR);
		end component;

begin
	

end registro;

