$ZipFIle = 'C:\_Installs\488113_NLD_i386_zip.exe'
#$ZipFIle = 'C:\_Workingfolder\Download\485100_NLD_i386_zip.exe'

$TmpLocation = 'C:\Temp'
$IsoDirectory = 'C:\_Installs'

$IsoFile = 
    New-NAVCumulativeUpdateISOFile `
        -CumulativeUpdateFullPath $ZipFIle `
        -TmpLocation $TmpLocation `
        -IsoDirectory $IsoDirectory

