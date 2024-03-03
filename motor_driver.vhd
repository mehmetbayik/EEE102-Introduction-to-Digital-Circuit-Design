library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity motor_driver is
    Port( 
		clk: in std_logic;
        buttons: in std_logic_vector(3 downto 0);
        motor_enable: out std_logic_vector(7 downto 0);
		line_detected: in std_logic_vector(1 downto 0);
		emergency_brake:in std_logic_vector(1 downto 0);
		switches: in std_logic_vector(3 downto 0)

        
        );
end motor_driver;

architecture Behavioral of motor_driver is
signal clock_100_Hz: std_logic;
begin

clk_div : process (clk) -- 100MHz to 100Hz, 50% duty cycle, clock divider 
variable count_clk : integer range 0 to 499999 := 0;  -- (100.000.000/100)/2 - 1 
begin 
    if (rising_edge(clk)) then 
	   if (count_clk = 499999) then 
	       clock_100_Hz <= not clock_100_Hz; -- to obtain a 50% duty cycle 
	       count_clk := 0; 
	   else
	       count_clk := count_clk + 1;
		end if; 
	end if; 
end process clk_div;

process(clock_100_Hz)
variable split_second: integer := 0;
  begin
  if rising_edge(clock_100_Hz) then
	if emergency_brake(1 downto 0) /= "00" and switches(1) = '0' then --stop
	   if buttons(0) = '1' then --backward
			motor_enable(7 downto 6) <= "10";
			motor_enable(5 downto 4) <= "10";
			motor_enable(3 downto 2) <= "10";
			motor_enable(1 downto 0) <= "01";
	   else
            motor_enable(7 downto 6) <= "00";
            motor_enable(5 downto 4) <= "00";
            motor_enable(3 downto 2) <= "00";
            motor_enable(1 downto 0) <= "00";
       end if;
	else
	    if line_detected = "01" and switches(0) = '0'  then --turn left
	       motor_enable(7 downto 6) <= "01";
           motor_enable(5 downto 4) <= "01";
           motor_enable(3 downto 2) <= "00";
           motor_enable(1 downto 0) <= "10";
           
	    elsif line_detected = "10" and switches(0) = '0' then --turn right
	       motor_enable(7 downto 6) <= "01";
           motor_enable(5 downto 4) <= "01";
           motor_enable(3 downto 2) <= "01";
           motor_enable(1 downto 0) <= "00";
           
	    else
            if buttons(3) = '1' then --forward
                motor_enable(7 downto 6) <= "01";
                motor_enable(5 downto 4) <= "01";
                motor_enable(3 downto 2) <= "01";
                motor_enable(1 downto 0) <= "10";
                
            elsif buttons(2) = '1' then --left
                if switches(2) = '1' then
                motor_enable(7 downto 6) <= "01";
                motor_enable(5 downto 4) <= "01";
                motor_enable(3 downto 2) <= "00";
                motor_enable(1 downto 0) <= "10";
                else
                motor_enable(7 downto 6) <= "00";
                motor_enable(5 downto 4) <= "01";
                motor_enable(3 downto 2) <= "00";
                motor_enable(1 downto 0) <= "10";
                end if;
                
            elsif buttons(1) = '1' then --right
                if switches(2) = '1' then
                motor_enable(7 downto 6) <= "01";
                motor_enable(5 downto 4) <= "01";
                motor_enable(3 downto 2) <= "01";
                motor_enable(1 downto 0) <= "00";
                else
                motor_enable(7 downto 6) <= "01";
                motor_enable(5 downto 4) <= "00";
                motor_enable(3 downto 2) <= "01";
                motor_enable(1 downto 0) <= "00";
                end if;
                
            elsif buttons(0) = '1' then --backward
                motor_enable(7 downto 6) <= "10";
                motor_enable(5 downto 4) <= "10";
                motor_enable(3 downto 2) <= "10";
                motor_enable(1 downto 0) <= "01";
                
            else						-- stop
                motor_enable(7 downto 6) <= "00";
                motor_enable(5 downto 4) <= "00";
                motor_enable(3 downto 2) <= "00";
                motor_enable(1 downto 0) <= "00";
            
            end if;
		end if;
	end if;
  end if;
end process;

end Behavioral;
