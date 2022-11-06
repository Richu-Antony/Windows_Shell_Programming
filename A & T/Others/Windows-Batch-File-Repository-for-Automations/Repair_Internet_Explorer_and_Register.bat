rem Script used to manually reregister Internet Explorer and Shell related *.dlls
rem Also included the Digital Signing and Cryptographic Provider *. dlls if needed
rem rundll32.exe advpack.dll /DelNodeRunDLL32 C:\WINNT\System32\dacui.dll 
rem rundll32.exe advpack.dll /DelNodeRunDLL32 C:\WINNT\Catroot\icatalog.mdb 
rem regsvr32 setupwbv.dll /s
rem regsvr32 wininet.dll /s
regsvr32 comcat.dll /s
regsvr32 CSSEQCHK.DLL /s
regsvr32 shdoc401.dll /s
regsvr32 shdoc401.dll /i /s
regsvr32 asctrls.ocx /s
regsvr32 oleaut32.dll /s
regsvr32 shdocvw.dll /I /s
regsvr32 shdocvw.dll /s
regsvr32 browseui.dll /s
regsvr32 browsewm.dll /s
regsvr32 browseui.dll /I /s 
regsvr32 msrating.dll /s
regsvr32 mlang.dll /s
regsvr32 hlink.dll /s
rem regsvr32 mshtml.dll /s
regsvr32 mshtmled.dll /s
regsvr32 urlmon.dll /s
regsvr32 plugin.ocx /s
regsvr32 sendmail.dll /s
rem regsvr32 comctl32.dll /i /s
rem regsvr32 inetcpl.cpl /i /s
rem regsvr32 mshtml.dll /i /s
regsvr32 scrobj.dll /s
regsvr32 mmefxe.ocx /s
rem regsvr32 proctexe.ocx mshta.exe /register /s 
regsvr32 corpol.dll /s
regsvr32 jscript.dll /s
regsvr32 msxml.dll /s
regsvr32 imgutil.dll /s
regsvr32 thumbvw.dll /s
regsvr32 cryptext.dll /s
regsvr32 rsabase.dll /s
rem regsvr32 triedit.dll /s
rem regsvr32 dhtmled.ocx /s
regsvr32 inseng.dll /s
regsvr32 iesetup.dll /i /s
rem regsvr32 hmmapi.dll /s
regsvr32 cryptdlg.dll /s
regsvr32 actxprxy.dll /s
regsvr32 dispex.dll /s
regsvr32 occache.dll /s
regsvr32 occache.dll /i /s
regsvr32 iepeers.dll /s
rem regsvr32 wininet.dll /i /s
regsvr32 urlmon.dll /i /s
rem regsvr32 digest.dll /i /s
regsvr32 cdfview.dll /s
regsvr32 webcheck.dll /s
regsvr32 mobsync.dll /s
regsvr32 pngfilt.dll /s
regsvr32 licmgr10.dll /s
regsvr32 icmfilter.dll /s
regsvr32 hhctrl.ocx /s
regsvr32 inetcfg.dll /s
rem regsvr32 trialoc.dll /s
regsvr32 tdc.ocx /s
regsvr32 MSR2C.DLL /s
regsvr32 msident.dll /s
regsvr32 msieftp.dll /s
regsvr32 xmsconf.ocx /s
regsvr32 ils.dll /s
regsvr32 msoeacct.dll /s
rem regsvr32 wab32.dll /s
rem regsvr32 wabimp.dll /s
rem regsvr32 wabfind.dll /s
rem regsvr32 oemiglib.dll /s
rem regsvr32 directdb.dll /s
regsvr32 inetcomm.dll /s
rem regsvr32 msoe.dll /s
rem regsvr32 oeimport.dll /s
regsvr32 msdxm.ocx /s
regsvr32 dxmasf.dll /s
rem regsvr32 laprxy.dll /s
regsvr32 l3codecx.ax /s
regsvr32 acelpdec.ax /s
regsvr32 mpg4ds32.ax /s
regsvr32 voxmsdec.ax /s
regsvr32 danim.dll /s
regsvr32 Daxctle.ocx /s
regsvr32 lmrt.dll /s
regsvr32 datime.dll /s
regsvr32 dxtrans.dll /s
regsvr32 dxtmsft.dll /s
rem regsvr32 vgx.dll /s
regsvr32 WEBPOST.DLL /s
regsvr32 WPWIZDLL.DLL /s
regsvr32 POSTWPP.DLL /s
regsvr32 CRSWPP.DLL /s
regsvr32 FTPWPP.DLL /s
regsvr32 FPWPP.DLL /s
rem regsvr32 FLUPL.OCX /s
regsvr32 wshom.ocx /s
regsvr32 wshext.dll /s
regsvr32 vbscript.dll /s
regsvr32 scrrun.dll mstinit.exe /setup /s
regsvr32 msnsspc.dll /SspcCreateSspiReg /s
regsvr32 msapsspc.dll /SspcCreateSspiReg /s
regsvr32 licdll.dll /s
regsvr32 regwizc.dll /s
regsvr32 softpub.dll /s
regsvr32 IEDKCS32.DLL /s
regsvr32 MSTIME.DLL /s
regsvr32 WINTRUST.DLL /s
regsvr32 INITPKI.DLL /s
regsvr32 DSSENH.DLL /s 
regsvr32 RSAENH.DLL /s 
regsvr32 CRYPTDLG.DLL /s
regsvr32 Gpkcsp.dll /s
regsvr32 Sccbase.dll /s
regsvr32 Slbcsp.dll /s
exit

