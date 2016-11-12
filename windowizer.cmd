sc config "AeLookupSvc" start= disabled
sc config "bthserv" start= disabled
sc config "UxSms" start= disabled
sc config "TrkWks" start= disabled
sc config "HomeGroupProvider" start= disabled
sc config "iphlpsvc" start= disabled
sc config "clr_optimization_v2.0.50727_32" start= disabled
sc config "clr_optimization_v2.0.50727_64" start= disabled
sc config "clr_optimization_v4.0.30319_32" start= disabled
sc config "ShellHWDetection" start= disabled
sc config "Themes" start= disabled
sc config "WMPNetworkSvc" start= disabled
sc config "WSearch" start= disabled
sc config "wuauserv" start= disabled



sc qc "AeLookupSvc"
sc qc "bthserv"
sc qc "UxSms"
sc qc "TrkWks"
sc qc "HomeGroupProvider"
sc qc "iphlpsvc"
sc qc "clr_optimization_v2.0.50727_32"
sc qc "clr_optimization_v2.0.50727_64"
sc qc "clr_optimization_v4.0.30319_32"
sc qc "ShellHWDetection"
sc qc "Themes"
sc qc "WMPNetworkSvc"
sc qc "WSearch"
sc qc "wuauserv"

