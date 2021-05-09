# Crescendo walkthrough pre-Release2

Work based off of Jason Helmick Blog ["Announcing PowerShell Crescendo Preview.2"](https://devblogs.microsoft.com/powershell/announcing-powershell-crescendo-preview-2/)

```powershell
find-module *crescendo*
find-module *crescendo* | select -ExpandProperty Description
Install-Module Microsoft.PowerShell.Crescendo
# Optional
Get-PSRepository
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
get-command *crescendo*
```

```powershell
get-help New-CrescendoCommand
Get-Help about_Crescendo
New-CrescendoCommand -verb get -noun packets
```

## Location of Crescendo.Schema.json file

`$env:HOME/.local/share/powershell/Modules/Microsoft.PowerShell.Crescendo/0.5.1/Microsoft.PowerShell.Crescendo.Schema.json`
`$env:HOME/.local/share/powershell/Modules/Microsoft.PowerShell.Crescendo/0.5.1/Samples`