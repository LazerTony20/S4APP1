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

Signal EN : STD_LOGIC_VECTOR(3 downto 0);
begin

--process(BTN, S1, S2)
--begin

--   EN(3) <= BTN(1);
--           EN(2) <= BTN(0);
--           EN(1) <= S1;
--           EN(0) <= S0;

--     if <condition> then
--          <statement>
--       elsif <condition> then
--          <statement>
--       else
--          <statement>
--       end if;

--end process;

end Behavioral;
