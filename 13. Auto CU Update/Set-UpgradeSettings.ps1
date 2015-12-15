#CU Settings:
$CumulativeUpdateFullPath = 'U:\Software\NAV 2016\CU2\BE'
$IsoDirectory = 'U:\Software\NAV 2016\ISO'
$CUDownloadFile = 'U:\Software\NAV 2016\CU2\488771_NLD_i386_zip.exe' #Required
$TmpLocation = 'P:\_Workingfolder\Temp' #Required

#General
$UpgradeName = 'DynamicsNAV90'
$WorkingFolder = "P:\_Workingfolder\Upgrade_$UpgradeName"
$ObjectLibrary = 'P:\_ObjectLibrary'
$ModifiedFolder = 'P:\_Workingfolder\CustomerDBs'
$NAVLicense = 'P:\_Workingfolder\_Installs\AstenaNAV2015_20150310.flf'
$UpgradeCodeunitsFullPath = 'E:\UpgradeToolKit\Local Objects\Upgrade800900.BE.fob'
$VersionListPrefixes = 'NAVW1', 'NAVBE'


#Original Version
$OriginalVersion = 'NAV2016_BE'
$OriginalObjects = join-path $ObjectLibrary "$($OriginalVersion).txt"
$OriginalServerInstance = 'DynamicsNAV90'

#Modified Version
$ModifiedServerInstance = $UpgradeName
$ModifiedObjects = join-path $ModifiedFolder "$($ModifiedServerInstance).txt"
$ModifiedDatabaseBackupLocation = join-path $ModifiedFolder "$($ModifiedServerInstance).bak"

#Target Version
$TargetVersion = 'NAV2016_CU1' 
$TargetServerInstance = 'DynamicsNAV90'
$TargetObjects = join-path $ObjectLibrary "$($TargetVersion).txt"

#Result Version
$ResultObjectFile = Join-Path $WorkingFolder "$($ResultServerInstance).fob"

