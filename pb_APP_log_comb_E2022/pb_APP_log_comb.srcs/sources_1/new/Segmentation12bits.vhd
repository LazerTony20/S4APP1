----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2022 12:57:32 PM
-- Design Name: 
-- Module Name: Segmentation12bits - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Segmentation12bits is
    Port (  In12Bit : in STD_LOGIC_VECTOR (11 downto 0);
            out4bit1: out STD_LOGIC_VECTOR (3 downto 0);
            out4bit2: out STD_LOGIC_VECTOR (3 downto 0);
            out4bit3: out STD_LOGIC_VECTOR (3 downto 0)
          );
end Segmentation12bits;

architecture Behavioral of Segmentation12bits is

begin
process(In12Bit)
    begin
    out4bit1 <= In12Bit(11 downto 8);
    out4bit2 <= In12Bit(7 downto 4);
    out4bit3 <= In12Bit(3 downto 0);
end process;

end Behavioral;
