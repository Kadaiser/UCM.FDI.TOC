--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:16:17 11/09/2015
-- Design Name:   
-- Module Name:   C:/Xilinx/Projects/adder/adder/adder/TestCarryLookAhead2.vhd
-- Project Name:  adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: carrylookahead2
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
 
ENTITY TestCarryLookAhead2 IS
END TestCarryLookAhead2;
 
ARCHITECTURE behavior OF TestCarryLookAhead2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT carrylookahead2
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

 	--Outputs
   signal add : std_logic_vector(15 downto 0);
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
	signal clk : std_logic;
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: carrylookahead2 PORT MAP (
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
       for v_i in 0 to ((2**3)-1) loop
		       for v_j in 0 to ((2**3)-1) loop
				    op1 <= std_logic_vector(to_unsigned(v_i,4));
                op2 <= std_logic_vector(to_unsigned(v_j,4));
				    cin <= '1';
                wait for 10 ns;
			    end loop;
			   wait for 10 ns;
         end loop;
      wait;
   end process;

END;
