library IEEE;
use IEEE.std_logic_unsigned.all; 
use IEEE.std_logic_1164.all;

entity	ceas is
port(clock, clear, set_time, enable, en_alarma, en_radio: in std_logic;
	s1: in std_logic_vector(3 downto 0);	
	s2: in std_logic_vector(2 downto 0);
	m1: in std_logic_vector(3 downto 0);
	m2: in std_logic_vector(2 downto 0);
	h1: in std_logic_vector(3 downto 0);
	h2: in std_logic_vector(2 downto 0); 
	e1: out std_logic_vector(6 downto 0);
	e2: out std_logic_vector(7 downto 0);
	e3: out std_logic_vector(6 downto 0);
	e4: out std_logic_vector(7 downto 0);
	e5: out std_logic_vector(6 downto 0);
	e6: inout std_logic_vector(7 downto 0);
	set_alarma_1: in std_logic_vector(3 downto 0);
	set_alarma_2: in std_logic_vector(2 downto 0);
	set_alarma_3: in std_logic_vector(3 downto 0);
	set_alarma_4: in std_logic_vector(2 downto 0);
	set_alarma_5: in std_logic_vector(3 downto 0);
	set_alarma_6: in std_logic_vector(2 downto 0);
	set_radio_1: in std_logic_vector(3 downto 0); 
	set_radio_2: in std_logic_vector(2 downto 0);
	set_radio_3: in std_logic_vector(3 downto 0);
	set_radio_4: in std_logic_vector(2 downto 0);
	set_radio_5: in std_logic_vector(3 downto 0);
	set_radio_6: in std_logic_vector(2 downto 0));
end entity;	 

architecture comportamentala1 of ceas is	
signal carry1: std_logic;
signal carry2: std_logic;
signal carry3: std_logic;
signal carry4: std_logic;
signal carry5: std_logic;   
signal carry6: std_logic;
signal alarma1:std_logic; 	
signal alarma2:std_logic;
signal alarma3:std_logic;
signal alarma4:std_logic;
signal alarma5:std_logic;
signal alarma6:std_logic; 
signal start_alarma: std_logic; 
signal radio1:std_logic;
signal radio2: std_logic;
signal radio3: std_logic;
signal radio4: std_logic;
signal radio5: std_logic;
signal radio6: std_logic;  
signal start_radio: std_logic;

component Numarator_secunde_unitati_1 is
    Port ( clock : in  STD_LOGIC;
           clear : in  STD_LOGIC;
			  set_time : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           en_alarma : in  STD_LOGIC;
           en_radio : in  STD_LOGIC;
			  sc_a : inout  STD_LOGIC; --start counting alarma-> not count yet
           sc_r : inout  STD_LOGIC; -- start counting radio
           set_alarma : in  STD_LOGIC_vector(3 downto 0);
           set_radio : in  STD_LOGIC_vector(3 downto 0) ;
           i : in  STD_LOGIC_vector(3 downto 0);
           o : out  STD_LOGIC_vector(6 downto 0);
           alarma : out  STD_LOGIC;
           radio : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end component;	

component	Numarator_secunde_zeci is
    Port ( clock : in  STD_LOGIC;
           clear : in  STD_LOGIC;
			  set_time : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           en_alarma : in  STD_LOGIC;
           en_radio : in  STD_LOGIC;
			  sc_a : inout  STD_LOGIC;
           sc_r : inout  STD_LOGIC;
           set_alarma : in  STD_LOGIC_vector(2 downto 0);
           set_radio : in  STD_LOGIC_vector(2 downto 0);
           i : in  STD_LOGIC_vector(2 downto 0);
           o : out  STD_LOGIC_vector(7 downto 0);
           alarma : out  STD_LOGIC;
           radio : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end component;	  

component Numarator_minute_unitati is
    Port ( clock : in  STD_LOGIC;
           clear : in  STD_LOGIC;
			  set_time : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           en_alarma : in  STD_LOGIC;
           en_radio : in  STD_LOGIC;
           sc_a : inout  STD_LOGIC; --start counting alarma-> not count yet
           sc_r : inout  STD_LOGIC; -- start counting radio
           set_alarma : in  STD_LOGIC_vector(3 downto 0);
           set_radio : in  STD_LOGIC_vector(3 downto 0) ;
           i : in  STD_LOGIC_vector(3 downto 0);
           o : out  STD_LOGIC_vector(6 downto 0);
           alarma : out  STD_LOGIC;
           radio: out  STD_LOGIC;
           carry : out  STD_LOGIC);
end component;

component	Numarator_minute_zeci is
    Port ( clock : in  STD_LOGIC;
           clear : in  STD_LOGIC;
			  set_time : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           en_alarma : in  STD_LOGIC;
           en_radio : in  STD_LOGIC;
			  sc_a : inout  STD_LOGIC; --start counting alarma-> not count yet
           sc_r : inout  STD_LOGIC; -- start counting radio
           set_alarma : in  STD_LOGIC_vector(2 downto 0);
           set_radio : in  STD_LOGIC_vector(2 downto 0) ;
           i : in  STD_LOGIC_vector(2 downto 0);
           o : out  STD_LOGIC_vector(7 downto 0);
           alarma : out  STD_LOGIC;
           radio: out  STD_LOGIC;
           carry : out  STD_LOGIC);
end component;		 

component	Numarator_ora_unitati is
    Port ( clock : in  STD_LOGIC;
           clear : in  STD_LOGIC;
			  set_time : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           en_alarma : in  STD_LOGIC;
           en_radio : in  STD_LOGIC;
			  sc_a : inout  STD_LOGIC; --start counting alarma-> not count yet
           sc_r : inout  STD_LOGIC; -- start counting radio
           set_alarma : in  STD_LOGIC_vector(3 downto 0);
           set_radio : in  STD_LOGIC_vector(3 downto 0) ;
           i : in  STD_LOGIC_vector(3 downto 0);
           o : out  STD_LOGIC_vector(6 downto 0);
           alarma : out  STD_LOGIC;
           radio: out  STD_LOGIC;  
           carry : out  STD_LOGIC);
end component;	   

component	Numarator_ora_zeci is
    Port ( clock : in  STD_LOGIC;
           clear : in  STD_LOGIC;
			  set_time : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           en_alarma : in  STD_LOGIC;
           en_radio : in  STD_LOGIC;
           sc_a : inout  STD_LOGIC; --start counting alarma-> not count yet
           sc_r : inout  STD_LOGIC; -- start counting radio
           set_alarma : in  STD_LOGIC_vector(2 downto 0);
           set_radio : in  STD_LOGIC_vector(2 downto 0) ;
           i : in  STD_LOGIC_vector(2 downto 0);
           o : out  STD_LOGIC_vector(7 downto 0);
           alarma : out  STD_LOGIC;
           radio: out  STD_LOGIC;
           carry : out  STD_LOGIC);
end component;


component BCD_7_Segmente_3_biti is
    Port ( A : in  STD_LOGIC_VECTOR (2 downto 0);
           BCD : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component BCD_7_Segmente_4_biti is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

component Comparator is
  port (
      A,B  : in std_logic_vector(3 downto 0);
      G, E, L  : out std_logic
   );
end component;

component Comparator_3b is
  port (
      A,B  : in std_logic_vector(2 downto 0);
      G, E, L  : out std_logic
   );
end component;
 

signal n: std_logic := '0' ; 
signal n1: std_logic := '0' ; 
signal n2: std_logic := '0' ; 
signal n3: std_logic := '0' ;  
signal n4: std_logic := '0' ;	
signal n5: std_logic := '0' ; 
signal n6: std_logic := '0' ; 
signal ncy: std_logic := '0' ; 
signal ncy2: std_logic := '0' ; 
signal ncy3: std_logic := '0' ; 
signal ncy4: std_logic := '0' ; 
signal ncy5: std_logic := '0' ; 
signal ncy6: std_logic := '0' ; 
signal ncyr: std_logic := '0' ;
signal ncyr2: std_logic := '0' ; 
signal ncyr3: std_logic := '0' ; 
signal ncyr4: std_logic := '0' ; 
signal ncyr5: std_logic := '0' ; 
signal ncyr6: std_logic := '0' ; 
begin  	   
	n<=carry1 AND carry2;	
	n1 <= carry1 and carry2 and carry3;
	n2 <= carry1 and carry2 and carry3 and carry4;
	n3 <= carry1 and carry2 and carry3 and carry4 and carry5; 
	--n4 <= carry1 and carry2 and carry3 and carry4 and carry5 and carry6;
	n5 <=clear and clock; ---variabila care reseteaza ceasul la clk'event 
	n6 <=set_time and clock;  ---variabila care incarca ceasul la clk'event
	start_alarma <= alarma1 and alarma2 and alarma3 and alarma4 and alarma5 and alarma6; 
	start_radio <= radio1 and radio2 and radio3 and radio4 and radio5 and radio6; 
	port1: Numarator_secunde_unitati_1 port map(clock, clear, set_time, enable, en_alarma,en_radio,ncy,ncyr, set_alarma_1,set_radio_1, s1, e1, alarma1,radio1, carry1); 
	port2: Numarator_secunde_zeci port map(carry1, n5, n6, enable,en_alarma,en_radio,ncy2,ncyr2,set_alarma_2,set_radio_2, s2, e2,alarma2,radio2, carry2);
	port3: Numarator_minute_unitati port map(n, n5, n6, enable,en_alarma,en_radio,ncy2,ncyr2,set_alarma_3,set_radio_3, m1, e3,alarma3,radio3, carry3);
	port4: Numarator_minute_zeci port map(n1, n5, n6, enable,en_alarma,en_radio,ncy3,ncyr3,set_alarma_4,set_radio_4, m2, e4,alarma4,radio4, carry4);
	port5: Numarator_ora_unitati port map(n2, n5, n6, enable,en_alarma,en_radio,ncy4,ncyr4,set_alarma_5,set_radio_5, h1, e5,alarma5,radio5, carry5);
	port6: Numarator_ora_zeci port map(n3, n5, n6, enable,en_alarma,en_radio,ncy5,ncyr5,set_alarma_6,set_radio_6, h2, e6,alarma6,radio6, carry6);
	c1: Comparator port map (s1,set_alarma_1);
	c2: Comparator_3b port map (s2, set_alarma_2);
	c3: Comparator port map (m1,set_alarma_3);
	c4: Comparator_3b port map (m2, set_alarma_4);
	c5: Comparator port map (h1,set_alarma_5);
	c6: Comparator_3b port map (h2, set_alarma_6);
	u1: BCD_7_Segmente_4_biti  port map (s1,e1);
	u2: BCD_7_Segmente_3_biti  port map (s2,e2);
	u3: BCD_7_Segmente_4_biti  port map (m1,e3);
	u4: BCD_7_Segmente_3_biti  port map (m2,e4);
	u5: BCD_7_Segmente_4_biti  port map (h1,e5);
	u6: BCD_7_Segmente_3_biti  port map (h2,e6);
 end architecture;
 
