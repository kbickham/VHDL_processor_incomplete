
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
    Port (
			  Instruct : in  STD_LOGIC_vector (3 downto 0);
           Src_Dest : in  STD_LOGIC_vector (3 downto 0);
           Carry_In : in  STD_LOGIC;
           Jump : out  STD_LOGIC;

			  Halt : out std_logic;
           New_Address : out  STD_LOGIC_vector (3 downto 0);
           ALU_Select : out  STD_LOGIC_vector (3 downto 0);
           Src_Select : out  STD_LOGIC_vector (1 downto 0);
           Dest_Select : out  STD_LOGIC_vector (1 downto 0)
			  );
end ControlUnit;

architecture Behavioral of ControlUnit is
--"10001111" check , it's messing up on this (from 8th memory cell)
begin
process(Instruct,Src_Dest,Carry_in)
begin
if Instruct = "0000" then--instruction 0
	ALU_Select <= "0000";
	Src_Select <= Src_Dest(3 downto 2);
	Dest_Select <= Src_Dest(1 downto 0); 

	Jump <= '0';
	Halt <= '0';
elsif Instruct = "0001" then--instruction 1
	ALU_Select <= "0001";
	Src_Select <= Src_Dest(3 downto 2);
	Dest_Select <= Src_Dest(1 downto 0); 

	Jump <= '0';
	Halt <= '0';
elsif Instruct = "0010" then--instruction 2
	ALU_Select <= "0000";
	Src_Select <= Src_Dest(3 downto 2);
	Dest_Select <= Src_Dest(1 downto 0); 

	Jump <= '0';
	Halt <= '0';
elsif Instruct = "0011" then--instruction 3
	ALU_Select <= "0011";
	Src_Select <= Src_Dest(3 downto 2);
	Dest_Select <= Src_Dest(1 downto 0); 

	Jump <= '0';
	Halt <= '0';
elsif Instruct = "0100" then--instruction 4
	ALU_Select <= "0011";
	Src_Select <= Src_Dest(3 downto 2);
	Dest_Select <= Src_Dest(1 downto 0);

	Jump <= '0';
	Halt <= '0';
elsif Instruct = "0101" then--instruction 5
	ALU_Select <= "0100";
	Src_Select <= Src_Dest(3 downto 2);
	Dest_Select <= Src_Dest(1 downto 0); 

	Jump <= '0';
	Halt <= '0';
elsif Instruct = "0110" then--instruction 6
	ALU_Select <= "0100";
	Src_Select <= Src_Dest(3 downto 2);
	Dest_Select <= Src_Dest(1 downto 0); 

	Jump <= '0';
	Halt <= '0';
elsif Instruct = "0111" then--instruction 7
	ALU_Select <= "0000";
	Src_Select <= Src_Dest(3 downto 2);
	Dest_Select <= Src_Dest(1 downto 0);

	Jump <= '0';	
	Halt <= '0';
elsif Instruct = "1000" then--instruction 8
	ALU_Select <= "0XXX";
	Halt <= '0';
	if Carry_In = '1' then
		Jump <= '1';
		New_Address <= Src_Dest;

	else null;
	end if;
elsif Instruct = "1001" then--instruction 9
	ALU_Select <= "1011";
	Src_Select <= Src_Dest(3 downto 2);
	Dest_Select <= Src_Dest(1 downto 0); 

	Jump <= '0';
	Halt <= '0';
elsif Instruct = "1010" then--instruction 10
	ALU_Select <= "1010";
	Src_Select <= Src_Dest(3 downto 2);
	Dest_Select <= Src_Dest(1 downto 0); 

	Jump <= '0';
	Halt <= '0';
elsif Instruct = "1011" then--instruction 11
	ALU_Select <= "1100";
	Src_Select <= Src_Dest(3 downto 2);
	Dest_Select <= Src_Dest(1 downto 0); 

	Jump <= '0';
	Halt <= '0';
elsif Instruct = "1100" then--instruction 12
	ALU_Select <= "1001";
	Src_Select <= Src_Dest(3 downto 2);
	Dest_Select <= Src_Dest(1 downto 0); 

	Jump <= '0';
	Halt <= '0';
elsif Instruct = "1101" then--instruction 13
	ALU_Select <= "1000";
	Src_Select <= Src_Dest(3 downto 2);
	Dest_Select <= Src_Dest(1 downto 0); 

	Jump <= '0';
	Halt <= '0';
elsif Instruct = "1110" then--instruction 14
	ALU_Select <= "XXXX";
	Jump <= '1';
	New_Address <= Src_Dest;
	Halt <= '0';
elsif Instruct = "1111" then--instruction 15
	--Halt and diplay code how do we do this
	ALU_Select <= "XXXX";
	Halt <= '1';

	Jump <= '0';

else null;
end if;
end process;
end Behavioral;
