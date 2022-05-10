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
--> d'utiliser le nom du module �  tester avec un suffixe par exemple.

ENTITY TestBench_CheckErr4bits IS          --> Remarquez que l'ENTITY est vide et doit le demeurer pour un test bench !!!  
END TestBench_CheckErr4bits;


ARCHITECTURE behavioral OF TestBench_CheckErr4bits IS 

--> Remplacer ce COMPONENT par celui de votre COMPONENT �  tester 
    -- Note: vous pouvez copier la partie PORT ( .. ) de l'entity de votre code VHDL 
    -- et l'insérer dans la déclaration COMPONENT.
--> Si vous voulez comparer 2 modules VHDL, vous pouvez déclarer 2 COMPONENTS 
    -- distincts avec leurs PORT MAP respectif. 

component CheckErr4bits is
    Port (  In4Bit : in STD_LOGIC_VECTOR (3 downto 0); 
            previousHasZeros : in STD_LOGIC;
            hasZeros : out STD_LOGIC;
            erreur : out STD_LOGIC);
end component;
   
--> Générez des signaux internes au test bench avec des noms associés et les même types que dans le port
    -- Note: les noms peuvent être identiques, dans l'exemple on a ajouté un suffixe pour
    -- identifier clairement le signal qui appartient au test bench

   SIGNAL In4Bit_sim            : STD_LOGIC_VECTOR(3 downto 0);
   SIGNAL previousHasZeros_sim  : STD_LOGIC;
   SIGNAL hasZeros_sim          : STD_LOGIC;
   SIGNAL erreur_sim            : STD_LOGIC;

--> S'il y a plusieurs bits en entrée pour lesquels il faut définir des valeurs de test, 
    -- par exemple a, b, c dans l'exemple présent, on recommande de créer un vecteur de test,
    -- ce qui facilitera l'écriture du test et la lisibilité du code,
    -- notamment en faisant apparaître clairement une structure de table de vérité

  -- SIGNAL vect_test : STD_LOGIC_VECTOR (1 downto 0);  -- Création d'un signal interne (3 bits)
   
--> Déclarez la constante PERIOD qui est utilisée pour la simulation

   CONSTANT PERIOD    : time := 10 ns;                  --  *** �  ajouter avant le premier BEGIN

--> Il faut faire un port map entre vos signaux internes et le component �  tester
--> NOTE: Si vous voulez comparer 2 modules VHDL, vous devez génréer 2 port maps 


BEGIN
  -- Par le "port-map" suivant, cela revient �  connecter le composant aux signaux internes du tests bench
  -- UUT Unit Under Test: ce nom est habituel mais non imposé.
  -- Si on simule deux composantes, on pourrait avoir UUT1, UUT2 par exemple
  
  UUT: CheckErr4bits PORT MAP(
      In4Bit => In4Bit_sim, 
      previousHasZeros => previousHasZeros_sim,
      hasZeros => hasZeros_sim,
      erreur => erreur_sim
   );

 --> on assigne les signaux du vecteur de test vers les signaux connectés au port map. 
--X_sim <= vect_test(1); 
--Y_sim <= vect_test(0);
--c_sim <= vect_test(0);
 
-- *** Test Bench - User Defined Section ***
-- l'intérêt de cette structure de test bench est que l'on recopie la table de vérité.

   tb : PROCESS
   BEGIN
         previousHasZeros_sim <= '0';
         wait for PERIOD; In4Bit_sim <="0000";   --> Remarquez que "vect_test" contient exactement la table de vérité.    
         wait for PERIOD; In4Bit_sim <="0001";   --> Avec cette façon, on s'assure de ne pas manquer de cas
         wait for PERIOD; In4Bit_sim <="0010";
         wait for PERIOD; In4Bit_sim <="0100";
         wait for PERIOD; In4Bit_sim <="0101";
         wait for PERIOD; In4Bit_sim <="0110";
         wait for PERIOD; In4Bit_sim <="0111";
         
         previousHasZeros_sim <= '1';
         wait for PERIOD; In4Bit_sim <="0000";   --> Remarquez que "vect_test" contient exactement la table de vérité.    
         wait for PERIOD; In4Bit_sim <="0001";   --> Avec cette façon, on s'assure de ne pas manquer de cas
         wait for PERIOD; In4Bit_sim <="0010";
         wait for PERIOD; In4Bit_sim <="0100";
         wait for PERIOD; In4Bit_sim <="0101";
         wait for PERIOD; In4Bit_sim <="0110";
         wait for PERIOD; In4Bit_sim <="0111";
       --> Cette partie est un exemple pour simuler le thermométrique
--         wait for PERIOD; Thermometrique <="000000000000"; --> Code normal
--         wait for PERIOD; Thermometrique <="000000000001";
--         wait for PERIOD; Thermometrique <="000000000011";
--         wait for PERIOD; Thermometrique <="000000000111";
--         wait for PERIOD; Thermometrique <="000000001111";
--         wait for PERIOD; Thermometrique <="000000011111";
--         wait for PERIOD; Thermometrique <="000000111111";
--         wait for PERIOD; Thermometrique <="000001111111";
--         wait for PERIOD; Thermometrique <="000011111111";
--         wait for PERIOD; Thermometrique <="000111111111";
--         wait for PERIOD; Thermometrique <="001111111111";
--         wait for PERIOD; Thermometrique <="011111111111";
--         wait for PERIOD; Thermometrique <="111111111111";
--         wait for PERIOD; Thermometrique <="000000000010";  --> Code avec erreur
--         wait for PERIOD; Thermometrique <="000000101111";
--         wait for PERIOD; Thermometrique <="111100001111";
                  
         WAIT; -- will wait forever
   END PROCESS;
END;

