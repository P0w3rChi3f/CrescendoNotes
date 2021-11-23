# Crescendo walkthrough pre-Release4

Work based off of Jason Helmick Blog ["Announcing PowerShell Crescendo Preview.4"](https://devblogs.microsoft.com/powershell/announcing-powershell-crescendo-preview-4/)

## Things to test during this trial

1) Wrap mimikatz up in crecendo and pull hashes out of memory
2) See if Defender will notice the PowerShell module running
3) If it does get caught, what artifacts are left behind.
4) How do the cresendo-mimikatz artifacts compair to the real mimikatz artifacts

## Attacker machine

This machine is a simple Kali machine pulled from ["The Vagrant Cloud"](https://app.vagrantup.com/elrey741/boxes/kali-linux_amd64)

My edited version of the Vagrant file is located in the [LabFiles](./LabFiles/Vagrantfile) directory.

1) Machine did not have PowerShell installed, so I installed it

    ```bash
    sudo apt-get update -y
    sudo apt upgrade -y
    sudo apt install powershell -y
    ```

2) Install VSCode

    ```bash
    sudo apt install curl gpg software-properties-common apt-transport-https
    curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
    sudo apt update
    sudo apt install code
    ```

3) Build install the PowerShell Crescendo Module
    * Samples located here (/home/vagrant/.local/share/powershell/Modules/Microsoft.PowerShell.Crescendo/0.7.0)

    ```PowerShell
    Install-Module -Name Microsoft.PowerShell.Crescendo
    New-Item -Type Directory -Name Get-PassHash
    cd Get-PassHash
    New-CrescendoCommand -Verb Get -Noun PassHashes -OriginalName MimiKatz | Export-CrescendoCommand -targetDirectory .

    Export-CrescendoModule -ConfigurationFile ./Get-PassHashes.crescendo.json -ModuleName GetPassHash.psm1

    import-module GetPassHash.psm1
    ```

    * Ran into an issues using the export cmdlet, It would not produce a valid psm1.  I resulted in modifiing a sample.
    * Module is still not importing correctly.
    * Moved laptop to work and module imported correctly.  The only change I made was resarting the VMWare Nics
    