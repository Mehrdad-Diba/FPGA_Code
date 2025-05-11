----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:03:55 05/04/2025 
-- Design Name: 
-- Module Name:    FA_4bit - Behavioral 
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

entity FA_4bit is
    Port ( a : in   STD_LOGIC_VECTOR (3 downto 0);
           b : in   STD_LOGIC_VECTOR (3 downto 0);
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           c : out  STD_LOGIC);
end FA_4bit;

architecture Behavioral of FA_4bit is
component FA is
    Port ( ai : in   STD_LOGIC;
           bi : in   STD_LOGIC;
           ci : in   STD_LOGIC;
           so : out  STD_LOGIC;
           co : out  STD_LOGIC);
end component;
signal s1,s2,s3 : std_logic;
begin

u0 : FA port map (
		ai => a(0),
		bi => b(0),
		ci => '0',
		so => s(0),
		co => s1
);

u2 : FA port map (
		ai => a(1),
		bi => b(1),
		ci => s1,
		so => s(1),
		co => s2
);

u3 : FA port map (
		ai => a(2),
		bi => b(2),
		ci => s2,
		so => s(2),
		co => s3
);

u4 : FA port map (
		ai => a(3),
		bi => b(3),
		ci => s3,
		so => s(3),
		co => c 
);

end Behavioral;

