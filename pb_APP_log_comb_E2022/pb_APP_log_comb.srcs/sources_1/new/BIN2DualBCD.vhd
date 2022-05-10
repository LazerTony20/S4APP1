----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2022 11:11:03 AM
-- Design Name: 
-- Module Name: BIN2DualBCD_ns - Behavioral
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

entity BIN2DualBCD is
    Port ( ADCbin : in STD_LOGIC_VECTOR(3 downto 0);
           Dizaines : out STD_LOGIC_VECTOR(3 downto 0);
           Unites_ns : out STD_LOGIC_VECTOR(3 downto 0);
           Code_signe : out STD_LOGIC_VECTOR(3 downto 0);
           Unite_s : out STD_LOGIC_VECTOR(3 downto 0));
end BIN2DualBCD;

architecture Behavioral of BIN2DualBCD is

component BIN2DualBCD_ns is
    Port ( ADCbin : in STD_LOGIC_VECTOR(3 downto 0);
           Dizaines : out STD_LOGIC_VECTOR(3 downto 0);
           Unites_ns : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component Moins_5 is
    Port ( ADCbin : in STD_LOGIC_VECTOR(3 downto 0);
           Moins5 : out STD_LOGIC_VECTOR(3 downto 0));
end component;


component Bin2DualBCD_S is
    Port ( Moins5 : in STD_LOGIC_VECTOR(3 downto 0);
           Code_signe : out STD_LOGIC_VECTOR(3 downto 0);
           Unite_s : out STD_LOGIC_VECTOR(3 downto 0));
end component;

SIGNAL Moins5out : STD_LOGIC_VECTOR(3 downto 0);
begin
    
Bin2DualBCD_non_signe : BIN2DualBCD_ns
Port map (
           ADCbin    => ADCbin,
           Dizaines    => Dizaines,
           Unites_ns   => Unites_ns
       );
       

Bin2DualBCD_Moins5 : Moins_5
Port map (
           ADCbin    => ADCbin,
           Moins5  => Moins5out
       );


Bin2DualBCD_signe : Bin2DualBCD_S
Port map (
           Moins5   => Moins5out,
           Code_signe    => Code_signe,
           Unite_s   => Unite_s
       );

				
end Behavioral;
