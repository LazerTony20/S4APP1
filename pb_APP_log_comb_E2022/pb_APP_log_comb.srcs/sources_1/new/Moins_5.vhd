----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2022 11:29:38 AM
-- Design Name: 
-- Module Name: Moins_5 - Behavioral
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

entity Moins_5 is
    Port ( ADCbin : in STD_LOGIC_VECTOR(3 downto 0);
           Moins5 : out STD_LOGIC_VECTOR(3 downto 0));
end Moins_5;

architecture Behavioral of Moins_5 is

component Add4bits is
    Port ( X : in STD_LOGIC_vector(3 downto 0);
           Y : in STD_LOGIC_vector(3 downto 0);
           Ci : in STD_LOGIC;
           S : out STD_LOGIC_vector(3 downto 0);
           Co : out STD_LOGIC);
end component;

--Signal Sum_2s_complement : STD_LOGIC_VECTOR(3 downto 0);
--Signal Final_Sum : STD_LOGIC_VECTOR(3 downto 0);


begin

    Calcul_Moins5 : Add4bits
    Port map (
               Ci => '0',
               X => "1011",
               Y => ADCbin,
               S => Moins5
           );
           
--     Calcul_Plus1 : Add4bits
--     Port map (
--               Ci => '0',
--               X => "0001",
--               Y => Final_Sum,
--               S => Moins5
--               );
               
--process(ADCbin)
--begin
----invert the 3 LSB of Sum_2s_complement, do +1 if MSB of Sum_2s_complement == 1

--Final_Sum <= not Sum_2s_complement;
--Final_Sum(3) <= Sum_2s_complement(3);

--end process;
end Behavioral;
