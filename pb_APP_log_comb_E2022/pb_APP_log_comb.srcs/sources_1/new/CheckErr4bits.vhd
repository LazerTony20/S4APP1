----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2022 12:07:22 PM
-- Design Name: 
-- Module Name: CheckErr4bits - Behavioral
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

entity CheckErr4bits is
    Port (  In4Bit : in STD_LOGIC_VECTOR (3 downto 0); 
            previousHasZeros : in STD_LOGIC;
            hasZeros : out STD_LOGIC;
            erreur : out STD_LOGIC);
end CheckErr4bits;

architecture Behavioral of CheckErr4bits is

begin
process(In4bit)
    begin
    case previousHasZeros is
        when '0' =>
        if In4bit = "1111" then
	       hasZeros <= '0';
	       erreur <= '0';
        else
	       hasZeros <= '1';
	       erreur <= (((In4bit(3))AND (NOT In4bit(2))) OR ((In4bit(2)) AND (NOT In4bit(1))) OR ((In4bit(1)) AND (NOT In4bit(0))));
	       
        end if;
        when '1' =>
            if In4bit /= "0000" then
                erreur <= '1';
            else
                erreur <= '0';
            end if;
        when others => erreur <= '1';
    end case;
end process;

end Behavioral;
