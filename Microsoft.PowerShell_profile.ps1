Set-ItemProperty -Path HKCU:\console -Name WindowAlpha -Value 205

$myDefaultColor = "Cyan"
$myBranchColor  = "Magenta"
$myBackgroundColor = "Black"

$msbuild2019 = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\amd64"
$env:Path = $msbuild2019 + ";" + $env:Path

function free_port
{
    $blockingConnection = Get-NetTCPConnection -LocalPort $args[0] 2>$null
    $hashset = New-Object System.Collections.Generic.HashSet[System.Object]
    $blockingConnection | ForEach-Object -process { $null = $hashset.Add($_)}

    if ($blockingConnection)
    {
        $hashset | ForEach-Object -Process {
            $processId = $_.OwningProcess

            if($processId -ne 0)
            {
                write-host ("Killing process: " + $processId)
                Stop-Process $processId
            }
        }

        Start-Sleep -s 3
    }

    $blockingConnection = Get-NetTCPConnection -LocalPort $args[0] 2>$null
    if ($blockingConnection)
    {
        write-host "Failed to free port"
    }
    else
    {
        write-host "Port is free"
    }
}

function getGitInformation
{
    $gitbranchname = (git rev-parse --abbrev-ref HEAD 2>$null)

    if ($gitbranchname)
    {
        $gitbranchname = (" (" + $gitbranchname + ")")
    }

    $gitbranchname
}

function prompt
{
    $timeIndicator = (Get-Date -f "HH:mm")
    $pathIndicator = (Get-Location).Path.Replace($home, "~")

    write-colored ("[" + $timeIndicator + " " + $pathIndicator + "]") $myDefaultColor
    write-colored (getGitInformation) $myBranchColor
    " "
}

function write-colored
{
    write-host $args[0] -ForegroundColor $args[1] -BackgroundColor $myBackgroundColor -NoNewline
}

function setup_shell
{

    $console = $host.UI.RawUI
    $console.ForegroundColor = "green"
    $console.BackgroundColor = "black"

    Clear-Host
}

setup_shell
Set-Location ~