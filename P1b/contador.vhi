
-- VHDL Instantiation Created from source file contador.vhd -- 17:41:01 10/13/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT contador
	PORT(
		rst : IN std_logic;
		clk_100mhz : IN std_logic;
		load : IN std_logic;          
		Z : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_contador: contador PORT MAP(
		rst => ,
		clk_100mhz => ,
		load => ,
		Z => 
	);


