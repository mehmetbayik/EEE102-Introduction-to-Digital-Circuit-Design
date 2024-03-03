----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2021 17:49:24
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity decoder is
    Port (
        LEDin: in std_logic_vector (3 downto 0);
        LEDout: out std_logic_vector (6 downto 0)
    );
end decoder;

architecture Behavioral of decoder is

begin
    process(LEDin)
    begin
        case LEDin is
        when "0000" => LEDout <= "0000001"; --0
        when "0001" => LEDout <= "1001111"; --1
        when "0010" => LEDout <= "0010010"; --2
        when "0011" => LEDout <= "0000110"; --3
        when "0100" => LEDout <= "1001100"; --4
        when "0101" => LEDout <= "0100100"; --5
        when "0110" => LEDout <= "0100000"; --6
        when "0111" => LEDout <= "0001111"; --7
        when "1000" => LEDout <= "0000000"; --8
        when "1001" => LEDout <= "0000100"; --9
        when "1010" => LEDout <= "0000010"; --a
        when "1011" => LEDout <= "1100000"; --b
        when "1100" => LEDout <= "0110001"; --C
        when "1101" => LEDout <= "1000010"; --d
        when "1110" => LEDout <= "0110000"; --E
        when "1111" => LEDout <= "0111000"; --F
        when others => LEDout <= "1111111"; --no LED activated
        end case;
    end process;


end Behavioral;
