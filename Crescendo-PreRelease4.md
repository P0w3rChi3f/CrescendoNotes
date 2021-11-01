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
 sudo apt-get update
 sudo apt-get upgrade
```
