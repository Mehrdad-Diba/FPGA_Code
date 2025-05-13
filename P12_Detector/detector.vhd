----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:47:21 05/12/2025 
-- Design Name: 
-- Module Name:    detector - Behavioral 
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

entity detector is
    Port ( clk  : in   STD_LOGIC;
           data : in   STD_LOGIC;
           led  : out  STD_LOGIC :='0');
end detector;

architecture Behavioral of detector is
----Type--------
type state_type is (idle, wait_2ms, wait_3ms, wait_7ms, wait_fail);
----signal------
signal cnt : integer range 0 to 384999 :=0; --MAX 7.7ms
signal cnt_led : integer range 0 to 499999 :=0; --10ms
signal state :state_type := idle;
signal flag_led : STD_LOGIC :='0';

signal flag_en : STD_LOGIC :='0';

----------------
begin
process(clk)
 begin
 if(rising_edge(clk)) then
	flag_led <= '0';
	
	cnt <= cnt + 1;
	
	case state is
		when idle    =>
			if(data='1') then				
				state <= wait_2ms;
				cnt <= 0;
			end if;
			
		when wait_2ms=>
			if(data='0') then
				if(cnt>=89999 and cnt <= 109999) then
					cnt <= 0;
					state <= wait_3ms;
				else 
					state <=idle;
				end if;
			end if;
		
		when wait_3ms =>
			if(data='1') then
				cnt <= 0;
				if(cnt>=134999 and cnt <= 164999) then --3ms+-5%
					state <= wait_7ms;
				else 
					state <= wait_fail;
				end if;
			end if;
			
		when wait_fail =>
			if(data= '0') then
				state <= idle;
				cnt <= 0;
			end if;
			
		when wait_7ms =>
			if(data='0') then
				cnt <= 0;
				if(cnt>=314999 and cnt <= 384999) then --7ms+-5%
					state <= idle;
					flag_led <='1';
				else
				state <=wait_fail;
				end if;
			end if;
	end case;
	
 end if;
end process;

process (clk)
 begin
 if(rising_edge(clk)) then
	if(flag_led='1') then
		flag_en <= '1';
	end if;
	if(flag_en ='1') then
		led <= '1'; 
		cnt_led <= cnt_led + 1;
		if(cnt_led =  499999) then --10 off led
			cnt_led <= 0;
			led <= '0';
			flag_en <= '0';
		end if;
	end if;
 end if;
end process;

end Behavioral;
