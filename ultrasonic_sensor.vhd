library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ultrasonic_sensor is
    Port (
        clk: in std_logic;
        echo:in std_logic;
        trig:out std_logic:='1';
		echo2:in std_logic;
        trig2:out std_logic:='1';
        emergency_brake:out std_logic_vector(1 downto 0)
        );
end ultrasonic_sensor;

architecture Behavioral of ultrasonic_sensor is
signal count:integer; 
signal clk_o_sig,rst,rst2:std_logic:='0';
signal counter,count_echo:integer:=0;
signal counter2,count_echo2:integer:=0;

begin
process(clk) --1 MHz clock divider
    begin
        if rising_edge(clk) then 
            if (count=49) then 
            clk_o_sig <= not clk_o_sig;
            count<=0;
            else 
            count <=count+1; 
            end if; 
        end if;
end process;

process (clk_o_sig)
    begin 
    
    if rising_edge(clk_o_sig) then 
        if counter=10 then
        trig <='0';
        counter <= counter+1;
        elsif counter=60000 then 
        counter <=0;
        trig <='1'; 
        rst <='1';
        else
        rst <='0';
        counter <= counter+1;
        end if; 
    end if;
end process;

process (echo,clk_o_sig,rst)
    begin 
    if rst='1' then 
    count_echo <=0;
    elsif rising_edge(clk_o_sig) then 
        if echo = '1' then 
        count_echo <=count_echo+1;
        end if; 
    end if; 
end process; 

process(echo)
    begin
    if falling_edge (echo) then 
        if count_echo < 1000 then --290x3 +1 = 871 = 15 cm
        emergency_brake(1) <= '1';
        else
        emergency_brake(1) <= '0';
        end if;
    end if;
end process; 




process (clk_o_sig)
    begin 
    
    if rising_edge(clk_o_sig) then 
        if counter2=10 then
        trig2 <='0';
        counter2 <= counter2+1;
        elsif counter2=60000 then 
        counter2 <=0;
        trig2 <='1'; 
        rst2 <='1';
        else
        rst2 <='0';
        counter2 <= counter2+1;
        end if; 
    end if;
end process;

process (echo2,clk_o_sig,rst2)
    begin 
    if rst2='1' then 
    count_echo2 <=0;
    elsif rising_edge(clk_o_sig) then 
        if echo2 = '1' then 
        count_echo2 <=count_echo2+1;
        end if; 
    end if; 
end process; 

process(echo2)
    begin
    if falling_edge (echo2) then 
        if count_echo2 < 1000 then --290x3 +1 = 871 = 15 cm
        emergency_brake(0) <= '1';
        else
        emergency_brake(0) <= '0';
        end if;
    end if;
end process; 
end Behavioral;