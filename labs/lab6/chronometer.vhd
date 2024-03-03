library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity chronometer is
    Port ( 
        clock_100MHz: in std_logic;
        pushbuttons: in std_logic_vector(4 downto 0);
        LEDout: out std_logic_vector (6 downto 0);
        anode_activate: out std_logic_vector (3 downto 0)
        );
end chronometer;

architecture Behavioral of chronometer is

component counter is
Port ( 
    clock_100MHz: in std_logic;
    pushbuttons: in std_logic_vector(4 downto 0);
    counter_ch: out std_logic_vector (15 downto 0)
    );
end component;

component clock is
Port ( 
    clock_100MHz: in std_logic;
    LEDcounter: out std_logic_vector (1 downto 0)
    );
end component;

component mux is
Port (
    LEDcounter: in std_logic_vector (1 downto 0);
    counter_ch: in std_logic_vector (15 downto 0);
    LEDin: out std_logic_vector (3 downto 0);
    anode_activate: out std_logic_vector (3 downto 0)
    );
end component;

component decoder is
Port (
    LEDin: in std_logic_vector(3 downto 0);
    LEDout: out std_logic_vector (6 downto 0)
    );
end component;

signal LEDcounter: std_logic_vector (1 downto 0);
signal LEDin: std_logic_vector (3 downto 0);
signal counter_ch: std_logic_vector(15 downto 0);

begin

clockk: clock port map ( clock_100MHz => clock_100MHz, LEDcounter => LEDcounter);
decoderr: decoder port map ( LEDin => LEDin, LEDout => LEDout);
muxx: mux port map ( LEDcounter => LEDcounter, counter_ch => counter_ch, LEDin => LEDin, anode_activate => anode_activate);
counterr: counter port map ( clock_100MHz => clock_100MHz, pushbuttons => pushbuttons, counter_ch => counter_ch);
end Behavioral;
