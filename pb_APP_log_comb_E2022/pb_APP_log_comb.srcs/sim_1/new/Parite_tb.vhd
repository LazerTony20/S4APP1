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

entity Parite_tb is
--  Port ( );
end Parite_tb;



ARCHITECTURE behavioral OF Parite_tb IS 

--> Remplacer ce COMPONENT par celui de votre COMPONENT à tester 
    -- Note: vous pouvez copier la partie PORT ( .. ) de l'entity de votre code VHDL 
    -- et l'insérer dans la déclaration COMPONENT.
--> Si vous voulez comparer 2 modules VHDL, vous pouvez déclarer 2 COMPONENTS 
    -- distincts avec leurs PORT MAP respectif. 

   component Parite
    Port ( S1 : in STD_LOGIC;
           ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           parite : out STD_LOGIC);
    end component;
   
   
   
--> Générez des signaux internes au test bench avec des noms associés et les même types que dans le port
    -- Note: les noms peuvent être identiques, dans l'exemple on a ajouté un suffixe pour
    -- identifier clairement le signal qui appartient au test bench

   SIGNAL sortie_sim    : STD_LOGIC;
   SIGNAL sw_sim        : STD_LOGIC;
   SIGNAL a_sim         : STD_LOGIC;
   SIGNAL b_sim         : STD_LOGIC;
   SIGNAL c_sim         : STD_LOGIC;
   SIGNAL d_sim         : STD_LOGIC;
   

--> S'il y a plusieurs bits en entrée pour lesquels il faut définir des valeurs de test, 
    -- par exemple a, b, c dans l'exemple présent, on recommande de créer un vecteur de test,
    -- ce qui facilitera l'écriture du test et la lisibilité du code,
    -- notamment en faisant apparaître clairement une structure de table de vérité

   SIGNAL vect_test : STD_LOGIC_VECTOR (3 downto 0);  -- Création d'un signal interne (3 bits)
   
--> Déclarez la constante PERIOD qui est utilisée pour la simulation

   CONSTANT PERIOD    : time := 50 us;                  --  *** à ajouter avant le premier BEGIN

--> Il faut faire un port map entre vos signaux internes et le component à tester
--> NOTE: Si vous voulez comparer 2 modules VHDL, vous devez génréer 2 port maps 


BEGIN
  -- Par le "port-map" suivant, cela revient à connecter le composant aux signaux internes du tests bench
  -- UUT Unit Under Test: ce nom est habituel mais non imposé.
  -- Si on simule deux composantes, on pourrait avoir UUT1, UUT2 par exemple
  
  UUT: Parite PORT MAP(
      parite => sortie_sim, 
      S1 => sw_sim, 
      ADCbin => vect_test
   );

 --> on assigne les signaux du vecteur de test vers les signaux connectés au port map. 
a_sim <= vect_test(3);
b_sim <= vect_test(2);
c_sim <= vect_test(1);
d_sim <= vect_test(0);

 
-- *** Test Bench - User Defined Section ***
-- l'intérêt de cette structure de test bench est que l'on recopie la table de vérité.

   tb : PROCESS
   BEGIN
         sw_sim <= '0';
         wait for PERIOD; vect_test <="0000";   --> Remarquez que "vect_test" contient exactement la table de vérité.  
         wait for PERIOD; vect_test <="0001";   --> Avec cette façon, on s'assure de ne pas manquer de cas
         wait for PERIOD; vect_test <="0010";
         wait for PERIOD; vect_test <="0011";
         wait for PERIOD; vect_test <="0100";
         wait for PERIOD; vect_test <="0101";
         wait for PERIOD; vect_test <="0110";
         wait for PERIOD; vect_test <="0111";
         wait for PERIOD; vect_test <="1000";   --> Remarquez que "vect_test" contient exactement la table de vérité.  
         wait for PERIOD; vect_test <="1001";   --> Avec cette façon, on s'assure de ne pas manquer de cas
         wait for PERIOD; vect_test <="1010";
         wait for PERIOD; vect_test <="1011";
         wait for PERIOD; vect_test <="1100";
         wait for PERIOD; vect_test <="1101";
         wait for PERIOD; vect_test <="1110";
         wait for PERIOD; vect_test <="1111";
         
         wait for PERIOD; vect_test <="0000";   --> Remarquez que "vect_test" contient exactement la table de vérité.  
         sw_sim <= '1';
         wait for PERIOD; vect_test <="0001";   --> Avec cette façon, on s'assure de ne pas manquer de cas
         wait for PERIOD; vect_test <="0010";
         wait for PERIOD; vect_test <="0011";
         wait for PERIOD; vect_test <="0100";
         wait for PERIOD; vect_test <="0101";
         wait for PERIOD; vect_test <="0110";
         wait for PERIOD; vect_test <="0111";
         wait for PERIOD; vect_test <="1000";   --> Remarquez que "vect_test" contient exactement la table de vérité.  
         wait for PERIOD; vect_test <="1001";   --> Avec cette façon, on s'assure de ne pas manquer de cas
         wait for PERIOD; vect_test <="1010";
         wait for PERIOD; vect_test <="1011";
         wait for PERIOD; vect_test <="1100";
         wait for PERIOD; vect_test <="1101";
         wait for PERIOD; vect_test <="1110";
         wait for PERIOD; vect_test <="1111";
         
         WAIT; -- will wait forever
   END PROCESS;
END;
