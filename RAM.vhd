
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RAM is

port( address: in std_logic_vector(3 downto 0);
		dataout: out std_logic_vector(7 downto 0)
	 );

end RAM;



architecture Behavioral of RAM is



type location is array(15 downto 0) of std_logic_vector(7 downto 0);

constant instruct : location := (

--instuctions

-- 00 source register 1

-- 01 source register 2

-- 10 program counter

-- 11 instruction register

0 => "00000010", --add reg1
1 => "00010010",--sub
2 => "00100110", --add reg2
3 => "00110010", --increment source A
4 => "01000110", --increment B
5 => "01010010", --decrement A
6 => "01100110", --decrement B
7 => "01110010", --add reg1
-- conditioned add
8 => "10001111",-- conditioned jump to halt and disp
9 => "10010011", --or
10 => "10100011", --and
11 => "10110011", --xor
12 => "11000011", --shift right
13 => "11010111",  --compare
14 => "11100000", -- jump ir to pc back to initial instruction
15 => "11110000" -- halt and disp
);

begin

process(address) is

begin

	case(address) is
	
	when "0000" => 
		dataout <= instruct(0);
	when "0001" => 
		dataout <= instruct(1);
	when "0010" => 
		dataout <= instruct(2);
	when "0011" => 
		dataout <= instruct(3);
	when "0100" => 
		dataout <= instruct(4);
	when "0101" => 
		dataout <= instruct(5);
	when "0110" => 
		dataout <= instruct(6);
	when "0111" => 
		dataout <= instruct(7);
	when "1000" => 
		dataout <= instruct(8);
	when "1001" => 
		dataout <= instruct(9);
	when "1010" => 
		dataout <= instruct(10);
	when "1011" => 
		dataout <= instruct(11);
	when "1100" => 
		dataout <= instruct(12);
	when "1101" => 
		dataout <= instruct(13);
	when "1110" => 
		dataout <= instruct(14);
	when "1111" =>
		dataout <= instruct(15);
	when others => 
		null;
	end case;
end process;
end Behavioral;

