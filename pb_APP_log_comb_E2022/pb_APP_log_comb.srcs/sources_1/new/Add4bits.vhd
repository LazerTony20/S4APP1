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
    Port ( X4bit : in STD_LOGIC_vector(3 downto 0);
           Y4bit : in STD_LOGIC_vector(3 downto 0);
           Ci4bit : in STD_LOGIC;
           S4bit : out STD_LOGIC_vector(3 downto 0);
           Co4bit : out STD_LOGIC);
end Add4bits;

architecture Behavioral of Add4bits is

signal Carry_vector : STD_LOGIC_VECTOR(3 downto 0);

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



begin
    
adder1 : Add1bitA
Port map (
           X    => X4bit(0),
           Y    => Y4bit(0),
           S    => S4bit(0),
           Ci   => Ci4bit,
           Co   => Carry_vector(0)
       );

adder2 : Add1bitB
Port map (
           X    => X4bit(1),
           Y    => Y4bit(1),
           S    => S4bit(1),
           Ci   => Carry_vector(0),
           Co   => Carry_vector(1)
       );
       
adder3 : Add1bitA
Port map (
           X    => X4bit(2),
           Y    => Y4bit(2),
           S    => S4bit(2),
           Ci   => Carry_vector(1),
           Co   => Carry_vector(2)
       );
       
adder4 : Add1bitB
Port map (
           X    => X4bit(3),
           Y    => Y4bit(3),
           S    => S4bit(3),
           Ci   => Carry_vector(2),
           Co   => Co4bit
       );


end Behavioral;
