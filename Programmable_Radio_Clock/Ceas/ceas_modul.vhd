--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:45:54 05/31/2022
-- Design Name:   
-- Module Name:   C:/Users/maria/Proiect/Ceas/ceas_modul.vhd
-- Project Name:  Ceas
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ceas
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ceas_modul IS
END ceas_modul;
 
ARCHITECTURE behavior OF ceas_modul IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ceas
    PORT(
         clock : IN  std_logic;
         clear : IN  std_logic;
         set_time : IN  std_logic;
         enable : IN  std_logic;
         en_alarma : IN  std_logic; 
         en_radio : IN  std_logic;
         s1 : IN  std_logic_vector(3 downto 0);
         s2 : IN  std_logic_vector(2 downto 0);
         m1 : IN  std_logic_vector(3 downto 0);
         m2 : IN  std_logic_vector(2 downto 0);
         h1 : IN  std_logic_vector(3 downto 0);
         h2 : IN  std_logic_vector(2 downto 0);
         e1 : OUT  std_logic_vector(6 downto 0);
         e2 : OUT  std_logic_vector(7 downto 0);
         e3 : OUT  std_logic_vector(6 downto 0);
         e4 : OUT  std_logic_vector(7 downto 0);
         e5 : OUT  std_logic_vector(6 downto 0);
         e6 : INOUT  std_logic_vector(7 downto 0);
         set_alarma_1 : IN  std_logic_vector(3 downto 0);
         set_alarma_2 : IN  std_logic_vector(2 downto 0);
         set_alarma_3 : IN  std_logic_vector(3 downto 0);
         set_alarma_4 : IN  std_logic_vector(2 downto 0);
         set_alarma_5 : IN  std_logic_vector(3 downto 0);
         set_alarma_6 : IN  std_logic_vector(2 downto 0);
         set_radio_1 : IN  std_logic_vector(3 downto 0);
         set_radio_2 : IN  std_logic_vector(2 downto 0);
         set_radio_3 : IN  std_logic_vector(3 downto 0);
         set_radio_4 : IN  std_logic_vector(2 downto 0);
         set_radio_5 : IN  std_logic_vector(3 downto 0);
         set_radio_6 : IN  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal clear : std_logic := '0';
   signal set_time : std_logic := '0';
   signal enable : std_logic := '0';
   signal en_alarma : std_logic := '0';
   signal en_radio : std_logic := '0';
   signal s1 : std_logic_vector(3 downto 0) := (others => '0');
   signal s2 : std_logic_vector(2 downto 0) := (others => '0');
   signal m1 : std_logic_vector(3 downto 0) := (others => '0');
   signal m2 : std_logic_vector(2 downto 0) := (others => '0');
   signal h1 : std_logic_vector(3 downto 0) := (others => '0');
   signal h2 : std_logic_vector(2 downto 0) := (others => '0');
   signal set_alarma_1 : std_logic_vector(3 downto 0) := (others => '0');
   signal set_alarma_2 : std_logic_vector(2 downto 0) := (others => '0');
   signal set_alarma_3 : std_logic_vector(3 downto 0) := (others => '0');
   signal set_alarma_4 : std_logic_vector(2 downto 0) := (others => '0');
   signal set_alarma_5 : std_logic_vector(3 downto 0) := (others => '0');
   signal set_alarma_6 : std_logic_vector(2 downto 0) := (others => '0');
   signal set_radio_1 : std_logic_vector(3 downto 0) := (others => '0');
   signal set_radio_2 : std_logic_vector(2 downto 0) := (others => '0');
   signal set_radio_3 : std_logic_vector(3 downto 0) := (others => '0');
   signal set_radio_4 : std_logic_vector(2 downto 0) := (others => '0');
   signal set_radio_5 : std_logic_vector(3 downto 0) := (others => '0');
   signal set_radio_6 : std_logic_vector(2 downto 0) := (others => '0');

	--BiDirs
   signal e6 : std_logic_vector(7 downto 0);

 	--Outputs
   signal e1 : std_logic_vector(6 downto 0);
   signal e2 : std_logic_vector(7 downto 0);
   signal e3 : std_logic_vector(6 downto 0);
   signal e4 : std_logic_vector(7 downto 0);
   signal e5 : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ceas PORT MAP (
          clock => clock,
          clear => clear,
          set_time => set_time,
          enable => enable,
          en_alarma => en_alarma,
          en_radio => en_radio,
          s1 => s1,
          s2 => s2,
          m1 => m1,
          m2 => m2,
          h1 => h1,
          h2 => h2,
          e1 => e1,
          e2 => e2,
          e3 => e3,
          e4 => e4,
          e5 => e5,
          e6 => e6,
          set_alarma_1 => set_alarma_1,
          set_alarma_2 => set_alarma_2,
          set_alarma_3 => set_alarma_3,
          set_alarma_4 => set_alarma_4,
          set_alarma_5 => set_alarma_5,
          set_alarma_6 => set_alarma_6,
          set_radio_1 => set_radio_1,
          set_radio_2 => set_radio_2,
          set_radio_3 => set_radio_3,
          set_radio_4 => set_radio_4,
          set_radio_5 => set_radio_5,
          set_radio_6 => set_radio_6
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for 10 ns;
		clock <= '1';
		wait for 10 ns;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;
      --clock <= '1';
      enable<='1';
		clear<='0';
		set_time<='1';
		en_alarma<='1';
		en_radio<='1';
		s1<="0011";
      s2<="001";
      m1<="1000";
      m2<="010";
      h1<="0010";
		h2<="011";
	 set_alarma_1 <= "0010";
    set_alarma_2 <= "010";
    set_alarma_3 <="0110";
    set_alarma_4 <="001";
    set_alarma_5 <="0100";
    set_alarma_6<= "010";
    set_radio_1 <="0101";
    set_radio_2<= "010";
    set_radio_3 <="1000" ;
    set_radio_4 <= "010"; 
	 set_radio_5 <= "0100";
    set_radio_6 <= "010";
			wait for 20 ns;
			
		--clock <= '0';
		wait for 20 ns;
		
		--clock<='1';
      enable<='1';
		clear<='0';
		set_time<='1';
		en_alarma<='0';
		en_radio<='0';
		s1<="0001";
      s2<="000";
      m1<="0110";
      m2<="010";
      h1<="0100";
		h2<="011";
		wait for 10 ns;

      wait;
   end process;

END;
