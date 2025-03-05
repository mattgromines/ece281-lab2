----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/04/2025 03:51:16 PM
-- Design Name: 
-- Module Name: sevenseg_decoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenseg_decoder is
    Port ( i_Hex : in STD_LOGIC_VECTOR (3 downto 0);
           o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
end sevenseg_decoder;

architecture Behavioral of sevenseg_decoder is
    signal o_seg : std_logic_vector (6 downto 0);
    signal flip : std_logic_vector (6 downto 0);
begin
    with i_Hex select
    o_seg <= "0111111" when x"0",
             "0000110" when x"1",
             "1011011" when x"2",
             "1001111" when x"3",
             "1100110" when x"4",
             "1101101" when x"5",
             "1111101" when x"6",
             "0000111" when x"7",
             "1111111" when x"8",
             "1100111" when x"9",
             "1110111" when x"A",
             "1111100" when x"B",
             "1011000" when x"C",
             "1011110" when x"D",
             "1111001" when x"E",
             "1110001" when x"F",
             "0000000" when others;
             
     o_seg_n <=  NOT(o_seg);

end Behavioral;
