library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity clock is
    Port ( 
    clock_100MHz: in std_logic;
    LEDcounter: out std_logic_vector (1 downto 0)
    );
end clock;

architecture Behavioral of clock is
    signal counter: integer:= 0;
    signal s    : std_logic_vector (1 downto 0);
begin
    process(clock_100MHz)
    begin
        if rising_edge(clock_100MHz) then
            if counter < 250000 then
                counter <= counter + 1;
            else
                counter <= 0;
                s <= s+1;
            end if;
        end if;
    end process;
  
LEDcounter <= std_logic_vector(s);     

end Behavioral;
