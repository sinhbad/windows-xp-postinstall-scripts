::Disable netbt service
net stop netbt & sc delete netbt
net stop netbios & sc delete netbios

::Disable Workstation Service
sc stop "LanmanWorkstation"
sc config "LanmanWorkstation" start= disabled
sc delete "LanmanWorkstation"

::Disable SMB feature (windows 7 or higher)
DISM /Online /Disable-Feature /FeatureName:SMB1Protocol /Remove /NoRestart
DISM /Online /Disable-Feature /FeatureName:SmbDirect /Remove /NoRestart

::File and Printer Sharing for Microsoft Networks       
netcfg /u ms_server
