----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:58:47 05/12/2025 
-- Design Name: 
-- Module Name:    Pulse - Behavioral 
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

entity Pulse is
    Port ( clk : in  STD_LOGIC;
           led : out  STD_LOGIC);
end Pulse;

architecture Behavioral of Pulse is
signal s1 : STD_LOGIC;
component Puls_generator is
    Port ( clk 	  : in   STD_LOGIC;
           pulse : out  STD_LOGIC);
end component;

component detector is
    Port ( clk  : in   STD_LOGIC;
           data : in   STD_LOGIC;
           led  : out  STD_LOGIC :='0');
end component;
begin
u1: Puls_generator port map (
				clk   => clk,
				pulse => s1);
				
u2: detector port map (
				clk   => clk,
				data => s1,
				led => led);
end Behavioral;

