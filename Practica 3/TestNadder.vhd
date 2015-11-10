--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:31:57 11/09/2015
-- Design Name:   
-- Module Name:   C:/Xilinx/Projects/adder/adder/adder/TestNadder.vhd
-- Project Name:  adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY TestNadder IS
END TestNadder;
 
ARCHITECTURE behavior OF TestNadder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder
    PORT(
         X : IN  std_logic_vector(15 downto 0);
         Y : IN  std_logic_vector(15 downto 0);
         cin : IN  std_logic;
         S : OUT  std_logic_vector(15 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(15 downto 0) := (others => '0');
   signal Y : std_logic_vector(15 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(15 downto 0);
   signal cout : std_logic;
   signal clk_100MHz : std_logic;
   constant clk_100MHz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adder PORT MAP (
          X => X,
          Y => Y,
          cin => cin,
          S => S,
          cout => cout
        );
		  
	reloj_process :process
    begin
        clk_100MHz <= '0';
        wait for clk_100MHz_period/2;
        clk_100MHz <= '1';
        wait for clk_100MHz_period/2;
    end process;

   process
      begin	
         wait for 10 ns;		
		   for v_i in 0 to ((2**16)-1) loop
		       for v_j in 0 to ((2**16)-1) loop
				    X <= std_logic_vector(to_unsigned(v_i,16));
                Y <= std_logic_vector(to_unsigned(v_j,16));
				    cin <= '1';
                wait for 10 ns;
			    end loop;
			   wait for 10 ns;
			end loop;
      wait;
   end process;

END;
