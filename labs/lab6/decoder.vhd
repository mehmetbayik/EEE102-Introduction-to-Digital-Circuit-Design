library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
        when others => LEDout <= "1111111"; --no LED activated
        end case;
    end process;


end Behavioral;
