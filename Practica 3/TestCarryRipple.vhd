--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:02:05 11/09/2015
-- Design Name:   
-- Module Name:   C:/Xilinx/Projects/adder/adder/adder/TestCarryRipple.vhd
-- Project Name:  adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: carryRipple
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
 
ENTITY TestCarryRipple IS
END TestCarryRipple;
 
ARCHITECTURE behavior OF TestCarryRipple IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT carryRipple
    PORT(
         op1 : IN  std_logic_vector(15 downto 0);
         op2 : IN  std_logic_vector(15 downto 0);
         cin : IN  std_logic;
         add : OUT  std_logic_vector(15 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal op1 : std_logic_vector(15 downto 0) := (others => '0');
   signal op2 : std_logic_vector(15 downto 0) := (others => '0');
   signal cin : std_logic := '0';
	signal clk : std_logic;

 	--Outputs
   signal add : std_logic_vector(15 downto 0);
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: carryRipple PORT MAP (
          op1 => op1,
          op2 => op2,
          cin => cin,
          add => add,
          cout => cout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		   for v_i in 0 to ((2**16)-1) loop
		       for v_j in 0 to ((2**16)-1) loop
				    op1 <= std_logic_vector(to_unsigned(v_i,16));
                op2 <= std_logic_vector(to_unsigned(v_j,16));
				    cin <= '1';
                wait for 10 ns;
			    end loop;
			   wait for 10 ns;
         end loop;
      wait;
   end process;

END;
