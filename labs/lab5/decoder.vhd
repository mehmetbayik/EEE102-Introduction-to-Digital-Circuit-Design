library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder is
    Port (
        LEDin: in std_logic_vector(1 downto 0);
        LEDout: out std_logic_vector (6 downto 0)
    );
end decoder;

architecture Behavioral of decoder is

begin
    process(LEDin)
    begin
        case LEDin is
        when "00" => LEDout <= "0000001"; --0
        when "01" => LEDout <= "1001111"; --1

        when others => LEDout <= "1111111"; --no LED activated
        end case;
    end process;


end Behavioral;
