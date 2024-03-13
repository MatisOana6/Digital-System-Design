----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:44:49 05/30/2022 
-- Design Name: 
-- Module Name:    Numarator_modulo_10 - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Numarator_modulo_10 is
generic (n: natural := 8);
    Port ( enable : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (n-1 downto 0));
end Numarator_modulo_10;

architecture Behavioral of Numarator_modulo_10 is
signal tmp: std_logic_vector (n-1 downto 0) := (others => '1');
begin
    nr: process(reset,clock,enable)
 begin
   if(reset =  '1' ) then tmp<= X"00";
      elsif (rising_edge (clock)) then 
   if (enable = '1' ) then 
         tmp <= tmp+1;
   end if;
   if(tmp="1001") then 
      tmp <= X"00";
 end if;
 end if;
 end process;
  led <= tmp;
end Behavioral;

