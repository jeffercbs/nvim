$env:XDG_CONFIG_HOME = $env:XDG_CONFIG_HOME ?? $env:LOCALAPPDATA

$Branch = $Branch ?? "main"
$Remote = $Remote ?? "jeffercbs/nvim"
$NVIM_HOME = $env:XDG_CONFIG_HOME + "\nvim"

function CheckSytem {
  Invoke-Expression "git --version" > $null

  if ($LASTEXITCODE -ne 0) {
    Write-Output "$($PSStyle.Foreground.Red)Git is not installed"
    exit 1
  }
}

function Install {
  CheckSytem

  try {
    $cmd = git clone "https://github.com/$Remote" --branch "$Branch" --depth 1 "$NVIM_HOME"
    Invoke-Command -ErrorAction Stop -ScriptBlock { $cmd && nvim }
    Remove-Item -Path "$NVIM_HOME\scripts" -Recurse -Force

    Write-Output "$($PSStyle.Foreground.Green)Neovim was correctly configured correctly"
  }
  catch {
    Write-Output "$($PSStyle.Foreground.Red)Error: $($_.Exception.Message)"
    exit 1
  }
}

Install $args