----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2021 16:47:36
-- Design Name: 
-- Module Name: seven_segment - Behavioral
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

entity seven_segment is
  Port ( 
    clock_100MHz: in std_logic;
    reset: in std_logic;
    switchs: in std_logic_vector (15 downto 0);
    LEDout: out std_logic_vector (6 downto 0);
    anode_activate: out std_logic_vector (3 downto 0);
    LEDs: out std_logic_vector (15 downto 0)
    );
end seven_segment;


architecture Behavioral of seven_segment is

component clock is
Port ( 
    clock_100MHz: in std_logic;
    reset: in std_logic;
    LEDcounter: out std_logic_vector (1 downto 0)
    );
end component;

component decoder is -- decoder kullanarak 0001 ile 0000001'i eþleþtiriyoruz
Port (
    LEDin: in std_logic_vector (3 downto 0);
    LEDout: out std_logic_vector (6 downto 0)
    );
end component;

component mux is -- 4-1 multiplexer ile switchleri ledlere göre 4'lü grupluyoruz
Port (
    LEDcounter: in std_logic_vector (1 downto 0);
    switchs: in std_logic_vector (15 downto 0);
    LEDin: out std_logic_vector (3 downto 0);
    anode_activate: out std_logic_vector (3 downto 0) 
    );
end component;

signal LEDcounter: std_logic_vector (1 downto 0);
signal LEDin: std_logic_vector (3 downto 0);



begin
LEDs <= switchs;
clockk: clock port map ( clock_100MHz => clock_100MHz, reset => reset, LEDcounter => LEDcounter);
decoderr: decoder port map ( LEDin => LEDin, LEDout => LEDout);
muxx: mux port map ( LEDcounter => LEDcounter, switchs => switchs, LEDin => LEDin, anode_activate => anode_activate);
end Behavioral;


