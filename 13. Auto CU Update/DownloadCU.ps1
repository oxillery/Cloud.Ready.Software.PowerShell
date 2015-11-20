$DownloadURL = 'http://hotfixv4.microsoft.com/Dynamics NAV 2015/latest/BEKB3086434/42222/free/486356_NLD_i386_zip.exe'
$path ='C:\$Installs\DownloadCU.exe'

$client = new-object System.Net.WebClient 
$client.DownloadFile($DownloadURL, $path) 

write-host 'Download Ready'