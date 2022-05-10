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

ENTITY Top_tb IS          --> Remarquez que l'ENTITY est vide et doit le demeurer pour un test bench !!!  
END Top_tb;


ARCHITECTURE behavioral OF Top_tb IS 

--> Remplacer ce COMPONENT par celui de votre COMPONENT à tester 
    -- Note: vous pouvez copier la partie PORT ( .. ) de l'entity de votre code VHDL 
    -- et l'insérer dans la déclaration COMPONENT.
--> Si vous voulez comparer 2 modules VHDL, vous pouvez déclarer 2 COMPONENTS 
    -- distincts avec leurs PORT MAP respectif. 

component Add4bits is
    Port ( X4bit : in STD_LOGIC_vector(3 downto 0);
           Y4bit : in STD_LOGIC_vector(3 downto 0);
           Ci4bit : in STD_LOGIC;
           S4bit : out STD_LOGIC_vector(3 downto 0);
           Co4bit : out STD_LOGIC);
end component;
   
--> Générez des signaux internes au test bench avec des noms associés et les même types que dans le port
    -- Note: les noms peuvent être identiques, dans l'exemple on a ajouté un suffixe pour
    -- identifier clairement le signal qui appartient au test bench

   SIGNAL X_sim    : STD_LOGIC_vector(3 downto 0);
   SIGNAL Y_sim         : STD_LOGIC_vector(3 downto 0);
   SIGNAL Ci_sim         : STD_LOGIC;
   SIGNAL S_sim         : STD_LOGIC_vector(3 downto 0);
   SIGNAL Co_sim        : STD_LOGIC;

--> S'il y a plusieurs bits en entrée pour lesquels il faut définir des valeurs de test, 
    -- par exemple a, b, c dans l'exemple présent, on recommande de créer un vecteur de test,
    -- ce qui facilitera l'écriture du test et la lisibilité du code,
    -- notamment en faisant apparaître clairement une structure de table de vérité

   SIGNAL vect_test : STD_LOGIC_VECTOR (8 downto 0);  -- Création d'un signal interne (3 bits)
   
--> Déclarez la constante PERIOD qui est utilisée pour la simulation

   CONSTANT PERIOD    : time := 10 ns;                  --  *** à ajouter avant le premier BEGIN

--> Il faut faire un port map entre vos signaux internes et le component à tester
--> NOTE: Si vous voulez comparer 2 modules VHDL, vous devez génréer 2 port maps 


BEGIN
  -- Par le "port-map" suivant, cela revient à connecter le composant aux signaux internes du tests bench
  -- UUT Unit Under Test: ce nom est habituel mais non imposé.
  -- Si on simule deux composantes, on pourrait avoir UUT1, UUT2 par exemple
  
  UUT: Add4bits PORT MAP(
      X4bit => X_sim, 
      Y4bit => Y_sim, 
      S4bit => S_sim, 
      Ci4bit => Ci_sim,
      Co4bit => Co_sim
   );

 --> on assigne les signaux du vecteur de test vers les signaux connectés au port map. 
X_sim <= vect_test(3 downto 0); 
Y_sim <= vect_test(7 downto 4);
Ci_sim <= vect_test(8);
 

   tb : PROCESS
   BEGIN
         wait for PERIOD; vect_test <="000000000";   --> Remarquez que "vect_test" contient exactement la table de vérité.  
         wait for PERIOD; vect_test <="000000001";   --> Avec cette façon, on s'assure de ne pas manquer de cas
         wait for PERIOD; vect_test <="001000010";
         wait for PERIOD; vect_test <="000100011";
         wait for PERIOD; vect_test <="000010100";
         wait for PERIOD; vect_test <="000000101";
         wait for PERIOD; vect_test <="011100110";
         wait for PERIOD; vect_test <="001110111";                  
         WAIT; -- will wait forever
   END PROCESS;
END;