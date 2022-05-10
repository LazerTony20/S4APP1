----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2022 02:10:08 PM
-- Design Name: 
-- Module Name: Parite - Behavioral
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

entity Parite is
    Port ( S1 : in STD_LOGIC;
           ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           parite : out STD_LOGIC
    );
end Parite;

architecture Behavioral of Parite is

--signal pout : std_logic;

begin
process(ADCbin, S1)
    begin
    case S1 is
        when '0' => parite <= ((ADCbin(0) XOR ADCbin(1)) XOR(ADCbin(2) XOR ADCbin(3)));
        when '1' => parite <= not ((ADCbin(0) XOR ADCbin(1)) XOR(ADCbin(2) XOR ADCbin(3)));
        when others => parite <= '0';
    end case;
--    case ADCbin is
--        when "0000" => pout <= '0';
--        when "0001" => pout <= '1';
--        when "0010" => pout <= '1';
--        when "0011" => pout <= '0';
--        when "0100" => pout <= '1';
--        when "0101" => pout <= '0';
--        when "0110" => pout <= '0';
--        when "0111" => pout <= '1';
--        when "1000" => pout <= '1';
--        when "1001" => pout <= '0';
--        when "1010" => pout <= '0';
--        when "1011" => pout <= '1';
--        when "1100" => pout <= '0';
--        when "1101" => pout <= '1';
--        when "1110" => pout <= '1';
--        when "1111" => pout <= '0';
--        when others => pout <= '0';
--    end case;
--    case S1 is
--        when '0' => parite <= pout;
--        when '1' => parite <= not pout;
--        when others => parite <= '0';
--    end case;
--Inversion de l'affichage de parté si l'interrupteur S1 est activé.
--        pout <= ((ADCbin(0) XOR ADCbin(1)) XOR(ADCbin(2) XOR ADCbin(3)));
--      parite <= S1 XOR ((ADCbin(0) XOR ADCbin(1)) XOR(ADCbin(2) XOR ADCbin(3)));
--      parite <= S1 XOR pout;
end process;

end Behavioral;