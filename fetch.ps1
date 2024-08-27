$directoryPath = Read-Host "Enter the directory path"
$folders = Get-ChildItem -Path $directoryPath -Directory

foreach ($folder in $folders) {
    Write-Host $folder.FullName
}