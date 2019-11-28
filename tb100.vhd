--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:10:56 12/04/2018
-- Design Name:   
-- Module Name:   /home/ise/Kris_School/Project 3/Final Project/cpu2/tb100.vhd
-- Project Name:  cpu2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CPU
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb100 IS
END tb100;
 
ARCHITECTURE behavior OF tb100 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CPU
    PORT(
         Reset : IN  std_logic;
         Clock : IN  std_logic;
         alus : OUT  std_logic_vector(3 downto 0);
         MEMaddOUT : OUT  std_logic_vector(3 downto 0);
         CPUOUT : OUT  std_logic_vector(3 downto 0);
         MEMOUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Reset : std_logic := '0';
   signal Clock : std_logic := '0';

 	--Outputs
   signal alus : std_logic_vector(3 downto 0);
   signal MEMaddOUT : std_logic_vector(3 downto 0);
   signal CPUOUT : std_logic_vector(3 downto 0);
   signal MEMOUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CPU PORT MAP (
          Reset => Reset,
          Clock => Clock,
          alus => alus,
          MEMaddOUT => MEMaddOUT,
          CPUOUT => CPUOUT,
          MEMOUT => MEMOUT
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clock_period*100;

      -- insert stimulus here 

      wait;
   end process;

END;
