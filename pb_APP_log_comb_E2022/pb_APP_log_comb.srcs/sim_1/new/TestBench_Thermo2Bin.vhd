----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/07/2019 08:34:20 PM
-- Design Name: 
-- Module Name: testBench - Behavioral
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

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;

--> L'entity du test bench est vide et elle doit le demeurer
--> L'entity peut porter le nom que vous voulez mais il est de bonne pratique 
--> d'utiliser le nom du module à tester avec un suffixe par exemple.

ENTITY TestBench_Thermo2Bin IS          --> Remarquez que l'ENTITY est vide et doit le demeurer pour un test bench !!!  
END TestBench_Thermo2Bin;


ARCHITECTURE behavioral OF TestBench_Thermo2Bin IS 

--> Remplacer ce COMPONENT par celui de votre COMPONENT à tester 
    -- Note: vous pouvez copier la partie PORT ( .. ) de l'entity de votre code VHDL 
    -- et l'insérer dans la déclaration COMPONENT.
--> Si vous voulez comparer 2 modules VHDL, vous pouvez déclarer 2 COMPONENTS 
    -- distincts avec leurs PORT MAP respectif. 

component Thermo2Bin is
  Port ( ADCth : in STD_LOGIC_VECTOR(11 downto 0);
        ADCbin : out STD_LOGIC_VECTOR(3 downto 0);
        erreurT2B : out std_logic
         );
end component;
   
--> Générez des signaux internes au test bench avec des noms associés et les même types que dans le port
    -- Note: les noms peuvent être identiques, dans l'exemple on a ajouté un suffixe pour
    -- identifier clairement le signal qui appartient au test bench

   SIGNAL ADCbin_sim    : STD_LOGIC_VECTOR(3 downto 0);
   SIGNAL ADCth_sim     : STD_LOGIC_vector(11 downto 0);
   SIGNAL erreurT2b_sim    : STD_LOGIC;
  

--> S'il y a plusieurs bits en entrée pour lesquels il faut définir des valeurs de test, 
    -- par exemple a, b, c dans l'exemple présent, on recommande de créer un vecteur de test,
    -- ce qui facilitera l'écriture du test et la lisibilité du code,
    -- notamment en faisant apparaître clairement une structure de table de vérité

  -- SIGNAL vect_test : STD_LOGIC_VECTOR (1 downto 0);  -- Création d'un signal interne (3 bits)
   
--> Déclarez la constante PERIOD qui est utilisée pour la simulation

   CONSTANT PERIOD    : time := 10 ns;                  --  *** à ajouter avant le premier BEGIN

--> Il faut faire un port map entre vos signaux internes et le component à tester
--> NOTE: Si vous voulez comparer 2 modules VHDL, vous devez génréer 2 port maps 


BEGIN
  -- Par le "port-map" suivant, cela revient à connecter le composant aux signaux internes du tests bench
  -- UUT Unit Under Test: ce nom est habituel mais non imposé.
  -- Si on simule deux composantes, on pourrait avoir UUT1, UUT2 par exemple
  
  UUT: Thermo2Bin PORT MAP(
      ADCbin => ADCbin_sim, 
      ADCth => ADCth_sim,
      erreurT2B => erreurT2b_sim
   );

 --> on assigne les signaux du vecteur de test vers les signaux connectés au port map. 
--X_sim <= vect_test(1); 
--Y_sim <= vect_test(0);
--c_sim <= vect_test(0);
 
-- *** Test Bench - User Defined Section ***
-- l'intérêt de cette structure de test bench est que l'on recopie la table de vérité.

   tb : PROCESS
   BEGIN
--         wait for PERIOD; ADCbin_sim <="0000";   --> Remarquez que "vect_test" contient exactement la table de vérité.  
--         wait for PERIOD; ADCbin_sim <="0001";   --> Remarquez que "vect_test" contient exactement la table de vérité.  
--         wait for PERIOD; ADCbin_sim <="0010";   --> Avec cette façon, on s'assure de ne pas manquer de cas
--         wait for PERIOD; ADCbin_sim <="0011";   --> Avec cette façon, on s'assure de ne pas manquer de cas
--         wait for PERIOD; ADCbin_sim <="0100";
--         wait for PERIOD; ADCbin_sim <="0101";
--         wait for PERIOD; ADCbin_sim <="0110";
--         wait for PERIOD; ADCbin_sim <="0111";
--         wait for PERIOD; ADCbin_sim <="1000";
--         wait for PERIOD; ADCbin_sim <="1001";
--         wait for PERIOD; ADCbin_sim <="1010";
--         wait for PERIOD; ADCbin_sim <="1011";
--         wait for PERIOD; ADCbin_sim <="1100";
--         wait for PERIOD; ADCbin_sim <="1101";
--         wait for PERIOD; ADCbin_sim <="1110";
--         wait for PERIOD; ADCbin_sim <="1111";
         
       --> Cette partie est un exemple pour simuler le thermométrique
--         wait for PERIOD; ADCth_sim <="000000000000"; --> Code normal
--         wait for PERIOD; ADCth_sim <="000000000001";
--         wait for PERIOD; ADCth_sim <="000000000011";
--         wait for PERIOD; ADCth_sim <="000000000111";
--         wait for PERIOD; ADCth_sim <="000000001111";
--         wait for PERIOD; ADCth_sim <="000000011111";
--         wait for PERIOD; ADCth_sim <="000000111111";
--         wait for PERIOD; ADCth_sim <="000001111111";
--         wait for PERIOD; ADCth_sim <="000011111111";
--         wait for PERIOD; ADCth_sim <="000111111111";
--         wait for PERIOD; ADCth_sim <="001111111111";
--         wait for PERIOD; ADCth_sim <="011111111111";
--         wait for PERIOD; ADCth_sim <="111111111111";
--         wait for PERIOD; ADCth_sim <="000000000010";  --> Code avec erreur
--         wait for PERIOD; ADCth_sim <="000000101111";
--         wait for PERIOD; ADCth_sim <="111100001111";  --> Code avec erreur
         --> Cette partie représente le plan de test
         wait for PERIOD; ADCth_sim <="000000000000"; --> Test 1 : valeur voulue :0000 erreur : 0
         wait for PERIOD; ADCth_sim <="000000000001"; --> Test 2 : valeur voulue :0001 erreur : 0
         wait for PERIOD; ADCth_sim <="111111111111"; --> Test 3 : valeur voulue :1100 erreur : 0
         wait for PERIOD; ADCth_sim <="000000001111"; --> Test 4 : valeur voulue :0100 erreur : 0
         wait for PERIOD; ADCth_sim <="000000000101"; --> Test 5 : valeur voulue :0000 erreur : 1
         wait for PERIOD; ADCth_sim <="000000111111"; --> Test 6 : valeur voulue :0110 erreur : 0
         wait for PERIOD; ADCth_sim <="000001011111"; --> Test 7 : valeur voulue :0000 erreur : 1
         wait for PERIOD; ADCth_sim <="001111111111"; --> Test 8 : valeur voulue :1010 erreur : 0
         wait for PERIOD; ADCth_sim <="000011110000"; --> Test 9 : valeur voulue :0000 erreur : 1
         wait for PERIOD; ADCth_sim <="010111111111"; --> Test 10 : valeur voulue :0000 erreur : 1
         


                  
         WAIT; -- will wait forever
   END PROCESS;
END;

