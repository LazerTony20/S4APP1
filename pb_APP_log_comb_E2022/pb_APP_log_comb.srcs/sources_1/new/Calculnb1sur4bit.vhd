----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2022 12:07:22 PM
-- Design Name: 
-- Module Name: Calculnb1sur4bit - Behavioral
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

entity Calculnb1sur4bit is
    Port (  In4Bit  : in STD_LOGIC_VECTOR (3 downto 0);
            erreur  : in STD_LOGIC;
            count   : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Calculnb1sur4bit;

architecture Behavioral of Calculnb1sur4bit is

begin
process(In4Bit)
    begin
    if erreur = '1' then
        count <= "0000";
    else
        case In4Bit is
            when "0001" => count <= "0001";
            when "0011" => count <= "0010";
            when "0111" => count <= "0011";
            when "1111" => count <= "0100";
            when others => count <= "0000";
        end case;
    end if;
end process;

end Behavioral;
