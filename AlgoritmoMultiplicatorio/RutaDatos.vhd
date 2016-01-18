----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:24:03 01/18/2016 
-- Design Name: 
-- Module Name:    RutaDatos - Behavioral 
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

-------------------------------------------------------
-------------------------------------------------------

entity RutaDatos is

generic(m : integer);

	port(
		clk 	: in STD_LOGIC;
		reset	: in STD_LOGIC;
		ctrl	: in STD_LOGIC_VECTOR(8 downto 0); --6+2 señales
		X		: in STD_LOGIC_VECTOR(31 downto 0);
		N		: in STD_LOGIC_VECTOR(4 downto 0);
		Y		: out STD_LOGIC_VECTOR(31 downto 0);
		status: out STD_LOGIC_VECTOR (1 downto 0)	
	);

end RutaDatos;

-------------------------------------------------------
-------------------------------------------------------

architecture arch_RutaDatos of RutaDatos is

-------------------------------------------------------
--				CONTROL_UNIT-DATA_PATH	WIRES
-------------------------------------------------------

signal cntrl_wire		:STD_LOGIC_VECTOR(8 downto 0);
	alias rst			:STD_LOGIC is cntrl_wire(0);
	alias reg_ld		:STD_LOGIC is cntrl_wire(1);
	alias cont_ld		:STD_LOGIC is cntrl_wire(2);
	alias mux_op		:STD_LOGIC is cntrl_wire(3);
	alias ram_we		:STD_LOGIC is cntrl_wire(4);
	alias cont_ce		:STD_LOGIC is cntrl_wire(5);
	alias cont_ud		:STD_LOGIC is cntrl_wire(6);
	alias	alu_op1		:STD_LOGIC is cntrl_wire(7);
	alias alu_op2		:STD_LOGIC is cntrl_wire(8);
	
signal status_wire	:STD_LOGIC_VECTOR(1 downto 0);
	alias fail			:STD_LOGIC is status_wire(0);
	alias fin			:STD_LOGIC is status_wire(1);

-------------------------------------------------------
--					COMPONENTS
-------------------------------------------------------
	
	component contador_asc_desc is
		generic ( n : integer);
		port( 
				clk		: in STD_LOGIC;
				reset		: in STD_LOGIC;
				load		: in STD_LOGIC;
				ce			: in STD_LOGIC;
				up_ndn	: in STD_LOGIC;
				din		: in STD_LOGIC_VECTOR(n-1 downto 0);
				dout		: out STD_LOGIC_VECTOR(n-1 downto 0)
		);
	end component;
	
	component ram_memory is
		port( 
			  clk		: in  std_logic;
			  we		: in  std_logic;
			  addr	: in  std_logic_vector(4 downto 0);
			  din		: in  std_logic_vector(15 downto 0);
			  dout	: out std_logic_vector(15 downto 0)
		);
	end component;

	component Registro is
		port ( 
			  clk 		: in  STD_LOGIC;
           reg_ld 	: in  STD_LOGIC;
           rst 		: in  STD_LOGIC;
           reg_in 	: in  STD_LOGIC_VECTOR(31 downto 0);
           reg_out 	: out  STD_LOGIC_VECTOR(31 downto 0)
			  );
	end component;
	
	component ALU is
		port(	
				op1		: in STD_LOGIC_VECTOR(15 downto 0);
				op2		: in STD_LOGIC_VECTOR(31 downto 0);
				alu_out	: out STD_LOGIC_VECTOR(31 downto 0);
				alu_op	: in STD_LOGIC_VECTOR(1 downto 0)	
			);
	end component;
	
	component Multiplexor is
		port( 
				op1	: in STD_LOGIC_VECTOR(31 downto 0);
				op2	: in STD_LOGIC_VECTOR(31 downto 0);
				op		: in STD_LOGIC;
				dout	: out STD_LOGIC_VECTOR(31 downto 0)
		);
	end component;
-------------------------------------------------------
--						DATA_PAHT  WIRES
-------------------------------------------------------
	signal cont_ram_wire :STD_LOGIC_VECTOR(m-1 downto 0);
	signal ram_alu_wire	:STD_LOGIC_VECTOR(15 downto 0);
	signal alu_mux_wire	:STD_LOGIC_VECTOR(31 downto 0);
	signal mux_reg_wire	:STD_LOGIC_VECTOR(31 downto 0);
	signal reg_alu_wire 	:STD_LOGIC_VECTOR(31 downto 0);
	signal alu_op_wire	:STD_LOGIC_VECTOR(1 downto 0);

-------------------------------------------------------
--						FUNCTION
-------------------------------------------------------
begin

	alu_op_wire <= alu_op1 & alu_op2; --conexion control ALU
-------------------------------------------------------
--						PORT MAPING
-------------------------------------------------------
	CONT: contador_asc_desc generic map(n => m) port map(
		clk		=>	clk,
		reset		=> reset,
		load		=>	cont_ld,
		ce			=> cont_ce,
		up_ndn	=> cont_ud,
		din		=>	N,
		dout		=> cont_ram_wire		
	);
	
	RAM:	ram_memory port map(
		clk		=> clk,
		we			=>	ram_we,
		addr		=> cont_ram_wire,
		din		=> "0000000000000000",
		dout		=> ram_alu_wire
	);
	
	REG: Registro port map(
		clk 			=> clk,
		reg_ld		=> reg_ld,
		rst			=>	reset,
		reg_in		=>	mux_reg_wire,
		reg_out		=> reg_alu_wire
	);

	ALU_U:	ALU port map(	
			op1		=> ram_alu_wire,
			op2		=> reg_alu_wire,
			alu_out	=> alu_mux_wire,
			alu_op	=> alu_op_wire
	);
	
	MUX: Multiplexor port map( 
			op1		=> alu_mux_wire,
			op2		=> X,
			op			=> mux_op,
			dout		=> mux_reg_wire
	);
	
	fail	<= '1' when	unsigned(cont_ram_wire) = 0 and unsigned(X) = 0 else '0';
	fin	<= '1' when unsigned(cont_ram_wire) = 0	else '0';
	
	cntrl_wire <= ctrl;
	status <= status_wire;
	Y <=  reg_alu_wire;
	
end arch_RutaDatos;
