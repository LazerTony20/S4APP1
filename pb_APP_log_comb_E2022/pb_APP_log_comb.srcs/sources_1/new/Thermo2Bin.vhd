----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2022 11:50:21 AM
-- Design Name: 
-- Module Name: Thermo2Bin - Behavioral
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

entity Thermo2Bin is
  Port ( ADCth : in STD_LOGIC_VECTOR(11 downto 0);
         ADCbin: out STD_LOGIC_VECTOR(3 downto 0);
         erreurT2B: out STD_LOGIC   
    );
end Thermo2Bin;

--------------------------------------------------------------------------
--------------------------------------------------------------------------
architecture Behavioral of Thermo2Bin is

--------------------------------------------------------------------------
signal err :    std_logic := '0';
signal pack1:   std_logic_vector (3 downto 0) := "0000";
signal pack2:   std_logic_vector (3 downto 0) := "0000";
signal pack3:   std_logic_vector (3 downto 0) := "0000";
signal nb1p1:   std_logic_vector (3 downto 0) := "0000";
signal nb1p2:   std_logic_vector (3 downto 0) := "0000";
signal nb1p3:   std_logic_vector (3 downto 0) := "0000";
signal sum12:   std_logic_vector (3 downto 0) := "0000";
signal carry1:  std_logic := '0';
signal zeros1:  std_logic := '0';
signal zeros2:  std_logic := '0';
signal nul:     std_logic;

--------------------------------------------------------------------------
component Segmentation12bits is
    Port (  In12Bit : in STD_LOGIC_VECTOR (11 downto 0);
            out4bit1: out STD_LOGIC_VECTOR (3 downto 0);
            out4bit2: out STD_LOGIC_VECTOR (3 downto 0);
            out4bit3: out STD_LOGIC_VECTOR (3 downto 0)
          );
end component;

component CheckErr4bit is
    Port (  In4Bit : in STD_LOGIC_VECTOR (3 downto 0); 
            previousHasZeros : in STD_LOGIC;
            hasZeros : out STD_LOGIC;
            erreur : out STD_LOGIC    
          );
end component;

component Calculnb1sur4bit is
    Port(   In4Bit  : in STD_LOGIC_VECTOR (3 downto 0);
            erreur  : in STD_LOGIC;
            count   : out STD_LOGIC_VECTOR(3 downto 0)
        );
end component;

component Add4bits is
    Port ( X4bit  : in STD_LOGIC_vector(3 downto 0);
           Y4bit  : in STD_LOGIC_vector(3 downto 0);
           Ci4bit : in STD_LOGIC;
           S4bit  : out STD_LOGIC_vector(3 downto 0);
           Co4bit : out STD_LOGIC);
end component;

--------------------------------------------------------------------------
begin

inst_segmentation : Segmentation12bits
Port map (  In12Bit  => ADCth,
            out4bit1 => pack1,
            out4bit2 => pack2,
            out4bit3 => pack3
          );

inst_Chk1stpack : CheckErr4bit
Port map (  In4Bit => pack3,
            previousHasZeros => '0',
            hasZeros => zeros1,
            erreur => err
         );

inst_Chk2ndpack : CheckErr4bit
Port map (  In4Bit => pack2,
            previousHasZeros => zeros1,
            hasZeros => zeros2,
            erreur => err
         );

inst_Chk3rdpack : CheckErr4bit
Port map (  In4Bit => pack1,
            previousHasZeros => zeros2,
            hasZeros => nul,
            erreur => err
         );

inst_nb1pack1 : Calculnb1sur4bit
Port map(   In4Bit => pack3,
            count => nb1p1,
            erreur => err
         );

inst_nb1pack2 : Calculnb1sur4bit
Port map(   In4Bit => pack2,
            count => nb1p2,
            erreur => err
         );

inst_nb1pack3 : Calculnb1sur4bit
Port map(   In4Bit => pack1,
            count => nb1p3,
            erreur => err
         );

inst_nb1p1nb1p2 : Add4bits
Port map(   X4bit   => nb1p1,
            Y4bit   => nb1p2,
            Ci4bit  => '0',
            Co4bit  => carry1,
            S4bit   => sum12
        );

inst_sum12nb1p3 : Add4bits
Port map(   X4bit   => sum12,
            Y4bit   => nb1p3,
            Ci4bit  => carry1,
            Co4bit  => nul,
            S4bit(0)=> ADCbin(0),
            S4bit(1)=> ADCbin(1),
            S4bit(2)=> ADCbin(2),
            S4bit(3)=> ADCbin(3)
        );

process(err,ADCth)
    begin
    erreurT2B <= err;    
end process;

end Behavioral;
