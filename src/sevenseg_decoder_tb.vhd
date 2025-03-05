---------------------------------------------------------------------------------
-- Engineer: C1C Matthew Romines
-- 
-- Create Date: 03/04/2025 03:58:38 PM
-- Design Name: Testbench for sevenseg_decoder
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: Lab 2
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder_tb is
end sevenseg_decoder_tb;

architecture test_bench of sevenseg_decoder_tb is
    component sevenseg_decoder is 
        port(
        i_Hex : in std_logic_vector(3 downto 0);
        o_seg_n : out std_logic_vector(6 downto 0)
        );
    end component;
    
    signal w_sw : std_logic_vector(3 downto 0):= (others=> '0');
    signal w_seg: std_logic_vector(6 downto 0);

    begin
        sevenseg_decoder_inst : sevenseg_decoder port map(
            i_Hex(0) => w_sw(0),
            i_Hex(1) => w_sw(1),
            i_Hex(2) => w_sw(2),
            i_Hex(3) => w_sw(3),
            o_seg_n(0) => w_seg(0),
            o_seg_n(1) => w_seg(1),
            o_seg_n(2) => w_seg(2),
            o_seg_n(3) => w_seg(3),
            o_seg_n(4) => w_seg(4),
            o_seg_n(5) => w_seg(5),
            o_seg_n(6) => w_seg(6)
        );
        
    test_process : process
    begin 
        -- tests a portion of cases
        w_sw <= x"0"; wait for 10 ns;
            assert w_seg = "1000000" report "error on x0" severity failure;
        w_sw <= x"3"; wait for 10 ns;
            assert w_seg = "0110000" report "error on x3" severity failure;
        w_sw <= x"A"; wait for 10 ns;
            assert w_seg = "0001000" report "error on xA" severity failure;
        w_sw <= x"F"; wait for 10 ns;
            assert w_seg = "0001110" report "error on xF" severity failure;
        w_sw <= x"8"; wait for 10 ns;
            assert w_seg = "0000000" report "error on x8" severity failure;
   
        wait;
        
    end process;

end test_bench;
