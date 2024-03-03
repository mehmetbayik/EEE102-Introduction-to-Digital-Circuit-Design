library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity main is
  Port ( 
        clock_100MHz: in std_logic;
        reset: in std_logic;
        switches: in std_logic_vector(15 downto 0);
        button: in std_logic;
        leds: out std_logic_vector(7 downto 0)
        
        );
end main;

architecture Behavioral of main is

component gcd is
    Port ( 
        clock_100MHz: in std_logic;
        reset: in std_logic;
        switches: in std_logic_vector(15 downto 0);
        gcd1: out std_logic_vector(7 downto 0);
        button: in std_logic

        );
end component;

signal gcd1: std_logic_vector(7 downto 0);

begin

leds <= gcd1;

gcdd: gcd port map ( clock_100MHz => clock_100MHz, reset => reset, switches => switches, gcd1 => gcd1, button => button);


end Behavioral;
