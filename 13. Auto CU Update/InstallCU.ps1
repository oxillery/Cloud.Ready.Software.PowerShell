
#Install the CU
Get-NAVVersion

Get-NAVCumulativeUpdateDownloadVersionInfo -SourcePath $CUDownloadFile

$IsoFile = New-NAVCumulativeUpdateISOFile -CumulativeUpdateFullPath $CUDownloadFile -TmpLocation $TmpLocation -IsoDirectory $IsoDirectory        

Get-NAVServerInstance | Set-NAVServerInstance -Stop

Repair-NAVFromISO -ISOFilePath $IsoFile -Log 'P:\_Workingfolder\TEMP\Log.txt'

Get-NAVServerInstance | Set-NAVServerInstance -Start

Get-NAVVersion

#Uninstall-NAVFromISO -ISOFilePath $IsoFile -Log 'P:\_Workingfolder\TEMP\Log.txt'
#Drop-SQLDatabaseIfExists -Databasename 'NAV2016'

Install-NAVFromISO