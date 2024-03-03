

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

entity mux is
    Port (
    LEDcounter: in std_logic_vector (1 downto 0);
    switch_input: in std_logic_vector (8 downto 0);
    LEDin: out std_logic_vector(1 downto 0);
    anode_activate: out std_logic_vector (3 downto 0);
    result: in std_logic_vector (4 downto 0)
    );
end mux;

architecture Behavioral of mux is

begin
    process(LEDcounter)
    begin
        case LEDcounter is
        when "00" =>
            anode_activate <= "0111"; --LED1 is activated
            LEDin <= result(4 downto 3);
        when "01" =>
            anode_activate <= "1011"; --LED2 is activated
            LEDin <= '0' & result(2); 
        when "10" =>
            anode_activate <= "1101"; --LED3 is activated
            LEDin <= '0' & result(1);
        when others =>
            anode_activate <= "1110"; --LED2 is activated
            LEDin <= '0' & result(0);
        end case;
    end process;


end Behavioral;
