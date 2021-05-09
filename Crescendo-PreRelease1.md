# Crescendo walkthrough pre-Release1

Work based off of Jason Helmick Blog ["Announcing PowerShell Crescendo Preview.1"](https://devblogs.microsoft.com/powershell/announcing-powershell-crescendo-preview-1/)

```powershell
find-module *crescendo*
Install-Module Microsoft.PowerShell.Crescendo
get-command *crescendo*
```

* Export-CrescendoModule  
* New-CrescendoCommand  

```powershell
get-help New-CrescendoCommand
Get-Help about_Crescendo
New-CrescendoCommand -verb get -noun packets
```

## Location of Crescendo.Schema.json file

`$env:HOME/.local/share/powershell/Modules/Microsoft.PowerShell.Crescendo/0.4.1/Microsoft.PowerShell.Crescendo.Schema.json`
`$env:HOME/.local/share/powershell/Modules/Microsoft.PowerShell.Crescendo/0.4.1/Samples`

## Notes when creating

### Step 1: Create the Crescendo Module json file

1. I could not find any out put for `New-CrescendoCommand -verb get -noun packets`
2. Copied a sample Cresendo.json and edited it to work with tcpdump
3. Just started off with a simple `tcpdump -i <interfacename>` and `tcpdump -r <path/to/pcap>

### Step 2: Export the Crescendo Module

When you modify the `json` file that you chose, you will use `Export-CrescendoModule` cmdlet.  You ***MUST*** use both the `-ConfigurationFile` and the `-ModuleName` parameters.  If you don't it will throw an error stating that "...the file doesn't exist."

Bad Example `Export-CrescendoModule ./IPPackets.Crescendo.json ./Get-NetTraffic/Get-NetTraffic.psm1`

Good Example `Export-CrescendoModule -ConfigurationFile ./IPPackets.Crescendo.json -ModuleName ./Get-NetTraffic/Get-NetTraffic.psm1`

Future PSTool C:\Windows\system32\pktmon.exe
