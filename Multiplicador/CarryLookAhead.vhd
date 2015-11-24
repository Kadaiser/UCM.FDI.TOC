----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Diego Valbuena Pineda
-- 
-- Create Date:    12:11:34 11/16/2015 
-- Design Name: 
-- Module Name:    CarryLookAhead - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Sumador de 4 bits con anticipacion de acarreo.
--
-- Dependencies: 8BitsAdder
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CarryLookAhead is
	generic(N:natural := 4);
	port(	Op1	:	in STD_LOGIC_VECTOR(N-1 downto 0);
			Op2	:	in STD_LOGIC_VECTOR(N-1 downto 0);
			Cin	:	in STD_LOGIC;
			Add	:	out STD_LOGIC_VECTOR(N-1 downto 0);
			Cout	:	out STD_LOGIC);
end CarryLookAhead;

architecture Behavioral of CarryLookAhead is

component FullAdderGP
	port (	X	:	in STD_LOGIC;
				Y	:	in STD_LOGIC;
				Cin:	in	STD_LOGIC;
				G	:	out	STD_LOGIC;
				P	:	out	STD_LOGIC;
				S	:	out	STD_LOGIC);
end component;

component UAA
	port (	Cin:	in STD_LOGIC;
				G	:	in STD_LOGIC_VECTOR(N-1 downto 0);
				P	:	in	STD_LOGIC_VECTOR(N-1 downto 0);
				Cx	:	out STD_LOGIC_VECTOR(N-2 downto 0);
				Cout:	out STD_LOGIC);
end component;

--Señales de interconexion de señales externas dentro del modulo
signal CarryG	: STD_LOGIC_VECTOR(N-1 downto 0);
signal CarryP	: STD_LOGIC_VECTOR(N-1 downto 0);
signal Carry	: STD_LOGIC_VECTOR(N downto 0);
signal CarryCx	: STD_LOGIC_VECTOR(N-2 downto 0);
signal CarryOut: STD_LOGIC;

begin
	--Condicion de contorno
	Carry(0) <= Cin;

	--Conexion de señales al modulo UAAA
	UAA1:	UAA port map(	Cin	=> Cin,
								G		=>	CarryG,
								P		=>	CarryP,
								Cx		=>	CarryCx,
								Cout	=>	CarryOut);
	
	--Carry de anticipacion para los FAGP
	Carry(N-1 downto 0) <= CarryCx;
	
	--Interconexion en serie de los FullAdderGP a la UAA
	gen: for i in 0 to N-1 generate
		FAGP: FullAdderGP port map(	Cin	=> Carry(i),
												X		=>	Op1(i),
												Y		=>	Op2(i),
												G		=>	CarryG(i),
												P		=>	CarryP(i),
												S		=>	Add(i));
	end generate gen;
	--contorno final Carry N corresponde al CarryOut de UAA1 => Cout del modulo
	Carry(N) <=	CarryOut;
	cout <=	Carry(N);
	
end Behavioral;

