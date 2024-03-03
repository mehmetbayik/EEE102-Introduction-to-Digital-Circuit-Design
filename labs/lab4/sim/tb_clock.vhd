----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.03.2021 13:58:41
-- Design Name: 
-- Module Name: tb_clock - Behavioral
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

entity tb_clock is end;


architecture Behavioral of tb_clock is
component clock
Port(
    clock_100MHz: in std_logic;
    reset: in std_logic;
    LEDcounter: out std_logic_vector(1 downto 0)
    );
end component;

signal clock_100MHz: std_logic;
signal reset: std_logic;
signal LEDcounter: std_logic_vector(1 downto 0);

constant clock_period: time:=50ns;
signal clock_stop: boolean;

begin
portmap: clock port map(
        clock_100MHz => clock_100MHz,
        reset => reset,
        LEDcounter => LEDcounter
                        );
    
process
    begin
        while not clock_stop
        loop
        clock_100MHz <= '0','1'
        after clock_period/2;
        wait for clock_period;
        end loop;
        wait;
    end process;
end Behavioral;
