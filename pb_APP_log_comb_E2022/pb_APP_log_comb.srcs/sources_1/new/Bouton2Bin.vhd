----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2022 12:10:45 PM
-- Design Name: 
-- Module Name: Bouton2Bin - Behavioral
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



entity Bouton2Bin is
  Port (   ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           Dizaines : in STD_LOGIC_VECTOR (3 downto 0);
           Unites_ns : in STD_LOGIC_VECTOR (3 downto 0);
           Code_signe : in STD_LOGIC_VECTOR (3 downto 0);
           Unites_s : in STD_LOGIC_VECTOR (3 downto 0);
           erreur : in STD_LOGIC;
           BTN :    in STD_LOGIC_VECTOR(1 downto 0);
           S1 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           DAFF0 : out STD_LOGIC_VECTOR(3 downto 0);
           DAFF1 : out STD_LOGIC_VECTOR(3 downto 0));           
end Bouton2Bin;

architecture Behavioral of Bouton2Bin is

Signal EN : STD_LOGIC_VECTOR(2 downto 0);
begin

process(BTN, S2)
begin

   EN(0) <= BTN(0);
   EN(1) <= BTN(1);
   EN(2) <= S2;
   --EN(3) <= S1; mais pas a soccuper de la parite ici normalement

     if EN = "000" then
         DAFF1 <= Dizaines;
         DAFF0 <= Unites_ns;
         elsif EN = "001" then
          DAFF1 <= Dizaines;
          DAFF0 <= Unites_ns;
          elsif EN = "010" then
          DAFF1 <= Code_signe;
          DAFF0 <= Unites_s;
          elsif EN = "011" then --code erreur
          DAFF1 <= "1110";
          DAFF0 <= "1011";
       elsif EN = "100" then    --code erreur
          DAFF1 <= "1110";
          DAFF0 <= "1011";
       elsif EN = "101" then    --code erreur
          DAFF1 <= "1110";
          DAFF0 <= "1011";
          
       else   --code erreur donc pas n�cessaire de faire toutes les possibilit�s avec le MSB a 1 (Er)
          DAFF1 <= "1110";
          DAFF0 <= "1011";

       end if;

end process;

end Behavioral;