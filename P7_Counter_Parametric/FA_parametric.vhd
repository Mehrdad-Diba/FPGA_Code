----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:03:55 05/04/2025 
-- Design Name: 
-- Module Name:    FA_FA_parametric - Behavioral 
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

entity FA_parametric is
	generic (
				constant bit_num : integer := 4);
    Port ( a : in   STD_LOGIC_VECTOR (bit_num-1 downto 0);
           b : in   STD_LOGIC_VECTOR (bit_num-1 downto 0);
           s : out  STD_LOGIC_VECTOR (bit_num-1 downto 0);
           c : out  STD_LOGIC);
end FA_parametric;

architecture Behavioral of FA_parametric is

component FA is
    Port ( ai : in   STD_LOGIC;
           bi : in   STD_LOGIC;
           ci : in   STD_LOGIC;
           so : out  STD_LOGIC;
           co : out  STD_LOGIC);
end component;

signal sig : STD_LOGIC_VECTOR(bit_num downto 0);

begin

sig(0)<='0';

u1: for i in 0 to bit_num-1 generate 
u : FA port map (
		ai => a(i),
		bi => b(i),
		ci => sig(i),
		so => s(i),
		co => sig(i+1)
		);
end generate;
c <= sig(bit_num);

end Behavioral;

