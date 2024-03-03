library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;




entity main_lab5 is
    Port( 
        switch_input: in std_logic_vector(8 downto 0);
        clock_100MHz: in std_logic;
        LEDout: out std_logic_vector (6 downto 0);
        anode_activate: out std_logic_vector (3 downto 0);
        LEDs: out std_logic_vector (9 downto 0)

        );
end main_lab5;

architecture Behavioral of main_lab5 is

component clock is
Port ( 
    clock_100MHz: in std_logic;
    LEDcounter: out std_logic_vector (1 downto 0)
    );
end component;

component mux is -- 4-1 multiplexer ile switchleri ledlere göre 4'lü grupluyoruz
Port (
    LEDcounter: in std_logic_vector (1 downto 0);
    switch_input: in std_logic_vector (8 downto 0);
    LEDin: out std_logic_vector (1 downto 0);
    anode_activate: out std_logic_vector (3 downto 0);
    result: in std_logic_vector (4 downto 0)
    );
end component;

component decoder is -- decoder kullanarak 0001 ile 0000001'i eþleþtiriyoruz
Port (
    LEDin: in std_logic_vector(1 downto 0);
    LEDout: out std_logic_vector (6 downto 0)
    );
end component;

component alu is -- decoder kullanarak 0001 ile 0000001'i eþleþtiriyoruz
Port (
    switch_input: in std_logic_vector(8 downto 0);
    result: out std_logic_vector (4 downto 0);
    error_led: out std_logic
    );
end component;

signal LEDcounter: std_logic_vector (1 downto 0);
signal LEDin: std_logic_vector (1 downto 0);
signal result: std_logic_vector (4 downto 0);
signal error_led: std_logic;

begin
LEDs(9 downto 7) <= switch_input(8 downto 6);
LEDs(5 downto 3) <= switch_input(5 downto 3);
LEDs(2 downto 0) <= switch_input(2 downto 0);
LEDS(6) <= error_led;

clockk: clock port map ( clock_100MHz => clock_100MHz, LEDcounter => LEDcounter);
decoderr: decoder port map ( LEDin => LEDin, LEDout => LEDout);
muxx: mux port map ( LEDcounter => LEDcounter, switch_input => switch_input, LEDin => LEDin, anode_activate => anode_activate, result => result);
aluu: alu port map ( switch_input => switch_input, result => result, error_led => error_led);
end Behavioral;

