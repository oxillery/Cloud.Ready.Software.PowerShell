function Start-NAVWindowsClient
{
    [cmdletbinding()]
    param(
        [string]$ServerName=([net.dns]::gethostname()), 
        [int]$Port=7046, 
        [String]$ServerInstance, 
        [String]$Companyname, 
        [string]$tenant='default'
        )

    if ([string]::IsNullOrEmpty($Companyname)) {       $Companyname = (Get-NAVCompany -ServerInstance $ServerInstance -Tenant $tenant)[0].CompanyName
    }

    $ConnectionString = "DynamicsNAV://$Servername" + ":$Port/$ServerInstance/$MainCompany/?tenant=$tenant"
    Write-host -ForegroundColor green -object "Starting $ConnectionString ..."
    Start-Process $ConnectionString
}

