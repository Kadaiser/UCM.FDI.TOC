----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:37 01/18/2016 
-- Design Name: 
-- Module Name:    Algorithmic - Behavioral 
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

entity Algorithmic is
    Port ( reset 	: in  STD_LOGIC;
           inicio : in  STD_LOGIC;
           n 		: in  STD_LOGIC_VECTOR (4 downto 0);
           x 		: in  STD_LOGIC_VECTOR (15 downto 0);
           clk 	: in  STD_LOGIC;
           error 	: out  STD_LOGIC;
           fin 	: out  STD_LOGIC;
           y 		: out  STD_LOGIC_VECTOR (31 downto 0));
end Algorithmic;

architecture arch_Algorithmic of Algorithmic is

signal cntrl_wire		: STD_LOGIC_VECTOR(8 downto 0);
signal status_wire	: STD_LOGIC_VECTOR(1 downto 0);
signal X_wire			: STD_LOGIC_VECTOR(31 downto 0);

-------------------------------------------------------
--					COMPONENTS
-------------------------------------------------------
	
	component RutaDatos is
		generic(m: integer);
		port(
			clk 	: in STD_LOGIC;
			reset	: in STD_LOGIC;
			ctrl	: in STD_LOGIC_VECTOR(8 downto 0); --6+2 señales
			X		: in STD_LOGIC_VECTOR(31 downto 0);
			N		: in STD_LOGIC_VECTOR(4 downto 0);
			Y		: out STD_LOGIC_VECTOR(31 downto 0);
			status: out STD_LOGIC_VECTOR (1 downto 0)	
		);
	end component;
	
	component UnidadControl is
		port(
			clk	: in STD_LOGIC;
			rst	: in STD_LOGIC;
			inicio: in STD_LOGIC;
			status: in STD_LOGIC_VECTOR(1 downto 0);	
			ctrl	: out STD_LOGIC_VECTOR(8 downto 0);	
			fallo	: out STD_LOGIC;
			fin	: out STD_LOGIC
		);
	end component;

-------------------------------------------------------
--						FUNCTION
-------------------------------------------------------
begin

	X_wire <= "0000000000000000" & x;

-------------------------------------------------------
--						PORT MAPING
-------------------------------------------------------	
	RUTA_DATOS: RutaDatos generic map (m => 5) port map(
		clk 		=> clk,
		reset		=> reset,
		ctrl		=>	cntrl_wire,
		X			=> X_wire,
		N			=>	n,
		Y			=>	y,
		status	=>	status_wire
	);
	
	UNIDAD_CONTROL: UnidadControl port map(
		clk		=> clk,
		rst		=> reset,
		inicio	=>	inicio,
		status	=> status_wire,
		ctrl		=> cntrl_wire,
		fallo		=>	error,
		fin		=> fin
	);


end arch_Algorithmic;

