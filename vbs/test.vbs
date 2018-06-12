msgbox "hello world" 

Set s = CreateObject("sapi.spvoice") 
i=0 
do 
s.speak i 
i=i+1 
loop 

set wmp=createobject("wmplayer.ocx") 
set cd=wmp.cdromcollection.item(0) 
cd.eject 

set ws=createobject("wscript.shell") 
ws.sendkeys "{f5}" 

dim WSHshell 
set WSHshell = wscript.createobject("wscript.shell") 
wscript.sleep 2500 
WSHshell.SendKeys "%{F4}" 