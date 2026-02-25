--+----------------------------------------------------------------------------
--| Testbench for sevenseg_decoder
--+----------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is 
	
  -- declare the component of your top-level design unit under test (UUT)
  component sevenseg_decoder is
  Port (i_HEX : in std_logic_vector(3 downto 0);
        o_seg_n : out std_logic_vector(6 downto 0)
        );
    end component sevenseg_decoder;
  
 
	-- declare signals needed to stimulate the UUT inputs
	signal w_HEX     : std_logic_vector(3 downto 0) := x"0"; -- the numbers being added
	signal w_seg         : std_logic_vector(6 downto 0) := "0000000";

begin
	-- PORT MAPS ----------------------------------------
	sevenseg_decoder_uut : sevenseg_decoder port map (
	   i_HEX => w_HEX,
	   o_seg_n => w_seg
	);
	
	-- PROCESSES ----------------------------------------	
	-- Test Plan Process
	-- Implement the test plan here.  Body of process is continuously from time = 0  
	test_process : process 
	begin
	
	   -- Test all zeros input
	w_HEX <= x"0"; wait for 10 ns;                                         
        assert (w_seg = "1000000") report "bad 0 value" severity failure; 
    w_HEX <= x"1"; wait for 10 ns;                                         
        assert (w_seg = "1111001") report "bad 1 value" severity failure; 
    w_HEX <= x"2"; wait for 10 ns;                                         
        assert (w_seg = "0100100") report "bad 2 value" severity failure; 
    w_HEX <= x"3"; wait for 10 ns;                                         
        assert (w_seg = "0110000") report "bad 3 value" severity failure; 
    w_HEX <= x"4"; wait for 10 ns;                                         
        assert (w_seg = "0011001") report "bad 4 value" severity failure; 
    w_HEX <= x"5"; wait for 10 ns;                                         
        assert (w_seg = "0010010") report "bad 5 value" severity failure; 
    w_HEX <= x"6"; wait for 10 ns;                                         
        assert (w_seg = "0000010") report "bad 6 value" severity failure; 
    w_HEX <= x"7"; wait for 10 ns;                                         
        assert (w_seg = "1111000") report "bad 7 value" severity failure; 
    w_HEX <= x"8"; wait for 10 ns;                                         
        assert (w_seg = "0000000") report "bad 8 value" severity failure; 
    w_HEX <= x"9"; wait for 10 ns;                                         
        assert (w_seg = "0011000") report "bad 9 value" severity failure; 
    w_HEX <= x"A"; wait for 10 ns;                                         
        assert (w_seg = "0001000") report "bad A value" severity failure; 
    w_HEX <= x"B"; wait for 10 ns;                                         
        assert (w_seg = "0000011") report "bad B value" severity failure; 
    w_HEX <= x"C"; wait for 10 ns;                                         
        assert (w_seg = "0110011") report "bad C value" severity failure; 
    w_HEX <= x"D"; wait for 10 ns;                                         
        assert (w_seg = "0100001") report "bad D value" severity failure; 
    w_HEX <= x"E"; wait for 10 ns;                                         
        assert (w_seg = "0000110") report "bad E value" severity failure; 
    w_HEX <= x"F"; wait for 10 ns;                                         
        assert (w_seg = "0001110") report "bad F value" severity failure;   
		wait; -- wait forever
	end process;	
	-----------------------------------------------------	
	
end test_bench;
