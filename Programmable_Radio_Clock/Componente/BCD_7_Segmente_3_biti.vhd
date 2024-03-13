 --Company: 
-- Engineer: 
-- 
-- Create Date:    22:20:39 05/04/2022 
-- Design Name: 
-- Module Name:    BCD_7_Segmente - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD_7_Segmente_3_biti is
    Port ( A : in  STD_LOGIC_VECTOR (2 downto 0);
           BCD : out  STD_LOGIC_VECTOR (7 downto 0));
end BCD_7_Segmente_3_biti;

architecture behavorial of BCD_7_Segmente_3_biti is

begin
	BCD(0) <= not A(2) and not A(1) and not A(0);
	BCD(1) <= not A(2) and not A(1) and  A(0);
	BCD(2) <= not A(2) and A(1) and not A(0);
	BCD(3) <= not A(2) and A(1) and A(0);
	BCD(4) <= A(2) and not A(1) and not A(0);
	BCD(5) <= A(2) and not A(1) and A(0);
	BCD(6) <= A(2) and A(1) and not A(0);
   BCD(7) <= A(2) and A(1) and A(0);
end behavorial;
