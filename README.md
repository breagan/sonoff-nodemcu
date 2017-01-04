    <p align="center">
    
    <img border="0" src="pics/sonoff2.png" width="304" height="148"><br>
    <b><font size="12">+</font></b><br>
    <img border="0" src="pics/nodemcu2.png" width="148" height="145"></font><p align="justify">From the ITEAD website: <br>
    “Sonoff is a cost effective smart home solution designed and produced by 
    ITEAD. Sonoff is a ESP8266 based WiFi wireless switch that can connect to 
    appliance of different types and brands. Sonoff transmits data to cloud 
    platform through the WiFi”<br>
    <br>
    The switch is controlled by the <b>eWeLink App</b> and managed in the cloud.<br>
    <br>
    Control of this switch is through the eWeLink App in much the same fashion as a WeMo switch. <br>
    <br>
    That is, these switches are tied to the manufacturers proprietary software. 
    This is a good system, however if one wishes to modify the functionality of 
    these switches one must work within the allowable guidelines of the 
    manufacturer. This is a roadblock for many home automation projects.<br>
    <br>
    Replacing the firmware with a new open-source firmware disables the ITEAD/eWeLink 
    features and makes the switch unusable within their framework.</font></p>
    <p align="center"><b>This switch will not work with 
    ITEAD/eWeLink.</b></font></p>
    <p align="justify">However, open source firmware provides 
    much flexibility and many avenues of programming become available. <br>
    <br>
    NodeMCU is open source. NodeMCU is programmed with the LUA programming language 
    and has modules to support just about any project imaginable. <br>
    <br>
    This modification provides a base functionality, the switch can be 
    controlled from any web browser on the “local LAN”.&nbsp; The button also provides 
    a toggle so that manual operation of the switch is available.&nbsp; The LED 
    provides setup and operational status indication.</font><p>NodeMCU, from the master branch has been flashed to this switch. <br>
    Modules included are:<br>
    enduser_setup, file, gpio, http, mqtt, net, node, tmr, uart and wifi.</font></p>
    <p>
    Flashing the ESP8266 was accomplished by attaching a header to the 
    existing circuit board as illustrated here and using a 3.3v FTDI.</font><p align="center">
    <img border="1" src="pics/pinout.png" width="400" height="504" align="left"></font></p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
    <p align="center">
    <img border="0" src="pics/caution.png" width="100" height="83"></font></p>
    <p align="left"><b><br>
    </font><font color="red">Caution!!&nbsp; It is possible to flash and 
    program the ESP8266 using the power from a 115vac or 240vac source, However 
    not recommended.&nbsp; </font></b></p>
    <p align="left"><font color="#FF0000"><b>Accessing these pins also allow 
    access to the high voltage portions of this circuit board.&nbsp; This is a 
    shock hazard!</b></font></p>
    <p align="left"><font color="#FF0000"><b>If you are attempting to do this 
    mod, use a 3.3v power supply and do not plug in the Sonoff to AC until fully 
    assembled.</b></font></p>
    <p align="center">
    <img border="0" src="pics/caution.png" width="100" height="83"></font><p align="left">The ESP8266 is flashed using flash_download_tool_v1.2 and 
    programming files were uploaded via ESPlorer v0.2.0-rc2 <br>
    <br>
    Three scripts are uploaded to the file system of the ESP8266.<br>
    &quot;<b>init.lua</b>&quot; runs at boot automatically.<br>
    &quot;<b>servernode.lc</b>&quot; is called from init.lua if a good IP is acquired.<br>
    &quot;<b>state.lua</b>&quot; retains the state of the switch, on/off.&nbsp; When the 
    switch is power cycled the switch will set its self on or off based on the 
    last 'state'.</font></p>
    <p align="left">When setup and rebooted the switch returns a webpage 
    addressed by its assigned IP number:</font></p>
    <p align="left">
<img border="1" src="pics/webpage1.png" width="485" height="334"></font></p>
    <p align="left"><b><font size="6" color="#000059">Setup:</font></b></p>
    <p align="left">Simply plug the switch into an outlet. The LED will illuminate. 
    </font></p>
    <p align="left">If the LED 
    stays on for more than 5 seconds, the switch needs to be configured to 
    connect to your router<br>
    <br>
    If the LED remains illuminated for more than 5 seconds, the switch is 
    automatically put into WiFi Access Point mode.<br>
    <br>
    Use a wireless device, such as a laptop or smart phone to connect to the 
    switches access point. It will be listed as an available network. ie “SetupGadget_XXXXXX”.
    <br>
    <br>
    The “XXXXXX” will be replaced by the last 4 octets of the MAC address 
    printed on the bottom of the switch. In this example the network is named 
    “SetupGadget_E7C925”.</font><p align="center">
    <img border="1" src="pics/setup00.png" width="250" height="443" align="left" hspace="0"></font></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>After successful connection to the network, open a browser 
    and browse to any website. (not https).</font></p>
    <p align="left">Or go directly to 192.168.4.1 and the setup screen will be displayed:</font></p>

    <p align="left">&nbsp;:<img border="1" src="pics/setup02.png" width="250" height="443"></font></p>

    <p>Select 
    your SSID and enter the Password:</font></p>
    <p align="center">&nbsp;.<img border="1" src="pics/setup04.png" width="250" height="443" align="left"></font></p>
    <p align="left">&nbsp;</p>
    <p align="left">&nbsp;</p>
    <p align="left">&nbsp;</p>
    <p align="left">&nbsp;</p>
    <p align="left">&nbsp;</p>
    <p align="left">&nbsp;</p>
    <p align="left">&nbsp;</p>
    <p align="left">&nbsp;</p>
    <p align="left">&nbsp;</p>
    <p align="left">&nbsp;</p>
    <p align="left">&nbsp;</p>
    <p align="left">&nbsp;</p>
    <p align="left">Power cycle the switch.</font></p>
    <p align="left">Determine the switch's IP number.<br>
    <br>
    The switch may be assigned an IP via DHCP by your router. You will need to 
    access your router to determine which IP has been assigned.<br>
    <br>
    Alternatively, using the MAC address, a static IP can be setup in the router 
    ahead of this setup procedure. The Sonoff will be assigned the IP setup 
    manually.<br>
    <br>
    You should now be able to access the switch at that IP number and toggle the 
    switch. </font> </p>

    <p align="left">
<img border="1" src="pics/webpage1.png" width="485" height="334"></font></p>

    <p>&nbsp;</p>
    <p>With NodeMCU installed it is now 
    possible to integrate this switch with existing systems.</font></p>
    <p>
    The MQTT module allows connection to brokers in the 
    cloud or a broker on your LAN providing ultra fast two way communication.</font></p>
    <p>Integration with Amazon Echo, Dot and Tap is 
    possible with fauxmo.py.</font></p>
    <p>The list goes on.....</font></p>
 
