library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
	PORT(
	SEL: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	A: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	B: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	Z: OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
	COMP: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
	
end ALU;

architecture Behavioral of ALU is

signal C0, C1: std_logic_vector (7 downto 0);

begin
	ARITH_AND_LOGIC:PROCESS (SEL, A, B)
	BEGIN 
		CASE SEL IS
		WHEN "0000" =>
		Z <= A;							--TRANSFER A
		WHEN "0001" =>
		Z <= B;							--TRANSFER B
		WHEN "0010" =>
		Z <= A + B;						--ADD
		WHEN "0011" =>
		Z <= A - B;						--SUBTRACT
		WHEN "0100" =>
		Z <= "0000";						--null for now
		WHEN "0101" =>					
		--Z <= (A/B);						--DIVIDE
		WHEN "0110" =>
		Z <= A + '1'; 					--INCREMENT
		WHEN "0111" =>
		Z <= A - '1';					--DECREMENT
		WHEN  "1000" =>
		Z <= A AND B;					--AND OPERATION			
	   WHEN "1001" =>
		Z <= A OR B;					--OR OPERATION
		WHEN "1010" =>
		Z <= A XOR B;					--XOR OPERATION
		WHEN "1011" =>
		Z <= (NOT A);					--NOT OPERATION
		WHEN "1100" =>
		Z <= "0000"; -- THIS IS BREAKING synthesis
		--Z <= ('0' & A(3 downto 1));--LOGICAL SHIFT RIGHT
		WHEN "1101" =>					
		Z <= "0000"; -- breaking synth
		WHEN OTHERS =>
		Z <= "0000";				--CLEAR
		END CASE;
	END PROCESS;
	
	COMPARISON:PROCESS (A, B)
	BEGIN
		IF (A = B)  THEN				--EQUAL TO
		COMP <= "0000";
		ELSIF (A /= B)  THEN			--NOT EQUAL TO
		COMP <= "0001";
		ELSIF (A < B)  THEN			--LESS THAN
		COMP <= "0010";
		ELSIF (A <= B)  THEN			--LESS THAN OR EQUAL TO
		COMP <= "0011";
		ELSIF (A > B)  THEN 			--GREATER THAN
		COMP <= "0100";
		ELSIF (A >= B)  THEN 		--GREATER THAN OR EQUAL TO
		COMP <= "0101";
		ELSE								--DEFAULT VALUE OF "1111" SHOULD NOT BE REACHED
		COMP <= "1111";
		END IF;
	END PROCESS;
end Behavioral;
