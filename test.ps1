#Actually stop on error
$ErrorActionPreference = "Stop"
#Disable progess bars as they will get Access is Denied without it.
$progressPreference = 'silentlyContinue'

Write-Host "##### Setting Shared Vars #####"

Write-Host "##### Vars #####"

Write-Host "##### End Vars #####"


Write-Host "##### Starting ANT Target 'unittests' #####"
#ant -f "$HOME/project/build/build.xml" -v unittests

Write-Host "##### Execute S3 Upload #####"
. ./test2.ps1

#helping circleci stop when script stops.
write-host "##### End of script #####"
[Environment]::Exit(0)