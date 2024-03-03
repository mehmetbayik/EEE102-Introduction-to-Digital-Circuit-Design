library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

entity line_detection is
    Port( 
        clk: in std_logic;
        line_detect: in std_logic_vector(1 downto 0);
        line_detected: out std_logic_vector(1 downto 0)
        );
end line_detection;

architecture Behavioral of line_detection is

signal clock_10_Hz: std_logic;
signal state: std_logic_vector(1 downto 0);

begin

clk_div : process (clk) -- 100MHz to 10Hz, 50% duty cycle, clock divider 
variable count_clk : integer range 0 to 4999999 := 0;  -- (100.000.000/10)/2 - 1 
begin 
    if (rising_edge(clk)) then 
	   if (count_clk = 4999999) then 
	       clock_10_Hz <= not clock_10_Hz; -- to obtain a 50% duty cycle 
	       count_clk := 0; 
	   else
	       count_clk := count_clk + 1;
		end if; 
	end if; 
end process clk_div;

process(clock_10_Hz)
variable count: integer:=0;
begin
    if rising_edge(clock_10_Hz) then
        if line_detect = "01" then
            state <= "01";
        elsif line_detect = "10" then
            state <= "10";
        elsif line_detect = "11" then
            state <= "00";
        else
            state <= state;
        end if;
        
        if line_detect = "00" and state /= "00" then
            count := count +1;
            if count > 14 then
                state <= "00";
                count := 0;
            end if;
        end if;
        
    end if;
end process;

line_detected <= state;

end Behavioral;