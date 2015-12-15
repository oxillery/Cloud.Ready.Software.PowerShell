﻿function Copy-NAVEnvironment
{
    <#
        .SYNOPSIS
        Copy a NAV Environment.
        .DESCRIPTION
        Copy a NAV Environment, based on ServerInstance
           - Database Backup
           - Database Restore
           - Enable Port Sharing
           - Set up new serverinstance
        .EXAMPLE
        Copy-NAVEnvironment -ServerInstance 'DynamicsNAV90' -ToServerInstance 'DemoTier'
    #>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyname=$true)]
        [System.String]
        $ServerInstance ,
        
        [Parameter(Mandatory=$true)]
        [System.String]
        $ToServerInstance 
     )
    $ServerInstanceObject = Get-NAVServerInstance4 -ServerInstance $ServerInstance
 
    $ServerInstanceObject | Enable-NAVServerInstancePortSharing 
 
    $BackupFile = $ServerInstanceObject | Backup-NAVDatabase
    
    New-NAVEnvironment -ServerInstance $ToServerInstance -DatabaseServer $ServerInstanceObject.DatabaseServer -DatabaseInstance $ServerInstanceObject.DatabaseInstance -Databasename $ToServerInstance -ManagementPort $ServerInstanceObject.ManagementServicesPort -ClientServicesPort $ServerInstanceObject.ClientServicesPort -BackupFile $BackupFile -EnablePortSharing
    
    $backupfile | remove-item -Force
}


