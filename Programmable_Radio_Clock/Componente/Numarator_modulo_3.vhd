library IEEE;
use IEEE.std_logic_unsigned.all; 
use IEEE.std_logic_1164.all;

entity	numarator_minute_unitati_incercare is
	port(clk, clr, ld,en,en_alarma,en_radio : in std_logic; 
	not_count_yet : inout bit; 
	not_count_yet_radio: inout bit;
	set_alarma: in std_logic_vector(3 downto 0);   
	set_radio: in std_logic_vector(3 downto 0);
	D: in std_logic_vector(3 downto 0);
	Q: out std_logic_vector(3 downto 0);
	alarma:out std_logic;
	radio: out std_logic;
	carry: out std_logic);
end entity;	   

architecture numarator1 of numarator_minute_unitati_incercare is  
signal a:std_logic_vector(3 downto 0) :="0000";
begin 
	process(clk, clr, ld,en) 
	begin	  
		if set_alarma="0000" and a="0000" and not_count_yet='0' and en_alarma='1' and en='1'  then
			alarma <= '1';
		end if;	 
		if set_radio="0000" and a="0000" and not_count_yet_radio='0' and en_radio='1' and en='1'  then
			radio <= '1';
			end if;
		if clr='1' then a<="0000";
		elsif ld='1' then a<=d;	
			elsif clk = '0' and a = "0000" then
		carry <= '0';
		elsif clk'event and clk='1' then
		if(en='1') then
			not_count_yet <= '1';
			not_count_yet_radio<='1';
		
			if en='1' then
			if a="1001" then carry<='1'; 
				if set_alarma = "0000" then alarma <='1';
				end if;	
				if set_radio = "0000" then radio <='1';
					end if;
			a<="0000"; 
			elsif a=set_alarma-1 and en_alarma='1' then alarma<='1';
			a<= a+'1'; 	 
			elsif a=set_radio-'1' and en_radio='1' then radio<='1';
			a<= a+'1';
			else carry<='0'; 
				a<=a+'1'; 
				alarma<='0';
				radio<='0';
					end if;
			end if;	 
			else a<=a;
			end if;
			end if;
			q<=a;
		end process; 
end architecture;