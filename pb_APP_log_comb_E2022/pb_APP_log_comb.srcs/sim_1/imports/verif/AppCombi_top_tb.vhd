---------------------------------------------------------------------------------------------
-- labo_adder4b_sol_tb.vhd
---------------------------------------------------------------------------------------------
-- Universit� de Sherbrooke - D�partement de GEGI
-- Version         : 3.0
-- Nomenclature    : GRAMS
-- Date R�vision   : 21 Avril 2020
-- Auteur(s)       : R�jean Fontaine, Daniel Dalle, Marc-Andr� T�trault
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
--                   peripheriques: carte Thermo12, Pmod8LD PmodSSD
--
-- Outils          : vivado 2019.1 64 bits
---------------------------------------------------------------------------------------------
-- Description:
-- Banc d'essai pour circuit combinatoire Laboratoire logique combinatoire
-- Version avec entr�es toutes combinatoires CIRCUIT COMPLET (TOP)
-- 
-- Revision v1 12 novembre 2018, 3 d�cembre 2018 D. Dalle 
-- Revision 30 Avril 2021, M-A Tetrault
--
---------------------------------------------------------------------------------------------
-- Notes :
-- L'entr�e retenue (i_cin) est g�n�r�e par l'interrupteur S1 de la carte Thermobin
--
---------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- requis pour enonc�s de type mem_valeurs_tests(to_integer( unsigned(table_valeurs_adr(9 downto 6) )));
USE ieee.numeric_std.ALL;          -- 
use IEEE.STD_LOGIC_UNSIGNED.ALL;   --


entity AppCombi_top_tb is
 -- port ( 
 --         ADCth    : in    STD_LOGIC_VECTOR(11 downto 0);
 --         BTN       : in    std_logic_vector (3 downto 0); -- Boutons de la carte Zybo
 --         --i_sw        : in    std_logic_vector (3 downto 0); -- Interrupteurs de la carte Zybo
 --         S1          : in    STD_LOGIC;
 --         S2          : in    STD_LOGIC;
 --         sysclk      : in    std_logic;                     -- horloge systeme
 --         o_SSD       : out   std_logic_vector (7 downto 0); -- vers cnnecteur pmod afficheur 7 segments
 --         --o_led       : out   std_logic_vector (3 downto 0); -- vers DELs de la carte Zybo
 --         --o_led6_r    : out   std_logic;                     -- vers DEL rouge de la carte Zybo
 --         o_pmodled   : out   std_logic_vector (7 downto 0);  -- vers connecteur pmod 8 DELs
 --         o_DEL2      : OUT   STD_LOGIC;    --del 2 thermo
 --         o_DEL1      : OUT   STD_LOGIC    --del 1 thermo
 --         );
end AppCombi_top_tb;

architecture Behavioral of AppCombi_top_tb is

COMPONENT verif_show_affhex is
end COMPONENT;

COMPONENT AppCombi_top
   port ( 
     ADCth       : in    STD_LOGIC_VECTOR(11 downto 0);
     BTN         : in    std_logic_vector (3 downto 0); -- Boutons de la carte Zybo
     --i_sw        : in    std_logic_vector (3 downto 0); 
     S1          : in   STD_LOGIC;
     S2          : in   STD_LOGIC;
     sysclk      : in    std_logic; 
     o_SSD       : out   std_logic_vector (7 downto 0); 
     --o_led       : out   std_logic_vector (3 downto 0); 
     --o_led6_r    : out   std_logic;        
     o_pmodled   : out   std_logic_vector (7 downto 0);
     o_DEL2      : OUT   STD_LOGIC;    --del 2 thermo
     o_DEL1      : OUT   STD_LOGIC    --del 1 thermo
     );    
end COMPONENT;
   SIGNAL ADCth_sim         :  STD_LOGIC_VECTOR(11 downto 0);
   SIGNAL BTN_sim       :  STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
   SIGNAL S1_sim        :  STD_LOGIC := '0';
   SIGNAL S2_sim        :  STD_LOGIC := '0';
   signal clk_sim       :  STD_LOGIC := '0';
   signal pmodled_sim   :  STD_LOGIC_VECTOR (7 DOWNTO 0);
   signal o_DEL2_sim       :  STD_LOGIC := '0';
   signal o_DEL1_sim    :  STD_LOGIC := '0';
   signal SSD_sim       :  STD_LOGIC_VECTOR (7 DOWNTO 0) := "00000000";
   signal sw_sim        :  STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
   signal cin_sim       :  STD_LOGIC := '0';
   signal vecteur_test_sim   :  STD_LOGIC_VECTOR (17 DOWNTO 0) := (others => '0');
   signal resultat_attendu       :  STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";


   constant sysclk_Period  : time := 8 ns;
   


----------------------------------------------------------------------------
-- declaration d'un tableau pour soumettre un vecteur de test  
----------------------------------------------------------------------------  
 type table_valeurs_tests is array (integer range 0 to 12) of std_logic_vector(17 downto 0);
    constant mem_valeurs_tests : table_valeurs_tests := 
    ( 
--  --  vecteur de test � modifier selon les besoins
--  --  res      op_a     op_b    cin
--    "00000" & "0000" & "0000" & '0',  --   0 +  0  
--    "00000" & "0000" & "0001" & '0',  --   0 +  1 
--    -- modifez et/ou ajoutez vos valeurs
  
--    -- conserver la ligne ci-bas.
--    others => "00000" & "0000" & "0000" & '0'  --  0 + 0 

--  ----ADCth-------BTN(3:0)---S1----S2--
    "000000000000"  & "0000" & "0" & "0",
    "000000000001"  & "0000" & "0" & "0",
    "000000000011"  & "0000" & "0" & "0",
    "000000000111"  & "0000" & "0" & "0",
    "000000001111"  & "0000" & "0" & "0",
    "000000011111"  & "0000" & "0" & "0",
    "000000111111"  & "0000" & "0" & "0",
    "000001111111"  & "0000" & "0" & "0",
    "000011111111"  & "0000" & "0" & "0",
    "000111111111"  & "0000" & "0" & "0",
    "001111111111"  & "0000" & "0" & "0",
    "011111111111"  & "0000" & "0" & "0",
    "111111111111"  & "0000" & "0" & "0"
    );
----------------------------------------------------------------------------

begin


-- Pattes du FPGA Zybo-Z7
uut: AppCombi_top
   PORT MAP(
   ADCth    =>  ADCth_sim,
   BTN       =>   BTN_sim,
   --i_sw        =>   sw_sim,
   S1          =>   S1_sim,
   S2           =>  S2_sim,
   sysclk      =>   clk_sim,
   o_SSD       =>   SSD_sim,
   o_DEL2       =>   o_DEL2_sim,
   o_pmodled   =>   pmodled_sim,
   o_DEL1    =>   o_DEL1_sim
   );
   



	-- Section banc de test
    ----------------------------------------
	-- generation horloge 
	----------------------------------------
   process
   begin
       clk_sim <= '1';  -- init
       loop
           wait for sysclk_Period/2;
           clk_sim <= not clk_sim;    -- invert clock value
       end loop;
   end process;  
	----------------------------------------
   
   ----------------------------------------
   -- test bench
   tb : PROCESS
       variable delai_sim : time  := 50 ns;
       variable table_valeurs_adr : integer range 0 to 63;

      BEGIN
         -- test 1
         wait for delai_sim;
         table_valeurs_adr := 0;
         -- simuler une sequence de valeurs a l'entree 
         for index in 0 to   mem_valeurs_tests'length-1 loop
              vecteur_test_sim <= mem_valeurs_tests(table_valeurs_adr);
              ADCth_sim  <= vecteur_test_sim (11 downto 0);
              BTN_sim    <= vecteur_test_sim (15 downto 12);
              S1_sim     <= vecteur_test_sim (16);
              S2_sim     <= vecteur_test_sim (17);
--              btn_sim <= vecteur_test_sim (4 downto 1) ;
--              cin_sim <= vecteur_test_sim (0);
--			  resultat_attendu <= vecteur_test_sim(13 downto 9);
              wait for delai_sim;
			  --assert (resultat_attendu /= (probe_adder_result) ) report "Resultat pas celui pr�vu." severity warning; 
              table_valeurs_adr := table_valeurs_adr + 1;
			  if(table_valeurs_adr = 12) then
				exit;
			  end if;
         end loop;
           
         WAIT; -- will wait forever
      END PROCESS;

END Behavioral;
