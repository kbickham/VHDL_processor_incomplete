--------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CPU IS
Port (	Reset : IN  std_logic :='0';
         Clock : IN  std_logic;
			alus : OUT STD_LOGIC_VECTOR (3 DOWNTO 0); --for testing
			MEMaddOUT,CPUOUT : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			MEMOUT : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
			);

END CPU;
 
ARCHITECTURE behavior OF CPU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         SEL : IN  std_logic_vector(3 downto 0) := "0000";
         A : IN  std_logic_vector(3 downto 0):= "0000";
         B : IN  std_logic_vector(3 downto 0):= "0000";
         Z : OUT  std_logic_vector(3 downto 0):= "0000";
         COMP : OUT  std_logic_vector(3 downto 0):= "0000"
        );
    END COMPONENT;
	 
	  COMPONENT ControlUnit
    PORT(
         Instruct : IN  std_logic_vector(3 downto 0):= "0000";
         Src_Dest : IN  std_logic_vector(3 downto 0):= "0000";
         Carry_In : IN  std_logic;
         Jump : OUT  std_logic;
         Halt : OUT  std_logic;
         New_Address : OUT  std_logic_vector(3 downto 0):= "0000";
         ALU_Select : OUT  std_logic_vector(3 downto 0):= "0000";
         Src_Select : OUT  std_logic_vector(1 downto 0):= "00";
         Dest_Select : OUT  std_logic_vector(1 downto 0):= "00"
        );
    END COMPONENT;
	 
	 COMPONENT MUX4to1
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         c : IN  std_logic_vector(3 downto 0);
         d : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic_vector(1 downto 0);
         Output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
	 
	    COMPONENT SReg
    PORT(
         D : IN  std_logic_vector(3 downto 0);
         CLK : IN  std_logic;
         reset : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
	 
	   COMPONENT counter
    PORT(
         Jump : IN  std_logic;
         Halt : IN  std_logic;
         Reset : IN  std_logic;
         Clock : IN  std_logic;
         New_Address : IN  std_logic_vector(3 downto 0);
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
	 
	    COMPONENT RAM
    PORT(
         address : IN  std_logic_vector(3 downto 0);
         dataout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	 
	 
    
--
--   --Inputs
--   signal SEL : std_logic_vector(3 downto 0) := (others => '0');
--   signal A : std_logic_vector(3 downto 0) := (others => '0');
--   signal B : std_logic_vector(3 downto 0) := (others => '0');
--
-- 	--Outputs
--   signal Z : std_logic_vector(3 downto 0);
--   signal COMP : std_logic_vector(3 downto 0);
--	
--     --Inputs 2
--   signal Instruct : std_logic_vector(3 downto 0) := (others => '0');
--   signal Src_Dest : std_logic_vector(3 downto 0) := (others => '0');
--   signal Carry_In : std_logic := '0';
--
-- 	--Outputs
-- signal Jump : std_logic;
--   signal Halt : std_logic
signal IR : std_logic_vector(7 downto 0) :="00000000";
signal addr1,Newadd,jumpREG,matho,logico : std_logic_vector(3 downto 0) :="0000";
signal ALU_Select1,ALuin1,aluin2,PSR,r0,r1,r2,r3 : std_logic_vector(3 downto 0) :="0000";
signal Src_Select1 : std_logic_vector(1 downto 0) :="00";
signal Dest_Select1 : std_logic_vector(1 downto 0) :="00";
--	--Inputs
signal Jumpflag : std_logic := '0';
signal Haltflag,carry : std_logic := '0';

--   signal New_Address : std_logic_vector(3 downto 0) := (others => '0');
--
-- 	--Outputs
--   signal Q : std_logic_vector(3 downto 0);

	

BEGIN
 
	-- Instantiate Components ALL OF THESE are not wired change the rhs
	--

					

	 
--	MUX1: MUX4to1 PORT MAP (
--          a => a,
--          b => b,
--          c => c,
--          d => d,
--          sel => sel,
--          Output => Output
--        );
--	

--		  
--		  
--	SReg1: SReg PORT MAP (
--          D => D,
--          CLK => CLK,
--          reset => reset,
--          Q => Q
--        );
--		  
	counter1: counter PORT MAP (
          Jump => Jumpflag,
          Halt => Haltflag,
          Reset => Reset,
          Clock => Clock,
          New_Address =>jumpreg ,
          Q => addr1
        );
		  
	RAM1: RAM PORT MAP (
          address => addr1,
          dataout => IR);
		  
		  
	Control1 : ControlUnit PORT map(
	addr1,IR(3 downto 0),IR(4),jumpflag,
	haltflag,NewAdd,ALU_Select1,Src_Select1,Dest_Select1);
	
  ALU1: ALU PORT MAP (ALU_Select1,ALUin1,ALUin2,CPUOUT,PSR);
  
  Memout <= IR;
  Memaddout <=addr1;
  alus<=ALU_Select1;
  
			

END behavior;
