<table cellpadding="3" width="500">
  <tr>
    <td>
    <p align="center">
    <font color="#000059">
    <img border="0" src="pics/sonoff2.png" width="304" height="148"><br>
    <b><font size="12">+</font></b><br>
    <img border="0" src="pics/nodemcu2.png" width="148" height="145"></font></td>
  </tr>
  <tr>
    <td>
    <p align="justify"><font color="#000059"><br>
    From the ITEAD website: <br>
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
    <p align="center"><font color="#000059"><b>This switch will not work with 
    ITEAD/eWeLink.</b></font></p>
    <p align="justify"><font color="#000059">However, open source firmware provides 
    much flexibility and many avenues of programming become available. <br>
    <br>
    NodeMCU is open source. NodeMCU is programmed with the LUA programming language 
    and has modules to support just about any project imaginable. <br>
    <br>
    This modification provides a base functionality, the switch can be 
    controlled from any web browser on the “local LAN”.&nbsp; The button also provides 
    a toggle so that manual operation of the switch is available.&nbsp; The LED 
    provides setup and operational status indication.<br>
    &nbsp;</font></td>
  </tr>
  <tr>
    <td><font color="#000059">NodeMCU, from the master branch has been flashed to this switch. <br>
    Modules included are:<br>
    enduser_setup, file, gpio, http, mqtt, net, node, tmr, uart and wifi.</font><p>
    <font color="#000059">Flashing the ESP8266 was accomplished by attaching a header to the 
    existing circuit board as illustrated here and using a 3.3v FTDI.<br>
&nbsp;</font></td>
  </tr>
  <tr>
    <td>
    <p align="center"><font color="#000059"><img border="1" src="pics/pinout.png" width="400" height="504"></font></td>
  </tr>
  <tr>
    <td>
    <p align="center"><font color="#000059">
    <img border="0" src="pics/caution.png" width="100" height="83"></font></p>
    <p align="left"><b><font color="#000059"><br>
    </font><font color="#B30000">Caution!!&nbsp; It is possible to flash and 
    program the ESP8266 using the power from a 115vac or 240vac source, However 
    not recommended.&nbsp; </font></b></p>
    <p align="left"><font color="#B30000"><b>Accessing these pins also allow 
    access to the high voltage portions of this circuit board.&nbsp; This is a 
    shock hazard!</b></font></p>
    <p align="left"><font color="#B30000"><b>If you are attempting to do this 
    mod, use a 3.3v power supply and do not plug in the Sonoff to AC until fully 
    assembled.</b></font></p>
    <p align="center"><font color="#000059">
    <img border="0" src="pics/caution.png" width="100" height="83"></font></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table cellpadding="3" width="500">
  <tr>
    <td width="100%"><font color="#000059">The ESP8266 is flashed using flash_download_tool_v1.2 and 
    programming files were uploaded via ESPlorer v0.2.0-rc2 <br>
    <br>
    Three scripts are uploaded to the file system of the ESP8266.<br>
    &quot;<b>init.lua</b>&quot; runs at boot automatically.<br>
    &quot;<b>servernode.lc</b>&quot; is called from init.lua if a good IP is acquired.<br>
    &quot;<b>state.lua</b>&quot; retains the state of the switch, on/off.&nbsp; When the 
    switch is power cycled the switch will set its self on or off based on the 
    last 'state'.</font></td>
  </tr>
  <tr>
    <td width="100%">&nbsp;<p><font color="#000059">When setup and rebooted the switch returns a webpage 
    addressed by its assigned IP number:</font></td>
  </tr>
  <tr>
    <td width="100%">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%">
<p align="center"><font color="#000059">
<img border="1" src="pics/webpage1.png" width="485" height="334"></font></td>
  </tr>
</table>
<p>&nbsp;</p>
<table cellpadding="3" width="500">
  <tr>
    <td>
    <p align="center"><b><font size="4" color="#000059">Setup:</font></b></p>
    <p align="left"><font color="#000059">Simply plug the switch into an outlet. The LED will illuminate. 
    </font></p>
    <p align="left"><font color="#000059">If the LED 
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
    “SetupGadget_E7C925”.<br>
&nbsp;</font></td>
  </tr>
  <tr>
    <td>
    <p align="center"><font color="#000059"><img border="1" src="pics/setup00.png" width="250" height="443"></font></td>
  </tr>
</table>
<p>&nbsp;</p>

<table cellpadding="3" width="500">
  <tr>
    <td width="100%"><font color="#000059">After successful connection to the network, open a browser 
    and browse to any website. (not https).</font><p><font color="#000059">Or go directly to 192.168.4.1 and the setup screen will be displayed:</font></p>

    <p>&nbsp;</td>
  </tr>
  <tr>
    <td width="100%">
    <p align="center"><font color="#000059">
    <img border="1" src="pics/setup02.png" width="250" height="443"></font></p>
    <p><font color="#000059">Select 
    your SSID and enter the Password:</font></p>
    <p align="center"><font color="#000059">&nbsp;.<img border="1" src="pics/setup04.png" width="250" height="443"></font></p>
    <p align="left"><font color="#000059">Power cycle the switch.</font></p>
    </td>
  </tr>
</table>
<table cellpadding="3" width="500">
  <tr>
    <td><font color="#000059"><br>
    Determine the switch's IP number.<br>
    <br>
    The switch may be assigned an IP via DHCP by your router. You will need to 
    access your router to determine which IP has been assigned.<br>
    <br>
    Alternatively, using the MAC address, a static IP can be setup in the router 
    ahead of this setup procedure. The Sonoff will be assigned the IP setup 
    manually.<br>
    <br>
    You should now be able to access the switch at that IP number and toggle the 
    switch. </font> </td>
  </tr>
  <tr>
    <td>
    <p align="center"><font color="#000059">
<img border="1" src="pics/webpage1.png" width="485" height="334"></font></td>
  </tr>
</table>
<p>&nbsp;</p>
<table cellpadding="3" width="500">
  <tr>
    <td width="100%"><font color="#000059">With NodeMCU installed it is now 
    possible to integrate this switch with existing systems.</font><p>
    <font color="#000059">The MQTT module allows connection to brokers in the 
    cloud or a broker on your LAN providing ultra fast two way communication.</font></p>
    <p><font color="#000059">Integration with Amazon Echo, Dot and Tap is 
    possible with fauxmo.py.</font></p>
    <p><font color="#000059">The list goes on.....</font></p>
    <p>&nbsp;</td>
  </tr>
  <tr>
    <td width="100%">&nbsp;</td>
  </tr>
</table>
