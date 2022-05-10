----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2022 02:04:40 PM
-- Design Name: 
-- Module Name: Bin2DualBCD_S - Behavioral
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

entity Bin2DualBCD_S is
    Port ( Moins5 : in STD_LOGIC_VECTOR(3 downto 0);
           Code_signe : out STD_LOGIC_VECTOR(3 downto 0);
           Unite_s : out STD_LOGIC_VECTOR(3 downto 0));
end Bin2DualBCD_S;

architecture Behavioral of Bin2DualBCD_S is

component Moins_5 is
    Port ( ADCbin : in STD_LOGIC_VECTOR(3 downto 0);
           Moins5 : out STD_LOGIC_VECTOR(3 downto 0));
end component;


begin

process(Moins5)
begin
   case (Moins5) is
      when "0000" =>
         Unite_s <= "0000";
         Code_signe <= "1111";
      when "0001" =>
         Unite_s <= "0001";
         Code_signe <= "1111";
      when "0010" =>
         Unite_s <= "0010";
         Code_signe <= "1111";
      when "0011" =>
         Unite_s <= "0011";
         Code_signe <= "1111";
      when "0100" =>
         Unite_s <= "0100";
         Code_signe <= "1111";
      when "0101" =>
         Unite_s <= "0101";
         Code_signe <= "1111";
      when "0110" =>
         Unite_s <= "0110";
         Code_signe <= "1111";
      when "1011" =>
        Unite_s <= "0101";
        Code_signe <= "1101";
      when "1100" =>
        Unite_s <= "0100";
        Code_signe <= "1101";
      when "1101" =>
        Unite_s <= "0011";
        Code_signe <= "1101";
      when "1110" =>
        Unite_s <= "0010";
        Code_signe <= "1101";
      when "1111" =>
        Unite_s <= "0001";
        Code_signe <= "1101";
      when others =>
        Unite_s <= "1011";--message erreur
        Code_signe <= "1110";--message erreur
   end case;
				
end process;
				

end Behavioral;