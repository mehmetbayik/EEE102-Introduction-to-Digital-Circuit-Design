library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;


entity alu is
    Port( 
    switch_input: in std_logic_vector(8 downto 0);
    result: out std_logic_vector (4 downto 0);
    error_led: out std_logic
        );
end alu;

architecture Behavioral of alu is

signal temp: std_logic_vector (3 downto 0);
signal result3bit: std_logic_vector (2 downto 0);

begin
process(switch_input)
begin
    if switch_input(8 downto 6) = "000" then
        result3bit <= switch_input(5 downto 3) + switch_input(2 downto 0);   -- add
        temp <= ('0' & switch_input(5 downto 3)) + switch_input(2 downto 0);
        error_led <= temp(3);
        result <= "11" & result3bit;
    elsif switch_input(8 downto 6) = "001" then
        result3bit <= switch_input(5 downto 3) - switch_input(2 downto 0); --subtract
        result <= "11" & result3bit;
        if switch_input(5 downto 3) < switch_input(2 downto 0) then
            error_led <= '1';
        end if;
    elsif switch_input(8 downto 6) = "010" then
        temp <= ('0' & switch_input(5 downto 3)) + switch_input(2 downto 0); --add with carry
        result <= '0' & temp;
    elsif switch_input(8 downto 6) = "011" then
        if switch_input(5 downto 3) > switch_input(2 downto 0) then --comparison
            result3bit <= "100";
            result <= "11" & result3bit;
        elsif switch_input(5 downto 3) < switch_input(2 downto 0) then
            result3bit <= "001";
            result <= "11" & result3bit;
        else
            result3bit <= "010";
            result <= "11" & result3bit;
        end if;
    elsif switch_input(8 downto 6) = "100" then
        result3bit <= switch_input(5 downto 3) AND switch_input(2 downto 0); --AND
        result <= "11" & result3bit;
    elsif switch_input(8 downto 6) = "101" then
        result3bit <= switch_input(1 downto 0) & '0'; --shift left
        result <= "11" & result3bit;
    elsif switch_input(8 downto 6) = "110" then
        result3bit <= '0' & switch_input(2 downto 1) ; --shift right
        result <= "11" & result3bit;
    else
        result3bit <= switch_input(0) & switch_input(2 downto 1); --rotate right
        result <= "11" & result3bit;
    end if;
end process;
end Behavioral;
