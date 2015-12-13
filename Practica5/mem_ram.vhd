----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:15:23 12/13/2015 
-- Design Name: 
-- Module Name:    mem_ram - Behavioral 
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

entity mem_ram is
    Port ( clk		: in	STD_LOGIC;
           we		: in	STD_LOGIC;
           din		: in	STD_LOGIC_VECTOR(3 downto 0); --4 bits para 16 accesos
           dout	: out	STD_LOGIC_VECTOR(3 downto 0)
			  );
end mem_ram;

architecture Behavioral of mem_ram is
	type ram_type is array (0 to 63) of STD_LOGIC_VECTOR(3 downto 0);
	signal RAM : ram_type :=(
	X"1", X"2", X"3", X"4", X"5", X"6", X"7", X"8", X"9", X"A", X"A", X"A", X"A",
	X"1", X"2", X"3", X"4", X"5", X"6", X"7", X"8", X"9", X"A", X"A", X"A", X"A",
	X"1", X"2", X"3", X"4", X"5", X"6", X"7", X"8", X"9", X"A", X"A", X"A", X"A",
	X"1", X"2", X"3", X"4", X"5", X"6", X"7", X"8", X"9", X"A", X"A", X"A", X"A",
	X"0", X"0", X"0", X"0", X"0", X"0", X"0", X"0", X"0", X"0", X"0", X"0"
	);

begin

		process (clk)
			begin
				if rising_edge(clk) then
					if we = '1'  then
						RAM(to_integrer(unsigned(addr))) <= din;
					else
						dout <= RAM(to_integrer(unsigned(addr)));
					end if;
				end if;
		end process;
			
end Behavioral;

