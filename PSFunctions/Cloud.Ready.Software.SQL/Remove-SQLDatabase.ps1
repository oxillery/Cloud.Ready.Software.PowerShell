function Remove-SQLDatabase
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false, Position=0)]
        [Object]
        $DatabaseServer = [net.dns]::GetHostName(),
        
        [Parameter(Mandatory=$true, Position=1)]
        [Object]
        $DatabaseName
    )
    
    try{
        $null = import-module sqlps -WarningAction SilentlyContinue
        $server = New-Object Microsoft.SqlServer.Management.Smo.Server($DatabaseServer)   
        $server.databases[$DatabaseName].Drop()
    } Catch {
        try {
            Invoke-SQL -SQLCommand "ALTER DATABASE [$DatabaseName] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE"
            Invoke-SQL -SQLCommand "DROP DATABASE [$DatabaseName]"
        } catch {
            write-error "Unable to drop database $DatabaseName"
            write-error $Error[0]
            break
        }
    }
    
    write-Host -ForegroundColor Green "$DatabaseName successfully dropped."
}

