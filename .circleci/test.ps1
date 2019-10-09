#Actually stop on error
$ErrorActionPreference = "Stop"
#Disable progess bars as they will get Access is Denied without it.
$progressPreference = 'silentlyContinue'

$component=($env:CIRCLE_TAG.split('/')[1])
$stage=$($env:CIRCLE_TAG.split('/')[2])
$env:VERSION=$($env:CIRCLE_TAG.split('/')[3])

echo "|> component : ${component}"
echo "|> stage  : ${stage}"
echo "|> version   : ${env:VERSION}"

Write-Host "##### Setting Shared Vars #####"

# this may not be required.
# . "$env:BASEPATH_WIN\.circleci\helpers\get_workflow_vars.ps1"
# $env:BASEPATH_WIN = "C:\Users\circleci\project"
# $env:HELPER_SCRIPTS = "$env:BASEPATH_WIN\.circleci\helpers"
# . "$env:HELPER_SCRIPTS\debundle-context.ps1"
# $env:FLEX_HOME = "C:\Users\circleci\project\flex"
# ${env:gulp.dir}="C:\Program Files\nodejs"
# $env:TOKAOS_CFG = "$env:BASEPATH_WIN\flash\asplayer\build\tokaos.cfg"
# $env:SOURCE_PATH = "$env:BASEPATH_WIN\flash\asplayer\build\temp\src.orig"
# $env:TOKAOS_SOURCE = "$env:BASEPATH_WIN\flash\asplayer\build\temp\src.copy"
# $env:TOKAOS_HOME = "C:\Program Files (x86)\KSOL\toKaos"
# $env:WOWZAPLAYERHOSTEDSERVER="//www.wowza.com"

Write-Host "##### Vars #####"
Write-Host "SOURCE_PATH: $env:SOURCE_PATH"
Write-Host "TOKAOS_SOURCE: $env:TOKAOS_SOURCE"
Write-Host "TOKAOS_HOME: $env:TOKAOS_HOME"
Write-Host "WOWZAPLAYERHOSTEDSERVER: $env:WOWZAPLAYERHOSTEDSERVER"
write-host "BASEPATH_WIN: $env:BASEPATH_WIN"
write-host "Target: $env:TARGET"
Write-Host "##### End Vars #####"

Write-Host "##### Executing Helper Install_dependencies.ps1 #####"
# . $env:HELPER_SCRIPTS\install_dependencies.ps1

Write-Host "##### Starting ANT Target $env:TARGET #####"
# ${env:wowzaplayer.hosted.server}="$WOWZAPLAYERHOSTEDSERVER"
# ant -f "$HOME/project/build/build.xml" -v  $env:TARGET

Write-Host "##### Starting ANT Target 'unittests' #####"
#ant -f "$HOME/project/build/build.xml" -v unittests

Write-Host "##### Execute S3 Upload #####"
# . $env:HELPER_SCRIPTS\upload_s3.ps1
#helping circleci stop when script stops.
write-host "##### End of script #####"
[Environment]::Exit(0)