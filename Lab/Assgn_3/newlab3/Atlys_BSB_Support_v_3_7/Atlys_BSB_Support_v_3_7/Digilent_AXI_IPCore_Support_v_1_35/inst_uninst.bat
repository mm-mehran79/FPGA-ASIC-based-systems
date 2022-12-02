:: Filename: inst_uninst.bat                            ::
:: Version:  1.35                                       ::
:: ==================================================== ::
:: Revision history:                                    ::
:: 1.35 - Albert Fazakas   - Added 14.4..14.7 support   ::
:: 1.34 - Albert Fazakas   - Added 14.3 support         ::
:: 1.33 - Albert Fazakas   - Added 14.2 support         ::
:: 1.32 - Albert Fazakas   - Added 14.1 support         ::
:: 1.11 - Mihaita Nagy   - Added d_shared_mem_bus and   ::
::                         removed mem_bus_mux_axi core ::
:: 1.10 - Albert Fazakas - Added 13.3 and 13.4 support  ::
::                         and changed the install      ::
::                         procedure                    ::
:: 1.00 - Mihaita Nagy   - Created                      ::
:: ==================================================== ::

cls
@echo OFF

echo.
echo   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo   \\                                                \\
echo   \\     Digilent Custom IP Core Support Files      \\
echo   \\                                                \\
echo   \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
echo.



:: ======================
set EDK_VERSION_14_7=14.7
set EDK_VERSION_14_6=14.6
set EDK_VERSION_14_5=14.5
set EDK_VERSION_14_4=14.4
set EDK_VERSION_14_3=14.3
set EDK_VERSION_14_2=14.2
set EDK_VERSION_14_1=14.1
set EDK_VERSION_13_4=13.4
set EDK_VERSION_13_3=13.3
set EDK_VERSION_13_2=13.2
:: ======================


set KEY_NAME_13_2="HKCU\Software\Xilinx\ISE\13.2\Project Navigator\Project Manager\Preferences"
set KEY_NAME_13_3="HKCU\Software\Xilinx\ISE\13.3\Project Navigator\Project Manager\Preferences"
set KEY_NAME_13_4="HKCU\Software\Xilinx\ISE\13.4\Project Navigator\Project Manager\Preferences"
set KEY_NAME_14_1="HKCU\Software\Xilinx\ISE\14.1\Project Navigator\Project Manager\Preferences"
set KEY_NAME_14_2="HKCU\Software\Xilinx\ISE\14.2\Project Navigator\Project Manager\Preferences"
set KEY_NAME_14_3="HKCU\Software\Xilinx\ISE\14.3\Project Navigator\Project Manager\Preferences"
set KEY_NAME_14_4="HKCU\Software\Xilinx\ISE\14.4\Project Navigator\Project Manager\Preferences"
set KEY_NAME_14_5="HKCU\Software\Xilinx\ISE\14.5\Project Navigator\Project Manager\Preferences"
set KEY_NAME_14_6="HKCU\Software\Xilinx\ISE\14.6\Project Navigator\Project Manager\Preferences"
set KEY_NAME_14_7="HKCU\Software\Xilinx\ISE\14.7\Project Navigator\Project Manager\Preferences"

set VALUE_NAME=PlanAheadExePathUserVal


for /F "usebackq skip=2 tokens=1-3" %%A in (`REG QUERY %KEY_NAME_14_7% /v %VALUE_NAME% 2^>nul`) do (
   set ValueName_14_7=%%A
   set ValueType_14_7=%%B
   set ValueValue_14_7=%%C
)

for /F "usebackq skip=2 tokens=1-3" %%A in (`REG QUERY %KEY_NAME_14_6% /v %VALUE_NAME% 2^>nul`) do (
   set ValueName_14_6=%%A
   set ValueType_14_6=%%B
   set ValueValue_14_6=%%C
)

for /F "usebackq skip=2 tokens=1-3" %%A in (`REG QUERY %KEY_NAME_14_5% /v %VALUE_NAME% 2^>nul`) do (
   set ValueName_14_5=%%A
   set ValueType_14_5=%%B
   set ValueValue_14_5=%%C
)

for /F "usebackq skip=2 tokens=1-3" %%A in (`REG QUERY %KEY_NAME_14_4% /v %VALUE_NAME% 2^>nul`) do (
   set ValueName_14_4=%%A
   set ValueType_14_4=%%B
   set ValueValue_14_4=%%C
)

for /F "usebackq skip=2 tokens=1-3" %%A in (`REG QUERY %KEY_NAME_14_3% /v %VALUE_NAME% 2^>nul`) do (
   set ValueName_14_3=%%A
   set ValueType_14_3=%%B
   set ValueValue_14_3=%%C
)

for /F "usebackq skip=2 tokens=1-3" %%A in (`REG QUERY %KEY_NAME_14_2% /v %VALUE_NAME% 2^>nul`) do (
   set ValueName_14_2=%%A
   set ValueType_14_2=%%B
   set ValueValue_14_2=%%C
)

for /F "usebackq skip=2 tokens=1-3" %%A in (`REG QUERY %KEY_NAME_14_1% /v %VALUE_NAME% 2^>nul`) do (
   set ValueName_14_1=%%A
   set ValueType_14_1=%%B
   set ValueValue_14_1=%%C
)

for /F "usebackq skip=2 tokens=1-3" %%A in (`REG QUERY %KEY_NAME_13_4% /v %VALUE_NAME% 2^>nul`) do (
  set ValueName_13_4=%%A
  set ValueType_13_4=%%B
  set ValueValue_13_4=%%C
)

for /F "usebackq skip=2 tokens=1-3" %%A in (`REG QUERY %KEY_NAME_13_3% /v %VALUE_NAME% 2^>nul`) do (
  set ValueName_13_3=%%A
  set ValueType_13_3=%%B
  set ValueValue_13_3=%%C
)

for /F "usebackq skip=2 tokens=1-3" %%A in (`REG QUERY %KEY_NAME_13_2% /v %VALUE_NAME% 2^>nul`) do (
  set ValueName_13_2=%%A
  set ValueType_13_2=%%B
  set ValueValue_13_2=%%C
)


for /F "tokens=1-4 delims=Xilinx" %%G in ("%ValueValue_14_7%") do set EDK_InstPath_14_7=%%GXilinx\%EDK_VERSION_14_7%\ISE_DS\EDK
for /F "tokens=1-4 delims=Xilinx" %%G in ("%ValueValue_14_6%") do set EDK_InstPath_14_6=%%GXilinx\%EDK_VERSION_14_6%\ISE_DS\EDK
for /F "tokens=1-4 delims=Xilinx" %%G in ("%ValueValue_14_5%") do set EDK_InstPath_14_5=%%GXilinx\%EDK_VERSION_14_5%\ISE_DS\EDK
for /F "tokens=1-4 delims=Xilinx" %%G in ("%ValueValue_14_4%") do set EDK_InstPath_14_4=%%GXilinx\%EDK_VERSION_14_4%\ISE_DS\EDK
for /F "tokens=1-4 delims=Xilinx" %%G in ("%ValueValue_14_3%") do set EDK_InstPath_14_3=%%GXilinx\%EDK_VERSION_14_3%\ISE_DS\EDK
for /F "tokens=1-4 delims=Xilinx" %%G in ("%ValueValue_14_2%") do set EDK_InstPath_14_2=%%GXilinx\%EDK_VERSION_14_2%\ISE_DS\EDK
for /F "tokens=1-4 delims=Xilinx" %%G in ("%ValueValue_14_1%") do set EDK_InstPath_14_1=%%GXilinx\%EDK_VERSION_14_1%\ISE_DS\EDK
for /F "tokens=1-4 delims=Xilinx" %%G in ("%ValueValue_13_4%") do set EDK_InstPath_13_4=%%GXilinx\%EDK_VERSION_13_4%\ISE_DS\EDK
for /F "tokens=1-4 delims=Xilinx" %%G in ("%ValueValue_13_3%") do set EDK_InstPath_13_3=%%GXilinx\%EDK_VERSION_13_3%\ISE_DS\EDK
for /F "tokens=1-4 delims=Xilinx" %%G in ("%ValueValue_13_2%") do set EDK_InstPath_13_2=%%GXilinx\%EDK_VERSION_13_2%\ISE_DS\EDK

rem echo EDK_14_7 Install Path is %EDK_InstPath_14_7%
rem echo EDK_14_6 Install Path is %EDK_InstPath_14_6%
rem echo EDK_14_5 Install Path is %EDK_InstPath_14_5%
rem echo EDK_14_4 Install Path is %EDK_InstPath_14_4%
rem echo EDK_14_3 Install Path is %EDK_InstPath_14_3%
rem echo EDK_14_2 Install Path is %EDK_InstPath_14_2%
rem echo EDK_14_1 Install Path is %EDK_InstPath_14_1%
rem echo EDK_13_4 Install Path is %EDK_InstPath_13_4%
rem echo EDK_13_3 Install Path is %EDK_InstPath_13_3%
rem echo EDK_13_2 Install Path is %EDK_InstPath_13_2%



if NOT "%EDK_InstPath_14_7%"=="" (
	set FoundInstEDK_14_7=1
	rem echo Found EDK 14_7 Installation at %EDK_InstPath_14_7%
) else (
	set FoundInstEDK_14_7=0)
	
if NOT "%EDK_InstPath_14_6%"=="" (
	set FoundInstEDK_14_6=1
	rem echo Found EDK 14_6 Installation at %EDK_InstPath_14_6%
) else (
	set FoundInstEDK_14_6=0)

if NOT "%EDK_InstPath_14_5%"=="" (
	set FoundInstEDK_14_5=1
	rem echo Found EDK 14_5 Installation at %EDK_InstPath_14_5%
) else (
	set FoundInstEDK_14_5=0)

if NOT "%EDK_InstPath_14_4%"=="" (
	set FoundInstEDK_14_4=1
	rem echo Found EDK 14_4 Installation at %EDK_InstPath_14_4%
) else (
	set FoundInstEDK_14_4=0)

if NOT "%EDK_InstPath_14_3%"=="" (
	set FoundInstEDK_14_3=1
	rem echo Found EDK 14_3 Installation at %EDK_InstPath_14_3%
) else (
	set FoundInstEDK_14_3=0)

if NOT "%EDK_InstPath_14_2%"=="" (
	set FoundInstEDK_14_2=1
	rem echo Found EDK 14_2 Installation at %EDK_InstPath_14_2%
) else (
	set FoundInstEDK_14_2=0)

if NOT "%EDK_InstPath_14_1%"=="" (
	set FoundInstEDK_14_1=1
	rem echo Found EDK 14_1 Installation at %EDK_InstPath_14_1%
) else (
	set FoundInstEDK_14_1=0)

if NOT "%EDK_InstPath_13_4%"=="" (
	set FoundInstEDK_13_4=1
	rem echo Found EDK 13_4 Installation at %EDK_InstPath_13_4%
) else (
	set FoundInstEDK_13_4=0)

if NOT "%EDK_InstPath_13_3%"=="" (
	set FoundInstEDK_13_3=1
	rem echo Found EDK 13_3 Installation at %EDK_InstPath_13_3%
) else (
	set FoundInstEDK_13_3=0)

if NOT "%EDK_InstPath_13_2%"=="" (
	set FoundInstEDK_13_2=1
	rem echo Found EDK 13_2 Installation at %EDK_InstPath_13_2%
) else (
	set FoundInstEDK_13_2=0)

:askver
echo:
set /p EDK_VERSION=Enter EDK Version on which to install or uninstall (13.2 - 14.7) : 
if "%EDK_VERSION%"=="13.2" goto checkver_13_2
if "%EDK_VERSION%"=="13.3" goto checkver_13_3
if "%EDK_VERSION%"=="13.4" goto checkver_13_4
if "%EDK_VERSION%"=="14.1" goto checkver_14_1
if "%EDK_VERSION%"=="14.2" goto checkver_14_2
if "%EDK_VERSION%"=="14.3" goto checkver_14_3
if "%EDK_VERSION%"=="14.4" goto checkver_14_4
if "%EDK_VERSION%"=="14.5" goto checkver_14_5
if "%EDK_VERSION%"=="14.6" goto checkver_14_6
if "%EDK_VERSION%"=="14.7" goto checkver_14_7
goto askver	


:checkver_14_7

if %FoundInstEDK_14_7% EQU 0 (
	echo:
	echo EDK 14.7 installation not found!
	echo:
	echo Make sure you have installed ISE 14.7 Embedded Edition 
	echo or System Edition and launch at least once ISE Project Navigator 
	echo BEFORE launching this installation batch file
	echo:
	pause
	goto exit
	)
goto showinstallpath

:checkver_14_6

if %FoundInstEDK_14_6% EQU 0 (
	echo:
	echo EDK 14.6 installation not found!
	echo:
	echo Make sure you have installed ISE 14.6 Embedded Edition 
	echo or System Edition and launch at least once ISE Project Navigator 
	echo BEFORE launching this installation batch file
	echo:
	pause
	goto exit
	)
goto showinstallpath


:checkver_14_5

if %FoundInstEDK_14_5% EQU 0 (
	echo:
	echo EDK 14.5 installation not found!
	echo:
	echo Make sure you have installed ISE 14.5 Embedded Edition 
	echo or System Edition and launch at least once ISE Project Navigator 
	echo BEFORE launching this installation batch file
	echo:
	pause
	goto exit
	)
goto showinstallpath

:checkver_14_4

if %FoundInstEDK_14_4% EQU 0 (
	echo:
	echo EDK 14.4 installation not found!
	echo:
	echo Make sure you have installed ISE 14.4 Embedded Edition 
	echo or System Edition and launch at least once ISE Project Navigator 
	echo BEFORE launching this installation batch file
	echo:
	pause
	goto exit
	)
goto showinstallpath


:checkver_14_3

if %FoundInstEDK_14_3% EQU 0 (
	echo:
	echo EDK 14.3 installation not found!
	echo:
	echo Make sure you have installed ISE 14.3 Embedded Edition 
	echo or System Edition and launch at least once ISE Project Navigator 
	echo BEFORE launching this installation batch file
	echo:
	pause
	goto exit
	)
goto showinstallpath

:checkver_14_2

if %FoundInstEDK_14_2% EQU 0 (
	echo:
	echo EDK 14.2 installation not found!
	echo:
	echo Make sure you have installed ISE 14.2 Embedded Edition 
	echo or System Edition and launch at least once ISE Project Navigator 
	echo BEFORE launching this installation batch file
	echo:
	pause
	goto exit
	)
goto showinstallpath

:checkver_14_1

if %FoundInstEDK_14_1% EQU 0 (
	echo:
	echo EDK 14.1 installation not found!
	echo:
	echo Make sure you have installed ISE 14.1 Embedded Edition 
	echo or System Edition and launch at least once ISE Project Navigator 
	echo BEFORE launching this installation batch file
	echo:
	pause
	goto exit
	)
goto showinstallpath

:checkver_13_4

if %FoundInstEDK_13_4% EQU 0 (
	echo:
	echo EDK 13.4 installation not found!
	echo:
	echo Make sure you have installed ISE 13.4 Embedded Edition 
	echo or System Edition and launch at least once ISE Project Navigator 
	echo BEFORE launching this installation batch file
	echo:
	pause
	goto exit
	)
goto showinstallpath

:checkver_13_3

if %FoundInstEDK_13_3% EQU 0 (
	echo:
	echo EDK 13.3 installation not found!
	echo:
	echo Make sure you have installed ISE 13.3 Embedded Edition 
	echo or System Edition and launch at least once ISE Project Navigator 
	echo BEFORE launching this installation batch file
	echo:
	pause
	goto exit
	)
goto showinstallpath

:checkver_13_2

if %FoundInstEDK_13_2% EQU 0 (
	echo:
	echo EDK 13.2 installation not found!
	echo:
	echo Make sure you have installed ISE 13.2 Embedded Edition 
	echo or System Edition and launch at least once ISE Project Navigator 
	echo BEFORE launching this installation batch file
	echo:
	pause
	goto exit
	)
goto showinstallpath

:showinstallpath

if "%EDK_VERSION%"=="14.7" (
	set EDK_InstPath=%EDK_InstPath_14_7%
	set ValueValue=%ValueValue_14_7%
	)

if "%EDK_VERSION%"=="14.6" (
	set EDK_InstPath=%EDK_InstPath_14_6%
	set ValueValue=%ValueValue_14_6%
	)

if "%EDK_VERSION%"=="14.5" (
	set EDK_InstPath=%EDK_InstPath_14_5%
	set ValueValue=%ValueValue_14_5%
	)

if "%EDK_VERSION%"=="14.4" (
	set EDK_InstPath=%EDK_InstPath_14_4%
	set ValueValue=%ValueValue_14_4%
	)

if "%EDK_VERSION%"=="14.3" (
	set EDK_InstPath=%EDK_InstPath_14_3%
	set ValueValue=%ValueValue_14_3%
	)

if "%EDK_VERSION%"=="14.2" (
	set EDK_InstPath=%EDK_InstPath_14_2%
	set ValueValue=%ValueValue_14_2%
	)

if "%EDK_VERSION%"=="14.1" (
	set EDK_InstPath=%EDK_InstPath_14_1%
	set ValueValue=%ValueValue_14_1%
	)

if "%EDK_VERSION%"=="13.4" (
	set EDK_InstPath=%EDK_InstPath_13_4%
	set ValueValue=%ValueValue_13_4%
	)
	
if "%EDK_VERSION%"=="13.3" (
	set EDK_InstPath=%EDK_InstPath_13_3%
	set ValueValue=%ValueValue_13_3%
	)
	
if "%EDK_VERSION%"=="13.2" (
	set EDK_InstPath=%EDK_InstPath_13_2%
	set ValueValue=%ValueValue_13_2%
	)

echo.
echo Found EDK %EDK_VERSION% Installation at %EDK_InstPath%
	

for /F "tokens=1-4 delims=Xilinx" %%G in ("%ValueValue%") do set InstPath=%%GXilinx\%EDK_VERSION%\ISE_DS\EDK\data\wizards\ipxact

rem @echo %InstPath%

:ask
set /p InstUninst=Install or Uninstall? (I/U)...
if "%InstUninst%"=="U" goto uninstall
if "%InstUninst%"=="u" goto uninstall
if "%InstUninst%"=="I" goto install
if "%InstUninst%"=="i" goto install
goto ask

:install

:inst_psram_cntrl
@xcopy "ipxact\busdefs\psram_cntrl_v1_0\data\psram_cntrl.xml" "%InstPath%\busdefs\psram_cntrl_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\busdefs\psram_cntrl_v1_0\data\psram_cntrl_rtl.xml" "%InstPath%\busdefs\psram_cntrl_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\bridges\psram_cntrl_template_bridges_v1_0\data\psram_cntrl_template_io_bridge.cui" "%InstPath%\hurri\xilinx.com\bridges\psram_cntrl_template_bridges_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\bus_definitions\psram_cntrl_v1_0\data\psram_cntrl.bui" "%InstPath%\hurri\xilinx.com\bus_definitions\psram_cntrl_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\components\psram_cntrl_template_v1_0\data\psram_cntrl_template.cui" "%InstPath%\hurri\xilinx.com\components\psram_cntrl_template_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\pcores\psram_cntrl_v1_00_a\data\psram_cntrl.xml" "%InstPath%\pcores\psram_cntrl_v1_00_a\data\" /Q/C/R/I/Y
@xcopy "ipxact\pcores\psram_cntrl_v1_00_a\data\psram_cntrl_mapper.mpd" "%InstPath%\pcores\psram_cntrl_v1_00_a\data\" /Q/C/R/I/Y

:inst_d_qspi_axi
@xcopy "ipxact\busdefs\d_qspi_axi_v1_0\data\d_qspi_axi.xml" "%InstPath%\busdefs\d_qspi_axi_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\busdefs\d_qspi_axi_v1_0\data\d_qspi_axi_rtl.xml" "%InstPath%\busdefs\d_qspi_axi_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\bridges\d_qspi_axi_template_bridges_v1_0\data\d_qspi_axi_template_io_bridge.cui" "%InstPath%\hurri\xilinx.com\bridges\d_qspi_axi_template_bridges_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\bus_definitions\d_qspi_axi_v1_0\data\d_qspi_axi.bui" "%InstPath%\hurri\xilinx.com\bus_definitions\d_qspi_axi_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\components\d_qspi_axi_template_v1_0\data\d_qspi_axi_template.cui" "%InstPath%\hurri\xilinx.com\components\d_qspi_axi_template_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\pcores\d_qspi_axi_v1_00_a\data\d_qspi_axi.xml" "%InstPath%\pcores\d_qspi_axi_v1_00_a\data\" /Q/C/R/I/Y
@xcopy "ipxact\pcores\d_qspi_axi_v1_00_a\data\d_qspi_axi_mapper.mpd" "%InstPath%\pcores\d_qspi_axi_v1_00_a\data\" /Q/C/R/I/Y

:inst_d_usb_epp_dstm_axi
@xcopy "ipxact\busdefs\d_usb_epp_dstm_axi_v1_0\data\d_usb_epp_dstm_axi.xml" "%InstPath%\busdefs\d_usb_epp_dstm_axi_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\busdefs\d_usb_epp_dstm_axi_v1_0\data\d_usb_epp_dstm_axi_rtl.xml" "%InstPath%\busdefs\d_usb_epp_dstm_axi_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\bridges\d_usb_epp_dstm_axi_template_bridges_v1_0\data\d_usb_epp_dstm_axi_template_io_bridge.cui" "%InstPath%\hurri\xilinx.com\bridges\d_usb_epp_dstm_axi_template_bridges_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\bus_definitions\d_usb_epp_dstm_axi_v1_0\data\d_usb_epp_dstm_axi.bui" "%InstPath%\hurri\xilinx.com\bus_definitions\d_usb_epp_dstm_axi_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\components\d_usb_epp_dstm_axi_template_v1_0\data\d_usb_epp_dstm_axi_template.cui" "%InstPath%\hurri\xilinx.com\components\d_usb_epp_dstm_axi_template_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\pcores\d_usb_epp_dstm_axi_v1_00_a\data\d_usb_epp_dstm_axi.xml" "%InstPath%\pcores\d_usb_epp_dstm_axi_v1_00_a\data\" /Q/C/R/I/Y
@xcopy "ipxact\pcores\d_usb_epp_dstm_axi_v1_00_a\data\d_usb_epp_dstm_axi_mapper.mpd" "%InstPath%\pcores\d_usb_epp_dstm_axi_v1_00_a\data\" /Q/C/R/I/Y

:inst_svn_seg_axi
@xcopy "ipxact\busdefs\svn_seg_axi_v1_0\data\svn_seg_axi.xml" "%InstPath%\busdefs\svn_seg_axi_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\busdefs\svn_seg_axi_v1_0\data\svn_seg_axi_rtl.xml" "%InstPath%\busdefs\svn_seg_axi_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\bridges\svn_seg_axi_template_bridges_v1_0\data\svn_seg_axi_template_io_bridge.cui" "%InstPath%\hurri\xilinx.com\bridges\svn_seg_axi_template_bridges_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\bus_definitions\svn_seg_axi_v1_0\data\svn_seg_axi.bui" "%InstPath%\hurri\xilinx.com\bus_definitions\svn_seg_axi_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\components\svn_seg_axi_template_v1_0\data\svn_seg_axi_template.cui" "%InstPath%\hurri\xilinx.com\components\svn_seg_axi_template_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\pcores\svn_seg_axi_v1_00_a\data\svn_seg_axi.xml" "%InstPath%\pcores\svn_seg_axi_v1_00_a\data\" /Q/C/R/I/Y
@xcopy "ipxact\pcores\svn_seg_axi_v1_00_a\data\svn_seg_axi_mapper.mpd" "%InstPath%\pcores\svn_seg_axi_v1_00_a\data\" /Q/C/R/I/Y

:inst_d_ac97_axi
@xcopy "ipxact\busdefs\d_ac97_axi_v1_0\data\d_ac97_axi.xml" "%InstPath%\busdefs\d_ac97_axi_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\busdefs\d_ac97_axi_v1_0\data\d_ac97_axi_rtl.xml" "%InstPath%\busdefs\d_ac97_axi_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\bridges\d_ac97_axi_template_bridges_v1_0\data\d_ac97_axi_template_io_bridge.cui" "%InstPath%\hurri\xilinx.com\bridges\d_ac97_axi_template_bridges_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\bus_definitions\d_ac97_axi_v1_0\data\d_ac97_axi.bui" "%InstPath%\hurri\xilinx.com\bus_definitions\d_ac97_axi_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\components\d_ac97_axi_template_v1_0\data\d_ac97_axi_template.cui" "%InstPath%\hurri\xilinx.com\components\d_ac97_axi_template_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\pcores\d_ac97_axi_v1_10_a\data\d_ac97_axi.xml" "%InstPath%\pcores\d_ac97_axi_v1_10_a\data\" /Q/C/R/I/Y
@xcopy "ipxact\pcores\d_ac97_axi_v1_10_a\data\d_ac97_axi_mapper.mpd" "%InstPath%\pcores\d_ac97_axi_v1_10_a\data\" /Q/C/R/I/Y

:inst_d_shared_mem_bus
@xcopy "ipxact\busdefs\d_shared_mem_bus_v1_0\data\d_shared_mem_bus.xml" "%InstPath%\busdefs\d_shared_mem_bus_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\busdefs\d_shared_mem_bus_v1_0\data\d_shared_mem_bus_rtl.xml" "%InstPath%\busdefs\d_shared_mem_bus_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\bridges\d_shared_mem_bus_template_bridges_v1_0\data\d_shared_mem_bus_template_io_bridge.cui" "%InstPath%\hurri\xilinx.com\bridges\d_shared_mem_bus_template_bridges_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\bus_definitions\d_shared_mem_bus_v1_0\data\d_shared_mem_bus.bui" "%InstPath%\hurri\xilinx.com\bus_definitions\d_shared_mem_bus_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\hurri\xilinx.com\components\d_shared_mem_bus_template_v1_0\data\d_shared_mem_bus_template.cui" "%InstPath%\hurri\xilinx.com\components\d_shared_mem_bus_template_v1_0\data\" /Q/C/R/I/Y
@xcopy "ipxact\pcores\d_shared_mem_bus_v1_00_a\data\d_shared_mem_bus.xml" "%InstPath%\pcores\d_shared_mem_bus_v1_00_a\data\" /Q/C/R/I/Y
@xcopy "ipxact\pcores\d_shared_mem_bus_v1_00_a\data\d_shared_mem_bus_mapper.mpd" "%InstPath%\pcores\d_shared_mem_bus_v1_00_a\data\" /Q/C/R/I/Y
goto exitt

:uninstall

:uninst_psram_cntrl
@rmdir /S /Q "%InstPath%\busdefs\psram_cntrl_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\bridges\psram_cntrl_template_bridges_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\bus_definitions\psram_cntrl_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\components\psram_cntrl_template_v1_0"
@rmdir /S /Q "%InstPath%\pcores\psram_cntrl_v1_00_a"

:uninst_d_qspi_axi
@rmdir /S /Q "%InstPath%\busdefs\d_qspi_axi_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\bridges\d_qspi_axi_template_bridges_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\bus_definitions\d_qspi_axi_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\components\d_qspi_axi_template_v1_0"
@rmdir /S /Q "%InstPath%\pcores\d_qspi_axi_v1_00_a"

:uninst_d_usb_epp_dstm_axi
@rmdir /S /Q "%InstPath%\busdefs\d_usb_epp_dstm_axi_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\bridges\d_usb_epp_dstm_axi_template_bridges_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\bus_definitions\d_usb_epp_dstm_axi_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\components\d_usb_epp_dstm_axi_template_v1_0"
@rmdir /S /Q "%InstPath%\pcores\d_usb_epp_dstm_axi_v1_00_a"

:uninst_svn_seg_axi
@rmdir /S /Q "%InstPath%\busdefs\svn_seg_axi_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\bridges\svn_seg_axi_template_bridges_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\bus_definitions\svn_seg_axi_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\components\svn_seg_axi_template_v1_0"
@rmdir /S /Q "%InstPath%\pcores\svn_seg_axi_v1_00_a"

:uninst_d_ac97_axi
@rmdir /S /Q "%InstPath%\busdefs\d_ac97_axi_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\bridges\d_ac97_axi_template_bridges_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\bus_definitions\d_ac97_axi_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\components\d_ac97_axi_template_v1_0"
@rmdir /S /Q "%InstPath%\pcores\d_ac97_axi_v1_10_a"

:uninst_d_shared_mem_bus
@rmdir /S /Q "%InstPath%\busdefs\d_shared_mem_bus_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\bridges\d_shared_mem_bus_template_bridges_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\bus_definitions\d_shared_mem_bus_v1_0"
@rmdir /S /Q "%InstPath%\hurri\xilinx.com\components\d_shared_mem_bus_template_v1_0"
@rmdir /S /Q "%InstPath%\pcores\d_shared_mem_bus_v1_00_a"
goto exitt

:exitt
echo Done!
pause

:exit


