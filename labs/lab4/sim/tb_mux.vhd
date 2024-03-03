----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.03.2021 14:19:49
-- Design Name: 
-- Module Name: tb_mux - Behavioral
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

entity tb_mux is end;
    


architecture Behavioral of tb_mux is
component mux

    Port (
        LEDcounter: in std_logic_vector (1 downto 0);
        switchs: in std_logic_vector (15 downto 0);
        LEDin: out std_logic_vector (3 downto 0);
        anode_activate: out std_logic_vector (3 downto 0) 
        );
end component;

signal LEDcounter: std_logic_vector (1 downto 0);
signal switchs: std_logic_vector (15 downto 0);
signal LEDin: std_logic_vector (3 downto 0);
signal anode_activate: std_logic_vector (3 downto 0);

begin

    portmap: mux port map
        (
        LEDcounter => LEDcounter,
        switchs => switchs,
        LEDin => LEDin,
        anode_activate => anode_activate
        );
                
    process
        begin
        LEDcounter <= "00";
        wait for 50ns;
        LEDcounter <= "01";
        wait for 50ns;
        LEDcounter <= "10";
        wait for 50ns;
        LEDcounter <= "11";
        wait for 50ns;
        wait;
    end process;
    
end Behavioral;