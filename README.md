![Azure DevOps builds](https://img.shields.io/azure-devops/build/chrislee1107/f9bd49a9-1752-4ff3-b843-1f84a120111c/1?label=Azure%20Pipelines&style=plastic)    [![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/RapidID?color=blue&label=PowerShell%20Gallery&logo=RapidID&style=plastic) ](https://www.powershellgallery.com/packages/RapidID)  [![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/rapidid?color=Green&label=Downloads&logo=RapidID&style=plastic)](https://www.powershellgallery.com/packages/RapidID)    [![GitHub](https://img.shields.io/github/license/clee1107/rapidid?label=License&logo=RapidID&style=plastic)](https://github.com/clee1107/RapidID)

# RapidID (RID)

Purpose of this module is to simplify modifying extended Active Directory (AD) attributes created and used by Identity Automations Rapid Identity Suite.

Azure Dev Ops Project: [RapidID](https://dev.azure.com/chrislee1107/RapidID)

## Disclaimer
This project is to be considered a proof-of-concept and not a supported product.

If you have any problems please check our GitHub issues page. If you do not see your problem captured, please file a new issue and follow the provided template.

## How to set up
Install the module from the PowerShell Gallery:

```powershell
Install-Module RapidID
```

## Function Sets
- ### RIDGroupLogic
    Function set allows for management of idautogroupincludefilter.
    - [Clear-RIDGroupLogic](docs/Clear-RIDGroupLogic.md)
    - [Get-RIDGroupLogic](docs/Get-RIDGroupLogic.md)
    - [Set-RIDGroupLogic](docs/Set-RIDGroupLogic.md)
    - [Test-RIDGroupLogic](docs/Test-RIDGroupLogic.md)

- ### RIDGroupCoOwner
    Function set allows for management of idautogroupincludefilter.
    - [Clear-RIDGroupCoOwner](docs/Clear-RIDGroupCoOwner.md)
    - [Get-RIDGroupCoOwner](docs/Get-RIDGroupCoOwner.md)
    - [Set-RIDGroupCoOwner](docs/Set-RIDGroupCoOwner.md)
    - [Remove-RIDGroupLogic](docs/Remove-RIDGroupLogic.md)
    - [Test-RIDGroupCoOwner](docs/Test-RIDGroupCoOwner.md)

## Changes and versioning

Modules in this repository will use the semantic versioning model to declare breaking changes from v1.0.0. Prior to v1.0.0, breaking changes may be introduced in minor (0.x.0) version increments.

For running version changes consult [ChangeLog](docs/changelog.md).

## Maintainers

 - [Chris Lee](https://github.com/clee1107)

## License

This project is [licensed under the MIT License](LICENSE).

## Roadmap

- [Users](ROADMAPUsers.md)
- [Groups](ROADMAPGroups.md)
