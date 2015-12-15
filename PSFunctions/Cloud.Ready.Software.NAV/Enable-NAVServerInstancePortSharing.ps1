function Enable-NAVServerInstancePortSharing
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true, ValueFromPipelineByPropertyname=$true)]
        [System.String]
        $ServerInstance
    )
    process {
        write-Host -ForegroundColor Green "Enabling PortSharing for $ServerInstance"
        Set-NAVServerInstance -ServerInstance $ServerInstance -Stop -ErrorAction SilentlyContinue

        $null = sc.exe config (get-service NetTcpPortSharing).Name Start= Auto
        $null = Start-service NetTcpPortSharing
    
        #Enable port sharing for all services with the same like name (usefull when creating sandboxes on new instances)
        ForEach($name in (get-service  "*$ServerInstance*").Name)
        { 
            $null = sc.exe config $name depend= HTTP/NetTcpPortSharing 
        }        
    
        Set-NAVServerInstance -ServerInstance $ServerInstance -Start 
    }
}

