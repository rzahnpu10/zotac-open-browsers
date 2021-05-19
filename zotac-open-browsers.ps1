$profiles = @('User1','User2','User3','User4','User5','User6','User7','User8','User9','User10')
$folder = "C:\temp"
$chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$val = 0
$defaultprof = $env:LOCALAPPDATA + "\Google\Chrome\User Data\Default"

#create storage folder
if (!(Test-Path -Path $folder)) {
    New-Item -Path $folder -ItemType directory
    }


#create user profiles and open chrome

while ($val -ne 10)
{
    $Path = $folder+ "\" + $profiles[$val]
    if (!(Test-Path -Path $Path)) {
        New-Item -Path $Path -ItemType directory
        New-Item -Path "$Path\Default" -ItemType directory
        Copy-Item -Path "$defaultprof\*" -Destination "$Path\Default" -Recurse
        }
    Start-Process -FilePath $chrome -ArgumentList "www.zotacstore.com --user-data-dir=$Path"
    $val++
    }
