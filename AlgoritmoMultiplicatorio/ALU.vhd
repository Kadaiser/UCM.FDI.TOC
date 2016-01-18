----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:33:33 01/18/2016 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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


entity ALU is
	port(	op1		: in STD_LOGIC_VECTOR(15 downto 0);
			op2		: in STD_LOGIC_VECTOR(31 downto 0);
			alu_out	: out STD_LOGIC_VECTOR(31 downto 0);
			alu_op	: in STD_LOGIC_VECTOR(1 downto 0)	
		);
end ALU;

architecture arch_ALU of ALU is
---------------------------------------------
--				SEÑALES REDIMENSIONADAS
---------------------------------------------
signal op1_resize:	unsigned(op1'range);		--Range es palabra reservada de sistema
signal op2_resize:	unsigned(op2'range); 	--Con la GRAN e INTUITIVA sintaxis de Xilinx 
signal out_resize:	unsigned(alu_out'range);	--Nos permite trabajar señales de distitno tamaño en la entidad

begin

	op1_resize <= unsigned(op1);
	op2_resize <= unsigned(op2);
	alu_out <= STD_LOGIC_VECTOR(out_resize);


	operacion : process(alu_op, op1, op2)
	begin
	
		if alu_op = "00" then 
			out_resize <=	resize((op1_resize * op2_resize), out_resize'length);
		elsif alu_op = "01" then
			out_resize <=	resize((op1_resize + op2_resize), out_resize'length);
		elsif alu_op = "10" then
			out_resize <=	resize((op1_resize and op2_resize), out_resize'length);
		else
			out_resize <=	resize((op1_resize or op2_resize), out_resize'length);
		end if;
	end process operacion;

end arch_ALU;

