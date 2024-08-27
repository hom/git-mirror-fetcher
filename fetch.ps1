$directoryPath = Read-Host "Enter the directory path"
$folders = Get-ChildItem -Path $directoryPath -Directory

foreach ($folder in $folders) {
    # 检查是否是 Git 仓库
    if (Test-Path -Path (Join-Path -Path $folder.FullName -ChildPath ".git")) {
        # 获取当前分支
        $currentBranch = (git -C $folder.FullName branch --show-current).Trim()
        
        # 执行 git pull
        git -C $folder.FullName pull origin $currentBranch
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Git pull successful."
        } else {
            Write-Host "Git pull failed."
        }
    } else {
        Write-Host $folder.FullName
        Write-Host "The current directory is not a Git repository."
    }
}