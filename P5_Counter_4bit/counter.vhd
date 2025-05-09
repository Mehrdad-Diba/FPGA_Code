----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:04:12 05/09/2025 
-- Design Name: 
-- Module Name:    counter - Behavioral 
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

entity counter is port (
		clk : in STD_LOGIC;
		q   : out STD_LOGIC_VECTOR(3 downto 0)
);
end counter;

architecture Behavioral of counter is

component FA_4bit is
    Port ( a : in   STD_LOGIC_VECTOR (3 downto 0);
           b : in   STD_LOGIC_VECTOR (3 downto 0);
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           c : out  STD_LOGIC);
end component;

begin
u1 : FA_4bit port map (
	a =>,
   b =>s,
	s =>,
   c =>
);
end Behavioral;

