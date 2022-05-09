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

--process(ADCbin)
--begin
--   case (Moins5) is
--      when "0000" =>
--         <statement>;
--      when "0001" =>
--         <statement>;
--      when "0010" =>
--         <statement>;
--      when "0011" =>
--         <statement>;
--      when "0100" =>
--         <statement>;
--      when "0101" =>
--         <statement>;
--      when "0110" =>
--         <statement>;
--      when "0111" =>
--         <statement>;
--      when "1000" =>
--         <statement>;
--      when "1001" =>
--         <statement>;
--      when "1010" =>
--         <statement>;
--      when "1011" =>
--         <statement>;
--      when "1100" =>
--         <statement>;
--      when "1101" =>
--         <statement>;
--      when "1110" =>
--         <statement>;
--      when "1111" =>
--         <statement>;
--      when others =>
--         <statement>;
--   end case;
				
--end process;
				

end Behavioral;
