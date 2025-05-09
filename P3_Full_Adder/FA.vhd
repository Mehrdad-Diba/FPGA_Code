----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:11:46 05/04/2025 
-- Design Name: 
-- Module Name:    FA - Behavioral 
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

entity FA is
    Port ( ai : in   STD_LOGIC;
           bi : in   STD_LOGIC;
           ci : in   STD_LOGIC;
           so : out  STD_LOGIC;
           co : out  STD_LOGIC);
end FA;

architecture Behavioral of FA is
-- component------
component HA is
    Port ( a : in   STD_LOGIC;
           b : in   STD_LOGIC;
           s : out  STD_LOGIC;
           c : out  STD_LOGIC);
end component;
------------------
signal s1, s2, s3: std_logic;

begin
u1 : HA port map (
	a => ai,
	b => bi, 
	s => s1,
	c => s2
);

u2 : HA port map (
	a => s1,
	b => ci,
	s => so,
	c => s3
);
co <= s2 or s3;

end Behavioral;

