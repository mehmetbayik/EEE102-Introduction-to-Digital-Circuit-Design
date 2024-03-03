library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;



entity counter is
    Port ( 
    clock_100MHz: in std_logic;
    pushbuttons: in std_logic_vector(4 downto 0);
    counter_ch: out std_logic_vector (15 downto 0)
    );
end counter;

architecture Behavioral of counter is
    signal counter2: integer:= 0;
    signal count  : std_logic;
    signal second :std_logic_vector(3 downto 0);
    signal tenseconds  : std_logic_vector (3 downto 0);
    signal minute  : std_logic_vector (3 downto 0);
    signal tenminutes  : std_logic_vector (3 downto 0);
    signal pushbutton3 : std_logic;
    signal pushbutton0 : std_logic;
begin

clk_div : process (clock_100MHz) -- 100MHz to 1Hz, 50% duty cycle, clock divider 
variable count_clk : integer range 0 to 49999999 := 0;  -- (100.000.000/1)/2 - 1 
begin 
    if (rising_edge(clock_100MHz)) then 
	   if (count_clk = 49999999) then 
	       count <= not count; -- to obtain a 50% duty cycle 
	       count_clk := 0; 
	   else
	       count_clk := count_clk + 1;
		end if; 
	end if; 
end process clk_div;
    
    process(count) -- pushbutton 3 fsm to use as switch
    variable c: integer :=0;
    variable state: integer :=0;
    variable oddeven: std_logic;
    begin
    if rising_edge(count) then
        if pushbuttons(3) = '0' then
            if c > 0 then
                state:= 0;
            end if;
        else
            state := 1;
            c := c+1;
        end if;
        if state = 0 then
            oddeven := oddeven;
        else
            oddeven := NOT oddeven;
        end if;
        if oddeven = '0' then
            pushbutton3 <= '0';
        else
            pushbutton3 <= '1';
        end if; 
        
    end if;
    end process;
    
    process(count) -- pushbutton 0 fsm to use as switch
    variable c: integer :=0;
    variable state: integer :=0;
    variable oddeven: std_logic :='0';
    begin
    if rising_edge(count) then
        if pushbuttons(0) = '0' then
            if c > 0 then
                state:= 0;
            end if;
        else
            state := 1;
            c := c+1;
        end if;
        if state = 0 then
            oddeven := oddeven;
        else
            oddeven := NOT oddeven;
        end if;
        if oddeven = '0' then
            pushbutton0 <= '0';
        else
            pushbutton0 <= '1';
        end if; 
        
    end if;
    end process;
    
    process(count) --chronometer process
    begin
    if rising_edge(count) then 
        if pushbuttons(4) = '1' then -- reset chronometer
        second <= "0000";
        tenseconds <= "0000";
        minute <= "0000";
        tenminutes <= "0000";
        
        elsif pushbuttons(1) = '1' then -- add 10 seconds
            tenseconds <= tenseconds +1;
            if tenseconds = "0101" then
                tenseconds <= "0000";
                minute <= minute +1;
                    if minute = "1001" then
                        minute <= "0000";
                        tenminutes <= tenminutes +1;
                        if tenminutes = "0101" then
                            tenminutes <= "0000";
                        end if;
                    end if;
            end if;
            
        elsif pushbuttons(2) = '1' then --subtract 10 seconds
            if tenseconds /= "0000" then
            tenseconds <= tenseconds - 1;
            else
                tenseconds <= "0101";
                if minute /= "0000" then
                minute <= minute -1;
                else
                    minute <= "1001";
                    if tenminutes /= "0000" then
                        tenminutes <= tenminutes -1;
                    else
                        tenminutes <= "0101";

                    end if;
                end if;
            end if;            

        else
            if pushbutton3 = '1' then -- pause and resume chronometer
                second <= second;
            else
            
            if pushbutton0 = '0' then -- forward counting mode
            
            second <= second +1;
                if second = "1001" then
                second <= "0000";
                tenseconds <= tenseconds +1;
                    if tenseconds = "0101" then
                        tenseconds <= "0000";
                        minute <= minute +1;
                            if minute = "1001" then
                                minute <= "0000";
                                tenminutes <= tenminutes +1;
                                if tenminutes = "0101" then
                                    tenminutes <= "0000";
                                end if;
                            end if;
                    end if;
                end if;
                
            else                         -- backward counting mode
                if second /= "0000" then
                    second <= second -1;
                else
                    second <= "1001";
                    if tenseconds /= "0000" then
                        tenseconds <= tenseconds - 1;
                    else
                        tenseconds <= "0101";
                        
                        if minute /= "0000" then
                        minute <= minute -1;
                        else
                            minute <= "1001";
                            if tenminutes /= "0000" then
                                tenminutes <= tenminutes -1;
                            else
                                tenminutes <= "0101";
                            end if;
                        end if;
                    end if;
            end if;
            end if;
            end if;
        end if;
    end if;
    end process;   
        
counter_ch(3 downto 0) <= second;
counter_ch(7 downto 4) <= tenseconds;
counter_ch(11 downto 8) <= minute;
counter_ch(15 downto 12) <= tenminutes;

    
end Behavioral;