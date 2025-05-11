----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:47:31 05/10/2025 
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

library UNISIM;
use UNISIM.VComponents.all;

entity counter is
    Port ( clk : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end counter;

architecture Behavioral of counter is

component FA_4bit is
    Port ( a : in   STD_LOGIC_VECTOR (3 downto 0);
           b : in   STD_LOGIC_VECTOR (3 downto 0);
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           c : out  STD_LOGIC);
end component;
signal s1, s2 : STD_LOGIC_VECTOR(3 downto 0);
signal rst : STD_LOGIC;

begin
u1: FA_4bit port map(
		a => s1,
		b => "0001",
		s => s2,
		c => open
);

rst <= (not s1(0))and s1(1) and (not s1(2)) and s1(3);

F1 : FDCE
generic map (
	INIT => '0') -- Initial value of register ('0' or '1')  
port map (
	Q => s1(0),      -- Data output
	C => clk,      -- Clock input
	CE => '1',    -- Clock enable input
	CLR => rst,  -- Asynchronous clear input
	D => s2(0)       -- Data input
);

F2 : FDCE
generic map (
	INIT => '0') -- Initial value of register ('0' or '1')  
port map (
	Q => s1(1),      -- Data output
	C => clk,      -- Clock input
	CE => '1',    -- Clock enable input
	CLR => rst,  -- Asynchronous clear input
	D => s2(1)       -- Data input
);

F3 : FDCE
generic map (
	INIT => '0') -- Initial value of register ('0' or '1')  
port map (
	Q => s1(2),      -- Data output
	C => clk,      -- Clock input
	CE => '1',    -- Clock enable input
	CLR => rst,  -- Asynchronous clear input
	D => s2(2)       -- Data input
);

F4 : FDCE
generic map (
	INIT => '0') -- Initial value of register ('0' or '1')  
port map (
	Q => s1(3),      -- Data output
	C => clk,      -- Clock input
	CE => '1',    -- Clock enable input
	CLR => rst,  -- Asynchronous clear input
	D => s2(3)       -- Data input
);

q <= s1;
end Behavioral;

