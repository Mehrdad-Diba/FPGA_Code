----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:35:59 05/11/2025 
-- Design Name: 
-- Module Name:    counter_parametric - Behavioral 
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

entity counter_parametric is
	 generic (
				 bit_num : integer :=10);
    Port ( clk : in  STD_LOGIC;
           q   : out STD_LOGIC_VECTOR(bit_num-1 downto 0));
end counter_parametric;

architecture Behavioral of counter_parametric is

component FA_parametric is
	generic (
				constant bit_num : integer := 4);
    Port ( a : in   STD_LOGIC_VECTOR (bit_num-1 downto 0);
           b : in   STD_LOGIC_VECTOR (bit_num-1 downto 0);
           s : out  STD_LOGIC_VECTOR (bit_num-1 downto 0);
           c : out  STD_LOGIC);
end component;

signal s1, s2 : STD_LOGIC_VECTOR(bit_num-1 downto 0);
signal sig 	  : STD_LOGIC_VECTOR(bit_num-1 downto 0);
signal s3     : STD_LOGIC_VECTOR(bit_num-2 downto 0) :=(others=>'0');
signal rst : STD_LOGIC;


begin

sig <= s3 & '1'; 

u1 : FA_parametric 
	  generic map(
			bit_num => bit_num)
	  port map (
			a =>s1,
			b =>sig,  --00...01 
			s =>s2, 
			c => open
	  );
	  
--rst <= (not s1(0)) and s1(1) and (not s1(2)) and s1(3); -- 9 
rst <='0';

FF : for i in 0 to bit_num-1 generate
   FFU : FDCE
   generic map (
      INIT => '0') -- Initial value of register ('0' or '1')  
   port map (
      Q => s1(i),      -- Data output
      C => clk,      -- Clock input
      CE => '1',    -- Clock enable input
      CLR => rst,  -- Asynchronous clear input
      D => s2(i)       -- Data input
   );
end generate;

q <=s1;

end Behavioral;

