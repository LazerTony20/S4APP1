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
           A2_3 : out STD_LOGIC_VECTOR (2 downto 0));
end Fct2_3;

architecture Behavioral of Fct2_3 is

component Add4bits is
    Port ( X : in STD_LOGIC_vector(3 downto 0);
           Y : in STD_LOGIC_vector(3 downto 0);
           Ci : in STD_LOGIC;
           S : out STD_LOGIC_vector(3 downto 0);
           Co : out STD_LOGIC);
end component;

signal InputNumber : STD_LOGIC_VECTOR (3 downto 0);

begin



Inst_Fct2_3 : process(ADCbin) is
    begin
    InputNumber(0) <= ADCbin(1);
    InputNumber(1) <= ADCbin(2);
    InputNumber(2) <= ADCbin(3);
    InputNumber(3) <= '0';
    end process Inst_Fct2_3;

--Add4bits :
--    X <= InputNumber
--    );

--        InputNumber(0) => X(0),
--        InputNumber(1) => X(1),
--        InputNumber(2) => X(2),
--        InputNumber(3) => X(3)
    
    end Behavioral;
