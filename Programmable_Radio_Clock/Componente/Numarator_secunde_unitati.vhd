----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:55:41 05/30/2022 
-- Design Name: 
-- Module Name:    Numarator_secunde_unitati - Behavioral 
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

entity Numarator_secunde_unitati_1 is
    Port ( clock : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           en_alarma : in  STD_LOGIC;
           en_radio : in  STD_LOGIC;
           set_time : in  STD_LOGIC;
           set_alarma : in  STD_LOGIC_vector(3 downto 0);
           set_radio : in  STD_LOGIC_vector(3 downto 0) ;
           i : in  STD_LOGIC_vector(3 downto 0);
           o : out  STD_LOGIC_vector(3 downto 0);
           alarma : out  STD_LOGIC;
           radio : out  STD_LOGIC;
           sc_a : inout  STD_LOGIC; --start counting alarma-> not count yet
           sc_r: inout  STD_LOGIC; -- start counting radio
           carry : out  STD_LOGIC);
end Numarator_secunde_unitati_1;

architecture Behavioral of Numarator_secunde_unitati_1 is
signal tmp: std_logic_vector(3 downto 0) :="0000"; --secundele in unitati sunt reprezentate pe 4 biti (de la 0 la 9), este un numarator modulo 10
begin 
process(clock,clear,enable,en_alarma,en_radio,set_time,set_alarma,set_radio,i,tmp,sc_a,sc_r)
--variable tmp: std_logic_vector(3 downto 0) :="0000";
begin
  if (enable='1' and en_alarma ='1' and tmp="0000" and sc_a='0' and set_alarma= "0000") 
             then alarma <= '1'; --arata ca s-a activat alarma
end if;
  if (enable='1' and en_radio ='1' and tmp="0000" and sc_r='0' and set_radio = "0000") 
             then radio<= '1'; --arata ca radio este pornit			 
end if;
if (set_alarma ="0000")
				then alarma <='1';
			end if;
			if (set_radio ="0000")
				then radio <='1';
			end if;
  if (clear='1')
      then tmp <="0000";
		  elsif (set_time='1') then
		     tmp<=i;
		elsif (clock='1' and clock'event) then
         if(enable='1') 		
		then  sc_a <= '1';
		      sc_r <='1';
				tmp<=tmp+"0001";
			          if(tmp="1001") then
					         carry<='1';
					         tmp<="0000";
					    else carry<='0';
					end if;
			end if;
		end if;
					 o<=tmp;
	end process;
end architecture;

