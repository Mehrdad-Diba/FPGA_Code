----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:47:15 05/11/2025 
-- Design Name: 
-- Module Name:    led_blink - Behavioral 
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

entity led_blink is
    Port ( clk : in   STD_LOGIC;
           led : out  STD_LOGIC);
end led_blink;

architecture Behavioral of led_blink is

signal cnt : integer range 0 to 4999999;
signal sled: STD_LOGIC :='0';

begin
process(clk)
 begin
 if(rising_edge(clk)) then
	cnt <= cnt +1;
	if(cnt=4999999) then
	cnt <= 0;
	sled <= not sled;
	end if;
 end if;
end process;

led <= sled;
end Behavioral;

