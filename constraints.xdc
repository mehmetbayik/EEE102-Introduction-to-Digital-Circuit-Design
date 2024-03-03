# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
    set_property IOSTANDARD LVCMOS33 [get_ports clk]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets echo_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets echo2_IBUF]

#Pmod Header JXAC
#ir sensor sol (sol alt pin)
set_property PACKAGE_PIN N1 [get_ports line_detect[1]]
    set_property IOSTANDARD LVCMOS33 [get_ports line_detect[1]]
#sol üst iki
set_property PACKAGE_PIN L3 [get_ports echo]
    set_property IOSTANDARD LVCMOS33 [get_ports echo]
set_property PACKAGE_PIN J3 [get_ports trig]
    set_property IOSTANDARD LVCMOS33 [get_ports trig]
set_property PACKAGE_PIN M3 [get_ports echo2]
    set_property IOSTANDARD LVCMOS33 [get_ports echo2]
set_property PACKAGE_PIN K3 [get_ports trig2]
    set_property IOSTANDARD LVCMOS33 [get_ports trig2]
	

#Pmod Header JB
#üst dörtlü 8 to sol ,11 to sag
set_property PACKAGE_PIN A14 [get_ports DIRECTIONin[0]]
    set_property IOSTANDARD LVCMOS33 [get_ports DIRECTIONin[0]]
set_property PACKAGE_PIN A16 [get_ports DIRECTIONin[1]]
    set_property IOSTANDARD LVCMOS33 [get_ports DIRECTIONin[1]]
set_property PACKAGE_PIN B15 [get_ports DIRECTIONin[2]]
    set_property IOSTANDARD LVCMOS33 [get_ports DIRECTIONin[2]]
set_property PACKAGE_PIN B16 [get_ports DIRECTIONin[3]]
    set_property IOSTANDARD LVCMOS33 [get_ports DIRECTIONin[3]]

#Pmod Header JA
#ir sensor sag (sol alt pin)
set_property PACKAGE_PIN G3 [get_ports line_detect[0]]
    set_property IOSTANDARD LVCMOS33 [get_ports line_detect[0]]

#sag dörtlü
set_property PACKAGE_PIN L2 [get_ports motor_enable[7]] 
    set_property IOSTANDARD LVCMOS33 [get_ports motor_enable[7]]  
set_property PACKAGE_PIN J1 [get_ports motor_enable[6]]
    set_property IOSTANDARD LVCMOS33 [get_ports motor_enable[6]]
set_property PACKAGE_PIN K2 [get_ports motor_enable[5]]
    set_property IOSTANDARD LVCMOS33 [get_ports motor_enable[5]]
set_property PACKAGE_PIN H1 [get_ports motor_enable[4]]
    set_property IOSTANDARD LVCMOS33 [get_ports motor_enable[4]]
	
#Pmod Header JC
#sol dörtlü
set_property PACKAGE_PIN P18 [get_ports motor_enable[3]] 
    set_property IOSTANDARD LVCMOS33 [get_ports motor_enable[3]]  
set_property PACKAGE_PIN N17 [get_ports motor_enable[2]]
    set_property IOSTANDARD LVCMOS33 [get_ports motor_enable[2]]
set_property PACKAGE_PIN P17 [get_ports motor_enable[1]]
    set_property IOSTANDARD LVCMOS33 [get_ports motor_enable[1]]
set_property PACKAGE_PIN R18 [get_ports motor_enable[0]]
    set_property IOSTANDARD LVCMOS33 [get_ports motor_enable[0]]

#Switches
#lane keep assist
set_property PACKAGE_PIN V17 [get_ports switches[0]] 
    set_property IOSTANDARD LVCMOS33 [get_ports switches[0]]
#collision avoidance
set_property PACKAGE_PIN V16 [get_ports switches[1]]
    set_property IOSTANDARD LVCMOS33 [get_ports switches[1]]
#forward turn
set_property PACKAGE_PIN W16 [get_ports switches[2]]
    set_property IOSTANDARD LVCMOS33 [get_ports switches[2]]
#empty for leds
set_property PACKAGE_PIN W17 [get_ports switches[3]]
    set_property IOSTANDARD LVCMOS33 [get_ports switches[3]]