--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:10:27 05/31/2022
-- Design Name:   
-- Module Name:   C:/Users/maria/Proiect/Numaratoare/num_sec.vhd
-- Project Name:  Numaratoare
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Numarator_secunde_unitati_1
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
 
ENTITY num_sec IS
END num_sec;
 
ARCHITECTURE behavior OF num_sec IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Numarator_secunde_unitati_1
    PORT(
         clock : IN  std_logic;
         clear : IN  std_logic;
         enable : IN  std_logic;
         en_alarma : IN  std_logic;
         en_radio : IN  std_logic;
         set_time : IN  std_logic;
         set_alarma : IN  std_logic_vector(3 downto 0);
         set_radio : IN  std_logic_vector(3 downto 0);
         i : IN  std_logic_vector(3 downto 0);
         o : OUT  std_logic_vector(3 downto 0);
         alarma : OUT  std_logic;
         radio : OUT  std_logic;
         sc_a : INOUT  std_logic;
         sc_r : INOUT  std_logic;
         carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal clear : std_logic := '0';
   signal enable : std_logic := '0';
   signal en_alarma : std_logic := '0';
   signal en_radio : std_logic := '0';
   signal set_time : std_logic := '0';
   signal set_alarma : std_logic_vector(3 downto 0) := (others => '0');
   signal set_radio : std_logic_vector(3 downto 0) := (others => '0');
   signal i : std_logic_vector(3 downto 0) := (others => '0');

	--BiDirs
   signal sc_a : std_logic;
   signal sc_r : std_logic;

 	--Outputs
   signal o : std_logic_vector(3 downto 0);
   signal alarma : std_logic;
   signal radio : std_logic;
   signal carry : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Numarator_secunde_unitati_1 PORT MAP (
          clock => clock,
          clear => clear,
          enable => enable,
          en_alarma => en_alarma,
          en_radio => en_radio,
          set_time => set_time,
          set_alarma => set_alarma,
          set_radio => set_radio,
          i => i,
          o => o,
          alarma => alarma,
          radio => radio,
          sc_a => sc_a,
          sc_r => sc_r,
          carry => carry
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      clock<='1';
      wait for clock_period*10;

    wait for 100 ns;	
      clock<='0';
      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
