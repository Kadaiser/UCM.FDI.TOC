----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:34:08 01/18/2016 
-- Design Name: 
-- Module Name:    Contador - Behavioral 
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


entity contador_asc_desc is
generic ( n : integer);
	port( clk		: in STD_LOGIC;
			reset		: in STD_LOGIC;
			load		: in STD_LOGIC;
			ce			: in STD_LOGIC;
			up_ndn	: in STD_LOGIC;
			din		: in STD_LOGIC_VECTOR(n-1 downto 0);
			dout		: out STD_LOGIC_VECTOR(n-1 downto 0)
	);

end contador_asc_desc;

architecture arch_Contador of contador_asc_desc is

signal almacenado : unsigned(n-1 downto 0);

begin
	dout <= STD_LOGIC_VECTOR(almacenado);
	
	process(clk, reset, load, ce, up_ndn, din)
		begin
			if reset = '1' then
				almacenado <= unsigned(din);
			elsif rising_edge(clk) then
				if load = '1' then
					almacenado <= unsigned(din);
				elsif ce = '1' then
						if up_ndn = '1' then
							almacenado <= almacenado + 1;
						else
							almacenado <= almacenado - 1;
						end if;
				end if;
			end if;
			
		end process;			
end arch_Contador;

