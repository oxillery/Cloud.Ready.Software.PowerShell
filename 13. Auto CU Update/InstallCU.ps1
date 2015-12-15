
#Install the CU
Get-NAVVersion

Get-NAVCumulativeUpdateDownloadVersionInfo -SourcePath $CUDownloadFile

$IsoFile = New-NAVCumulativeUpdateISOFile -CumulativeUpdateFullPath $CUDownloadFile -TmpLocation $TmpLocation -IsoDirectory $IsoDirectory        

Repair-NAVFromISO -ISOFilePath $IsoFile -Log 'P:\_Workingfolder\TEMP\Log.txt'

Get-NAVVersion

#Uninstall-NAVFromISO -ISOFilePath $IsoFile -Log 'P:\_Workingfolder\TEMP\Log.txt'
#Drop-SQLDatabaseIfExists -Databasename 'NAV2016'