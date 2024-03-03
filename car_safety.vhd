library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;

entity car_safety is
	Port(
		clk: in std_logic;
		echo:in std_logic;
        trig:out std_logic:='1';
		echo2:in std_logic;
        trig2:out std_logic:='1';
		line_detect: in std_logic_vector(1 downto 0);
		DIRECTIONin : in std_logic_vector(3 downto 0);
		motor_enable: out std_logic_vector(7 downto 0);
		switches: in std_logic_vector(3 downto 0)
	
		);
end car_safety;

architecture Behavioral of car_safety is

component remote_control is
Port(
	DIRECTIONin : in std_logic_vector(3 downto 0);
    buttons : out std_logic_vector(3 downto 0)

	);
end component;

component motor_driver is
Port(
	clk: in std_logic;
    buttons: in std_logic_vector(3 downto 0);
    motor_enable: out std_logic_vector(7 downto 0);
	line_detected: in std_logic_vector(1 downto 0);
	emergency_brake:in std_logic_vector(1 downto 0);
	switches: in std_logic_vector(3 downto 0)

	);
end component;

component line_detection is
Port(
    clk: in std_logic;
	line_detect: in std_logic_vector(1 downto 0);
    line_detected: out std_logic_vector(1 downto 0)

	);
end component;

component ultrasonic_sensor is
Port(
	clk: in std_logic;
    echo:in std_logic;
    trig:out std_logic:='1';
	echo2:in std_logic;
    trig2:out std_logic:='1';
    emergency_brake:out std_logic_vector(1 downto 0)

	);
end component;

signal buttons : std_logic_vector(3 downto 0);
signal line_detected: std_logic_vector(1 downto 0);
signal emergency_brake: std_logic_vector(1 downto 0);

begin

remote_controll: remote_control port map ( DIRECTIONin => DIRECTIONin, buttons => buttons);
motor_driverr: motor_driver port map ( clk => clk, buttons => buttons, motor_enable => motor_enable, line_detected => line_detected, emergency_brake => emergency_brake, switches => switches);
line_detectionn: line_detection port map ( clk => clk, line_detect => line_detect, line_detected => line_detected);
ultrasonic_sensorr: ultrasonic_sensor port map ( clk => clk, echo => echo, trig => trig, echo2 => echo2, trig2 => trig2, emergency_brake => emergency_brake);


end Behavioral;