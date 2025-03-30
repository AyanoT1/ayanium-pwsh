$config = @{
    MaxDirectoryDepth = 3
    RootSymbol = "PS"
    PathColor = "White"
    BranchColor = "DarkMagenta"
    PromptSymbol = "⨠ "
    ShowGitBranch = $true 
}

function Prompt {
    $fullPath = $PWD.Path
    $parts = $fullPath -split '\\'
    
    if ($parts.Count -gt ($config.MaxDirectoryDepth + 1)) {
        $displayPath = "$($parts[0])\...\$($parts[-$config.MaxDirectoryDepth..-1] -join '\')"
    }
    else {
        $displayPath = $fullPath
    }
    
    $branch = $null
    if ($config.ShowGitBranch) {
        $branch = git branch --show-current 2>$null
    }
    
    Write-Host $config.RootSymbol -NoNewline
    Write-Host " $displayPath " -NoNewline -ForegroundColor $config.PathColor
    
    if ($branch) {
        Write-Host "($branch) " -NoNewline -ForegroundColor $config.BranchColor
    }
    
    return $config.PromptSymbol
}
