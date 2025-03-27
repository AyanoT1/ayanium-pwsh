function Get-NormalItemsOnly {
    Get-ChildItem | Where-Object { -not $_.Name.StartsWith('.') }
}

Set-Alias -Name 'ls' -Value 'Get-NormalItemsOnly'
Set-Alias -Name 'vim' -Value 'nvim'
Set-Alias -Name 'll' -Value 'Get-ChildItem'
Set-Alias -Name 'py' -Value 'python'
