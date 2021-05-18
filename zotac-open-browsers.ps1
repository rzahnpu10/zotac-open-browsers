$profiles = @('User1','User2','User3','User4','User5','User6','User7','User8','User9','User10')
$folder = "C:\temp"
$chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$val = 0

#create folders
if (!(Test-Path -Path $folder)) {
    New-Item -Path $folder -ItemType directory
    }


#create user profiles

while ($val -ne 10)
{
    #New-Item -Path $folder + "\" + $profiles[$val] -ItemType directory
    $Path = $folder+ "\" + $profiles[$val]
    New-Item -Path $Path -ItemType directory
    Write-Host $Path
    #Start-Process -FilePath "C:\Program Files\Google\Chrome\Application\chrome.exe --user-data-dir=$Path"
    Start-Process -FilePath $chrome -ArgumentList "www.zotacstore.com --user-data-dir=$Path"
    $val++
    }
