----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:05:10 05/11/2025 
-- Design Name: 
-- Module Name:    Counter_with_reset - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter_with_reset is
    Port ( clk : in   STD_LOGIC;
           rst : in   STD_LOGIC :='1';
           q	: out  STD_LOGIC_VECTOR (3 downto 0));
end Counter_with_reset;

architecture Behavioral of Counter_with_reset is
signal cnt : integer range 0 to 15;
begin
--Asynchronus Reset Low_active:
process(clk,rst)
 begin
 if(falling_edge(rst)) then
	cnt <= 0;
 elsif(rising_edge(clk)) then
		cnt <= cnt +1;
		if(cnt =9) then
			cnt <= 0;
		end if;
 end if;
end process;

q <= conv_STD_LOGIC_VECTOR(cnt,4);

end Behavioral;

