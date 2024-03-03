
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity remote_control is
    Port (
        DIRECTIONin : in std_logic_vector(3 downto 0);
        buttons : out std_logic_vector(3 downto 0)

        );
end remote_control;

architecture Behavioral of remote_control is

begin

buttons <= DIRECTIONin;

end Behavioral;
