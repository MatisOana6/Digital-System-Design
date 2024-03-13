----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:47:29 05/31/2022 
-- Design Name: 
-- Module Name:    Comparator - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
 
entity Comparator_3b is
  port (
      A,B  : in std_logic_vector(2 downto 0);
      G, E, L  : out std_logic
   );
end Comparator_3b ;
 
architecture behavorial of Comparator_3b is
begin
PROCESS(A,B)
BEGIN
IF ( A<B) THEN L<='1'; E<='0';G<='0';
ELSIF (A=B) THEN L<='0'; E<='1';G<='0';
ELSIF( A>B) THEN L<='0'; E<='0';G<='1';
end IF;
END PROCESS;
END behavorial;


