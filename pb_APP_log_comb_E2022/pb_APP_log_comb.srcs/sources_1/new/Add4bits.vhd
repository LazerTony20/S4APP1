----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2022 01:50:03 PM
-- Design Name: 
-- Module Name: Add4bits - Behavioral
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

entity Add4bits is
    Port ( X : in STD_LOGIC_vector(3 downto 0);
           Y : in STD_LOGIC_vector(3 downto 0);
           Ci : in STD_LOGIC;
           S : out STD_LOGIC_vector(3 downto 0);
           Co : out STD_LOGIC);
end Add4bits;




architecture Behavioral of Add4bits is

component Add1bitA is
    Port ( X : in STD_LOGIC;
           Y : in STD_LOGIC;
           Ci : in STD_LOGIC;
           S : out STD_LOGIC;
           Co : out STD_LOGIC
           );
end component;

component Add1bitB is
    Port ( X : in STD_LOGIC;
           Y : in STD_LOGIC;
           Ci : in STD_LOGIC;
           S : out STD_LOGIC;
           Co : out STD_LOGIC
           );
end component;

signal Carry_vector : STD_LOGIC_VECTOR(3 downto 0);

begin
    
adder1 : Add1bitA
Port map (
           X    => X(0),
           Y    => Y(0),
           S    => S(0),
           Ci   => Carry_vector(0),
           Co   => Carry_vector(1)
       );

adder2 : Add1bitB
Port map (
           X    => X(1),
           Y    => Y(1),
           S    => S(1),
           Ci   => Carry_vector(1),
           Co   => Carry_vector(2)
       );
       
adder3 : Add1bitA
Port map (
           X    => X(2),
           Y    => Y(2),
           S    => S(2),
           Ci   => Carry_vector(2),
           Co   => Carry_vector(3)
       );
       
adder4 : Add1bitB
Port map (
           X    => X(3),
           Y    => Y(3),
           S    => S(3),
           Ci   => Carry_vector(3),
           Co   => Carry_vector(4)
       );


end Behavioral;
