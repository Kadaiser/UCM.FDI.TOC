----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:22:40 12/13/2015 
-- Design Name: 
-- Module Name:    Ruta_datos - Behavioral 
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


entity Ruta_datos is
	generic(n_reg_zero, n_reg_perder, n_reg_acc, n_RAM, n_sum, n_display, n_cont: natural );
    Port ( clk 			: in  STD_LOGIC;
           reset 			: in  STD_LOGIC;
           control 		: in  STD_LOGIC_VECTOR(8 downto 0);
           din_ram 		: in  STD_LOGIC_VECTOR(n_RAM -1 downto 0);
           cartaActual 	: out  STD_LOGIC_VECTOR(n_display -1 downto 0);
           acc_unidades : out  STD_LOGIC_VECTOR(n_display -1 downto 0);
           acc_decenas 	: out  STD_LOGIC_VECTOR(n_display -1 downto 0);
           estado 		: out  STD_LOGIC_VECTOR(1 downto 0)
			  );
end Ruta_datos;

architecture Behavioral of Ruta_datos is

	component Cont_mod is
		generic(n : natural);
			port(	reset		:	in STD_LOGIC;
					cont		:	in STD_LOGIC;
					clk		:	in STD_LOGIC;
					salida	:	in STD_LOGIC_VECTOR(n-1 downto 0)
					);
	
	end component;


	component conv_7seg is
	    port (	x 			: in   STD_LOGIC_VECTOR (3 downto 0);
					display	: out  STD_LOGIC_VECTOR (6 downto 0)
				);
	end component;
	
	
	component mem_ram is
	    Port ( 	clk		: in	STD_LOGIC;
					we			: in	STD_LOGIC;
					din		: in	STD_LOGIC_VECTOR(3 downto 0);
					dout		: out	STD_LOGIC_VECTOR(3 downto 0)
						);
	end component;
	
	
	component reg_paralelo is 
		generic (n	:	natural);
		Port ( entrada	: in  STD_LOGIC_VECTOR(n-1 downto 0);
				 clk 		: in  STD_LOGIC;
				 reset 	: in  STD_LOGIC;
				 load 		: in  STD_LOGIC;
				 salida 	: in  STD_LOGIC_VECTOR(n-1 downto 0)
				 );
	end component;
	
	
	component sumador_simple is
		generic(n : natural);
		Port ( ope1	 	: in  STD_LOGIC_VECTOR(n-1 downto 0);
				 ope2 		: in  STD_LOGIC_VECTOR(n-1 downto 0);
				 resultado : out  STD_LOGIC_VECTOR(n-1 downto 0)
				 );
	end component;
	
begin

	RAM: mem_ram port map(
					clk	=>
					we		=>
					din	=>
					dout 	=>
	);
end Behavioral;

