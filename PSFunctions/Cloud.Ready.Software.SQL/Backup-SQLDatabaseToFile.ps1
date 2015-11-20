﻿function Backup-SQLDatabaseToFile
{

    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false)]
        [System.String]
        $DatabaseServer = '.',
        
        [Parameter(Mandatory=$false)]
        [System.String]
        $DatabaseServerInstance = 'MSSQLSERVER',
        
        [Parameter(Mandatory=$true)]
        [System.String]
        $DatabaseName,
        
        [Parameter(Mandatory=$false)]
        [System.String]
        $BackupFile = "$DatabaseName.bak"
    )
    

    $BaseReg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine', $DatabaseServer)
    $RegKey  = $BaseReg.OpenSubKey('SOFTWARE\\Microsoft\\Microsoft SQL Server\\Instance Names\\SQL')
    $SQLinstancename = $RegKey.GetValue($DatabaseServerInstance)
    $RegKey  = $BaseReg.OpenSubKey("SOFTWARE\\Microsoft\\Microsoft SQL Server\\$SQLInstancename\\MSSQLServer")
    $Backuplocation = $RegKey.GetValue('BackupDirectory')
     
    $BackupFileFullPath = Join-Path $Backuplocation $BackupFile
    $SQLString = "BACKUP DATABASE [$DatabaseName] TO  DISK = N'$BackupFileFullPath' WITH  COPY_ONLY, NOFORMAT, INIT,  NAME = N'NAVAPP_QA_MT-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10"
    
    write-Host -ForegroundColor Green "Backup up database $Database ..."
    
    invoke-sql -DatabaseServer $DatabaseServer -sqlCommand $SQLString

    Get-Item $BackupFileFullPath
}

