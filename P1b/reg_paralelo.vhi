
-- VHDL Instantiation Created from source file reg_paralelo.vhd -- 15:36:46 10/13/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT reg_paralelo
	PORT(
		rst : IN std_logic;
		clk_100MHz : IN std_logic;
		load : IN std_logic;
		E : IN std_logic_vector(7 downto 0);          
		S : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_reg_paralelo: reg_paralelo PORT MAP(
		rst => ,
		clk_100MHz => ,
		load => ,
		E => ,
		S => 
	);


