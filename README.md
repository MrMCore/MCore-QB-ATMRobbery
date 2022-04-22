# MCore-QB-ATMRobbery
An ATM Robbery with a Mini Game and Crypto 

Preview 

https://streamable.com/jkoz3r

Depdencies:

https://github.com/utkuali/Finger-Print-Hacking-Game

Images:

![hardrive](https://user-images.githubusercontent.com/91703151/164589085-2892134a-1535-43f1-aa0a-4cebbb093391.png)

Instructions. 

Add These Items to QB Core / Shared.Lua / Items 

``` 	['hardrive']              = {['name'] = 'hardrive',             ['label'] = 'Hardrive',         ['weight'] = 100,         ['type'] = 'item',         ['image'] = 'hardrive.png',         ['unique'] = false, ['useable'] = false,     ['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A Hardrive that needs to cracked'}, ```

To change the enter key for the hacking go to Client.Lua Around line 271 in FingerPrint HackingGame change to desired key 
