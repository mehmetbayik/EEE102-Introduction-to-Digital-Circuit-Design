
-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 30.5.2021 22:51:52 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_gcd is
end tb_gcd;

architecture tb of tb_gcd is

    component gcd
        port (clock_100MHz : in std_logic;
              reset        : in std_logic;
              switches     : in std_logic_vector (15 downto 0);
              gcd1         : out std_logic_vector (7 downto 0);
              button       : in std_logic);
    end component;

    signal clock_100MHz : std_logic;
    signal reset        : std_logic;
    signal switches     : std_logic_vector (15 downto 0);
    signal gcd1         : std_logic_vector (7 downto 0);
    signal button       : std_logic;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : gcd
    port map (clock_100MHz => clock_100MHz,
              reset        => reset,
              switches     => switches,
              gcd1         => gcd1,
              button       => button);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clock_100MHz is really your main clock signal
    clock_100MHz <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        switches <= (others => '0');
        button <= '0';

        -- Reset generation
        -- EDIT: Check that reset is really your reset signal
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;
        switches <= "1000110000001100";

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_gcd of tb_gcd is
    for tb
    end for;
end cfg_tb_gcd;