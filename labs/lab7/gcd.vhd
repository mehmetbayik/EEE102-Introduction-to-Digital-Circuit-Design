library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity gcd is
  Port ( 
        clock_100MHz: in std_logic;
        reset: in std_logic;
        switches: in std_logic_vector(15 downto 0);
        gcd1: out std_logic_vector(7 downto 0);
        button: in std_logic

        );
end gcd;

architecture Behavioral of gcd is
signal slow_clock: std_logic;
signal button_fsm: std_logic;
begin


clk_div : process (reset,clock_100MHz) -- 100MHz to 4Hz, 50% duty cycle, clock divider 
variable count_clk : integer range 0 to 12499999 := 0;  -- (100.000.000/4)/2 - 1 
begin 
    if reset = '1' then
        count_clk := 0;
        slow_clock <= '0';
    elsif (rising_edge(clock_100MHz)) then 
	   if (count_clk = 12499999) then 
	       slow_clock <= not slow_clock; -- to obtain a 50% duty cycle 
	       count_clk := 0; 
	   else
	       count_clk := count_clk + 1;
		end if; 
	end if; 
end process clk_div;

process(reset,slow_clock) -- pushbutton 3 fsm to use as switch
    variable c: integer :=0;
    variable state: integer :=0;
    begin
    if reset = '1' then
        state:= 0;
        button_fsm <= '0';
    elsif rising_edge(slow_clock) then
        if button = '0' then
            if c > 0 then
                state:= 0;
            end if;
        else
            state := 1;
            c := c+1;
        end if;
        if state = 0 then
            button_fsm <= '0';
        else
            button_fsm <= '1';
        end if;
    end if;
    end process;
    
process(reset,clock_100MHz)
variable a: std_logic_vector(7 downto 0) := "00000000";
variable b: std_logic_vector(7 downto 0) := "00000000";
variable state: std_logic:= '0';
begin
    if reset = '1' then
        a := "00000000";
        b := "00000000";
        state:= '0';
    elsif rising_edge(clock_100MHz) then
        if button_fsm = '1' then
            a := switches(15 downto 8);
            b := switches(7 downto 0);
            state:= '1';
        end if;
        

        if a < b then
            b := b - a;
            if a = b and state = '1' then 
                gcd1 <= a;
                state:= '0';
            end if; 
        elsif b < a then
            a := a - b;
            if a = b and state = '1' then 
                gcd1 <= a;
                state:= '0';
            end if;
        else
            if state = '1' then
                gcd1 <= a;
                state:= '0';
            end if;
        end if;
        
        
    end if;
end process;


end Behavioral;
