----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.03.2021 15:06:22
-- Design Name: 
-- Module Name: tb_decoder - Behavioral
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

entity tb_decoder is end;

architecture Behavioral of tb_decoder is
component decoder

    Port    (
            LEDin: in std_logic_vector (3 downto 0);
            LEDout: out std_logic_vector (6 downto 0)
            );
end component;

signal LEDin: std_logic_vector (3 downto 0);
signal LEDout: std_logic_vector (6 downto 0);

begin

portmap: decoder port map 
        (
        LEDin => LEDin,
        LEDout => LEDout
        );
      
    process
    begin
    LEDin <= "0000";
    wait for 50ns;
    LEDin <= "0001";
    wait for 50ns;
    LEDin <= "0010";
    wait for 50ns;
    LEDin <= "0011";
    wait for 50ns;
    LEDin <= "0100";
    wait for 50ns;
    LEDin <= "0101";
    wait for 50ns;
    LEDin <= "0110";
    wait for 50ns;
    LEDin <= "0111";
    wait for 50ns;
    LEDin <= "1000";
    wait for 50ns;
    LEDin <= "1001";
    wait for 50ns;
    LEDin <= "1010";
    wait for 50ns;
    LEDin <= "1011";
    wait for 50ns;
    LEDin <= "1100";
    wait for 50ns;
    LEDin <= "1101";
    wait for 50ns;
    LEDin <= "1110";
    wait for 50ns;
    LEDin <= "1111";
    wait for 50ns;
    LEDin <= "0000";
    wait;
    end process;
end Behavioral;
