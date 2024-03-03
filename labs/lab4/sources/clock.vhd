----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.03.2021 18:54:57
-- Design Name: 
-- Module Name: clock - Behavioral
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
use IEEE.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock is
    Port ( 
    clock_100MHz: in std_logic;
    reset: in std_logic;
    LEDcounter: out std_logic_vector (1 downto 0)
    );
end clock;

architecture Behavioral of clock is
    signal counter: integer:= 0;
    signal s    : std_logic_vector (1 downto 0);
begin
    process(clock_100MHz)
    begin
        if reset='1' then
        counter <= 0;
        elsif rising_edge(clock_100MHz) then
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
