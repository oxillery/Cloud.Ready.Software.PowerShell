$Theexe = 'C:\_Workingfolder\DownloadCU\GetLatestCUDownloadLink\ISO Builder.exe'
$ResultFile = 'C:\_Workingfolder\DownloadCU\result.txt'
$Product = 2015
$CurrentCumulativeUpdate = 9
$Country = 'BE'

Start-Process -FilePath $Theexe -ArgumentList "-product 2015 -cu 9 -country BE -resultfile:'$ResultFile' -hideform" -PassThru | Wait-Process

Get-Content $ResultFile
