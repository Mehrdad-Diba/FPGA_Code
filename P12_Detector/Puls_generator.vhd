----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:44:56 05/12/2025 
-- Design Name: 
-- Module Name:    Puls_generator - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Puls_generator is
    Port ( clk 	  : in   STD_LOGIC;
           pulse : out  STD_LOGIC);
end Puls_generator;

architecture Behavioral of Puls_generator is
-------signal--------
signal cnt  : integer  range 0 to 9999999;
signal state: integer  range 0 to 11;
---------------------
begin
process(clk)
 begin
 if(rising_edge(clk)) then
	cnt<=cnt+1;
		case state is
			when 0=>
				pulse<='1';
				if(cnt=99999)then--2ms
					cnt<=0;
					state<=1;
				end if;
			when 1=>
				pulse<='0';
				if(cnt=149999)then--3ms
					cnt<=0;
					state<=2;
				end if;
			when 2=>
				pulse<='1';
				if(cnt=349999)then--7ms
					cnt<=0;
					state<=3;
				end if;
			when 3=>
				pulse<='0';
				if(cnt=9999999)then--200ms
					cnt<=0;
					state<=4;
				end if;
			when 4=>
				pulse<='1';
				if(cnt=149999)then--3ms
					cnt<=0;
					state<=5;
				end if;
			when 5=>
				pulse<='0';
				if(cnt=99999)then--2ms
					cnt<=0;
					state<=6;
				end if;
			when 6=>
				pulse<='1';
				if(cnt=249999)then--5ms
					cnt<=0;
					state<=7;
				end if;
			when 7=>
				pulse<='0';
				if(cnt=9999999)then--200ms
					cnt<=0;
					state<=8;
				end if;
			when 8=>
				pulse<='1';
				if(cnt=99999)then--2ms
					cnt<=0;
					state<=9;
				end if;
			when 9=>
				pulse<='0';
				if(cnt=149999)then--3ms
					cnt<=0;
					state<=10;
				end if;
			when 10=>
				pulse<='1';
				if(cnt=249999)then--5ms
					cnt<=0;
					state<=11;
				end if;
			when 11=>
				pulse<='0';
				if(cnt=9999999)then--200ms
					cnt<=0;
					state<=0;
				end if;
		end case;
	end if;
end process;

end Behavioral;

