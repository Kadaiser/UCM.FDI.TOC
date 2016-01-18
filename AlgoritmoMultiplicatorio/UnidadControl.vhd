----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:48 01/18/2016 
-- Design Name: 
-- Module Name:    UnidadControl - Behavioral 
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


entity UnidadControl is
	port( 
			clk	: in STD_LOGIC;
			rst	: in STD_LOGIC;
			inicio: in STD_LOGIC;
			status: in STD_LOGIC_VECTOR(1 downto 0);	
			ctrl	: out STD_LOGIC_VECTOR(8 downto 0);	
			fallo	: out STD_LOGIC;
			fin	: out STD_LOGIC
	);
end UnidadControl;

architecture arch_UnidadControl of UnidadControl is

-------------------------------------------------------
--				SEÑALES CONTROL DE RUTA DE DATOS
-------------------------------------------------------
signal cntrl_wire		:STD_LOGIC_VECTOR(8 downto 0);
	alias reset			:STD_LOGIC is cntrl_wire(0);
	alias reg_ld		:STD_LOGIC is cntrl_wire(1);
	alias cont_ld		:STD_LOGIC is cntrl_wire(2);
	alias mux_op		:STD_LOGIC is cntrl_wire(3);
	alias ram_we		:STD_LOGIC is cntrl_wire(4);
	alias cont_ce		:STD_LOGIC is cntrl_wire(5);
	alias cont_ud		:STD_LOGIC is cntrl_wire(6);
	alias	alu_op1		:STD_LOGIC is cntrl_wire(7);
	alias alu_op2		:STD_LOGIC is cntrl_wire(8);
-------------------------------------------------------
--				SEÑALES DE ESTADO DE RUTA DE DATOS
-------------------------------------------------------
signal status_wire	:STD_LOGIC_VECTOR(1 downto 0);
	alias fail_s			:STD_LOGIC is status_wire(0);
	alias final_s			:STD_LOGIC is status_wire(1);
	
-------------------------------------------------------
--						ESTADOS
-------------------------------------------------------
	type estado is (iniciar, carga, loadWait, contarDescendente, ramWait, multiplicar, incorrecto);
	signal estado_actual, estado_siguiente: estado;

begin

-------------------------------------------------------
--					TRANSICION DE ESTADOS
-------------------------------------------------------

	Transitar_estados : process (clk, rst) is
	
	begin
		if rst = '1' then
			estado_actual <= iniciar;
		elsif rising_edge (clk) then
			estado_actual <= estado_siguiente;
		end if;
	end process Transitar_estados;

-------------------------------------------------------
--					MAQUINA DE ESTADOS
-------------------------------------------------------
	Maquina_estados : process(clk, rst, inicio, estado_actual, fail_s, final_s)
	
	begin
	
	cntrl_wire <= (others => '0');
	fin <= '0';
	fallo <= '0';
	
	case estado_actual is
	
		when iniciar =>
			fin 		<= '1';
			reset 	<= '1';
			if inicio = '0' then
				estado_siguiente <= iniciar;
			else
				estado_siguiente <= carga;
			end if;
-------------------------------------------------------		
		when carga =>
			fin		<= '0';
			mux_op 	<= '1';
			reg_ld	<= '1';
			cont_ld 	<= '1';
	
			estado_siguiente <= loadWait;
-------------------------------------------------------		
		when loadWait =>
			reg_ld	<= '0';
			cont_ld 	<= '0';
			
			if fail_s = '1' then
				estado_siguiente <= incorrecto;
			else
				estado_siguiente <= contarDescendente;
			end if;
-------------------------------------------------------		
		when contarDescendente =>
			cont_ce	<= '1';
			cont_ud	<= '0';		
			estado_siguiente <= ramWait;
-------------------------------------------------------
		when ramWait =>
			cont_ce <= '0';
			estado_siguiente <= multiplicar;
-------------------------------------------------------
		when multiplicar =>
			mux_op 	<= '0';
			reg_ld 	<= '1';
			alu_op1 	<= '0'; --Se considera Producto
			alu_op2 	<= '0'; --Se considera Producto
			
			if final_s = '1' then
				estado_siguiente <= iniciar;
			else
				estado_siguiente <= contarDescendente;
			end if;
-------------------------------------------------------
		when incorrecto =>
			fallo <= '1';
-------------------------------------------------------
		end case;
	end process Maquina_estados;


	ctrl 			<= cntrl_wire;
	status_wire <= status;


end arch_UnidadControl;

