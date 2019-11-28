
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is

    Port ( Jump : in  STD_LOGIC;
			  Halt : in std_logic;
			  Reset : in std_logic;
           Clock : in  STD_LOGIC;
           New_Address : in  STD_LOGIC_vector (3 downto 0);
           Q : out  STD_LOGIC_vector (3 downto 0));
end counter;

architecture Behavioral of counter is

signal current_state , next_state : std_logic_vector (3 downto 0):= (others => '0');

begin

process(clock)
begin
if rising_edge(clock) then
	if Reset = '1' then 
		next_state <= "0000";
	elsif halt = '1' then
		null;
	elsif jump = '1' then
		next_state <= New_address;
	else
		if current_state = "1111" then
		next_state <= "0000";
		else
		next_state <= std_logic_vector(unsigned(current_state) + 1);
		end if;
	end if;
else null;
end if;
current_state <= next_state;
end process;
Q <= next_state;

end Behavioral;


