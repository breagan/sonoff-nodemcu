![alt text](http:www.airetraffic.com/sonoff/sonoff2.png )
 
 <img src="http:www.airetraffic.com/sonoff/sonoff2.png"/>
 
![alt text](https://github.com/breagan/sonoff-nodemcu/raw/master/pics/plus-sign-simple.png )

![alt text](https://github.com/breagan/sonoff-nodemcu/raw/master/pics/nodemcu2.png )

#### From the ITEAD website:

#####“Sonoff is a cost effective smart home solution designed and produced by ITEAD. Sonoff is a ESP8266 based WiFi wireless switch that can connect to appliance of different types and brands. Sonoff transmits data to cloud platform through the WiFi”

The original Sonofff switch is controlled by the eWeLink App and managed in the cloud.

Control of this switch is through the eWeLink App in much the same fashion as a WeMo switch. 

That is, these switches are tied to the manufacturers proprietary software. This is a good system, however if one wishes to modify the functionality of these switches one must work within the allowable guidelines of the manufacturer. This is a roadblock for many home automation projects.

Replacing the firmware with a new open-source firmware disables the ITEAD/eWeLink features and makes the switch unusable within their framework.

__This switch will not work with ITEAD/eWeLink app.__


However, open source firmware provides much flexibility and many avenues of programming become available. 

This modification provides a base functionality:
     
* The switch can be controlled from any web browser on the “local LAN”.
* The button provides a toggle so that manual operation of the switch is available.
* The LED provides a setup and operational status indication.
* Last state of the switch is restored after a power interruption.


##Operation:

Simply plug the switch into an outlet. The LED will illuminate for approximately 5 seconds then extinguish.  This indicates that the switch is ready for use.

If the LED stays on for more than 5 seconds, the switch needs to be configured to connect to your router

When the LED remains illuminated for more than 5 seconds, the switch is automatically put into WiFi Access Point mode.

Use a wireless device, such as a laptop or smart phone and connect to the switch's access point. 

The switch will be listed as an available network. ie __“SetupGadget_XXXXXX”__. 

![](https://github.com/breagan/sonoff-nodemcu/raw/master/pics/setup00.png )

The “XXXXXX” will be replaced by the last 3 octets of the MAC address printed on the bottom of the switch. In this example the network is named “SetupGadget_E7C925”.

After successful connection to the network, open a browser and browse to any website. (not https).

Or go directly to 192.168.4.1 and the setup screen will be displayed:

![](https://github.com/breagan/sonoff-nodemcu/raw/master/pics/setup02.png )

Select your SSID and enter the Password:

![](https://github.com/breagan/sonoff-nodemcu/raw/master/pics/setup04.png )

__Power cycle the switch.__

Determine the switch's IP number.

The switch may be assigned an IP via DHCP by your router. You will need to access your router to determine which IP has been assigned.

Alternatively, using the MAC address, a static IP can be setup in the router ahead of this setup procedure. The Sonoff will be assigned the IP setup manually.

You should now be able to access the switch at that IP number and toggle the switch.

![](https://github.com/breagan/sonoff-nodemcu/raw/master/pics/webpage1.png )


##Customization:

NodeMCU is open source. NodeMCU is programmed with the LUA programming language and has modules to support just about any project imaginable. 

NodeMCU, from the master branch has been flashed to this switch. 
Modules included are:

* enduser_setup
* file
* gpio
* http
* mqtt
* net
* node
* tmr
* uart
* wifi

Flashing the ESP8266 was accomplished by attaching a header to the existing circuit board as illustrated here and using a 3.3v FTDI.

![alt text](https://github.com/breagan/sonoff-nodemcu/raw/master/pics/pinout.png )

![alt text](https://github.com/breagan/sonoff-nodemcu/raw/master/pics/caution.png )

#### Caution!!  It is possible to flash and program the ESP8266 using the power from a 115vac or 240vac source, However not recommended.  Accessing these pins also allow access to the high voltage portions of this circuit board.  This is a shock hazard! If you are attempting to do this mod, use a 3.3v power supply and do not plug in the Sonoff to AC until fully assembled.
![alt text](https://github.com/breagan/sonoff-nodemcu/raw/master/pics/caution.png )

The ESP8266 is flashed using flash_download_tool_v1.2 and programming files were uploaded via ESPlorer v0.2.0-rc2 

Three scripts are uploaded to the file system of the ESP8266.

__"init.lua"__ runs at boot automatically.  
**"servernode.lc"** is called from init.lua if a good IP is acquired.  
**"state.lua"** retains the state of the switch, on/off.  When the switch is power cycled the switch will set its self on or off based on the last 'state'.

When setup and rebooted the switch returns a webpage addressed by its assigned IP number:

![alt text](https://github.com/breagan/sonoff-nodemcu/raw/master/pics/webpage1.png )




With NodeMCU installed it is now possible to integrate this switch with existing systems.

The MQTT module allows connection to brokers in the cloud or a broker on your LAN providing ultra fast two way communication.

Integration with Amazon Echo, Dot and Tap is possible with fauxmo.py.

The list goes on.....



