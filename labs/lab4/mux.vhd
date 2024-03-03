----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2021 18:41:34
-- Design Name: 
-- Module Name: mux - Behavioral
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

entity mux is
    Port (
    LEDcounter: in std_logic_vector (1 downto 0);
    switchs: in std_logic_vector (15 downto 0);
    LEDin: out std_logic_vector (3 downto 0);
    anode_activate: out std_logic_vector (3 downto 0) 
    );
end mux;

architecture Behavioral of mux is

begin
    process(LEDcounter)
    begin
        case LEDcounter is
        when "00" =>
            anode_activate <= "0111"; --LED1 is activated
            LEDin <= switchs(15 downto 12);
        when "01" =>
            anode_activate <= "1011"; --LED2 is activated
            LEDin <= switchs(11 downto 8); 
        when "10" =>
            anode_activate <= "1101"; --LED3 is activated
            LEDin <= switchs(7 downto 4);
        when "11" =>
            anode_activate <= "1110"; --LED2 is activated
            LEDin <= switchs(3 downto 0); 
        when others =>
            anode_activate <= "1111"; --no LED activated
            LEDin <= "0000";
        end case;
    end process;


end Behavioral;
