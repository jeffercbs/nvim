
$env:XDG_DATA_HOME = $env:XDG_DATA_HOME ?? $env:APPDATA
$env:XDG_CONFIG_HOME = $env:XDG_CONFIG_HOME ?? $env:LOCALAPPDATA

$NVIM_HOME = $env:XDG_CONFIG_HOME + "\nvim"
$NVIM_DATA_HOME = $env:XDG_CONfig_HOME + "\nvim-data"
$NVIM_TEMP = $env:XDG_DATA_HOME + "\nvim-data"

$NVIM_DIRS = (
  $NVIM_HOME,
  $NVIM_DATA_HOME,
  $NVIM_TEMP
)

function Uninstall {
  Stop-Process -Name nvim -Force -ErrorAction SilentlyContinue

  Write-Output "$($PSStyle.Foreground.Yellow)!!Warning!! -> Removing all nvim related config because of the --uninstall flag"
  $answer = Read-Host "Are you sure you want to continue? [y/n]"

  if ($answer -ne "y" -and $answer -ne "Y") {
    Write-Output "$($PSStyle.Foreground.Red)Aborting uninstallation"
    exit 1
  }

  foreach ($dir in $NVIM_DIRS) {
    if (Test-Path $dir) {
      Write-Output "$($PSStyle.Foreground.Green)Removing $dir"
      Remove-Item -Path $dir -Recurse -Force
    }
  }
}

Uninstall $args

