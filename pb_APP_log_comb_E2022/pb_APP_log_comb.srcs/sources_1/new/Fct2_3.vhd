----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2022 09:40:10 AM
-- Design Name: 
-- Module Name: Fct2_3 - Behavioral
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

entity Fct2_3 is
    Port ( ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           A2_3 : out STD_LOGIC_VECTOR (3 downto 0));
end Fct2_3;

architecture Behavioral of Fct2_3 is

component Add4bits is
    Port ( X4bit : in STD_LOGIC_vector(3 downto 0);
           Y4bit : in STD_LOGIC_vector(3 downto 0);
           Ci4bit : in STD_LOGIC;
           S4bit : out STD_LOGIC_vector(3 downto 0);
           Co4bit : out STD_LOGIC);
end component;

signal InputNumber : STD_LOGIC_VECTOR (3 downto 0);

begin

--Inst_Fct2_3 : process (Add4bits)
--    begin
--    InputNumber(0) <= ADCbin(1);
--    InputNumber(1) <= ADCbin(2);
--    InputNumber(2) <= ADCbin(3);
--    InputNumber(3) <= '0';
Inst_Fct2_3 : Add4bits
Port map (
    X4bit(0) => ADCbin(1),
    X4bit(1) => ADCbin(2),
    X4bit(2) => ADCbin(3),
    X4bit(3) => '0',
    Y4bit(0) => ADCbin(3),
    Y4bit(1) => '0',
    Y4bit(2) => '0',
    Y4bit(3) => '0',
    Ci4bit => '0',
    S4bit => A2_3
);
--    end process Inst_Fct2_3;
    
    end Behavioral;
