library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab2 is
  Port (A,B,C,D : in bit;
        F : out bit );
end lab2;

architecture Behavioral of lab2 is

begin
F <= (A OR (B AND C) )AND D;

end Behavioral;
