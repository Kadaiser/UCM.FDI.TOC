
-- VHDL Instantiation Created from source file sumador.vhd -- 11:34:03 10/15/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT sumador
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);          
		C : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_sumador: sumador PORT MAP(
		A => ,
		B => ,
		C => 
	);


