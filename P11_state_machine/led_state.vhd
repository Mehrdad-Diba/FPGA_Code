----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:24:30 05/11/2025 
-- Design Name: 
-- Module Name:    led_state - Behavioral 
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

entity led_state is
    Port ( clk : in   STD_LOGIC;
           led : out  STD_LOGIC);
end led_state;

architecture Behavioral of led_state is
-- new type ---
type state_type is (s25ms, s50ms, s100ms, s200ms, s400ms);
-- signal ----
signal cnt :integer range 0 to 99999999; -- 2 Seconde
signal state : state_type := s25ms;
signal cnt_led :integer range 0 to 9999999;
signal sled : STD_LOGIC :='0';
--------------
begin
process(clk)
 begin
 if(rising_edge (clk)) then
	cnt <= cnt + 1;
	if(cnt=49999999) then --2s--1s
		cnt <= 0;
		case state is
			when s25ms  =>
				state <= s50ms;
			when s50ms  =>
				state <= s100ms;
			when s100ms =>
				state <= s200ms;
			when s200ms =>
				state <= s400ms;
			when s400ms =>
				state <= s25ms;
		end case;
	end if;
 end if;
end process;

process(clk)
 begin
 if(rising_edge(clk)) then
	cnt_led <= cnt_led +1;
	case state is
		when s25ms  =>
			if(cnt_led=624999) then
				cnt_led <= 0;
				sled <= not sled;
			end if;
		when s50ms  =>
			if(cnt_led=1249999) then
				cnt_led <= 0;
				sled <= not sled;
			end if;
		when s100ms =>
			if(cnt_led=2499999) then
				cnt_led <= 0;
				sled <= not sled;
			end if;
		when s200ms =>
			if(cnt_led=4999999) then
				cnt_led <= 0;
				sled <= not sled;
			end if;
		when s400ms =>
			if(cnt_led=9999999) then
				cnt_led <= 0;
				sled <= not sled;
			end if;
	end case;
 end if;
end process;

led <= sled;

end Behavioral;

