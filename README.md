[![Build Status](https://dev.azure.com/chrislee1107/RapidID/_apis/build/status/RapidID-CI?branchName=master)](https://dev.azure.com/chrislee1107/RapidID/_build/latest?definitionId=1&branchName=master)

# RapidID (RID)

Purpose of this module is to simplify modifying extended Active Directory (AD) attributes created and used by Identity Automations Raapid Identity Suite.

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
    Comprised of four (4) commands (Get, Set, Remove, Test).
    - [Get-RIDGroupLogic](docs/Get-RIDGroupLogic.md)
    - [Remove-RIDGroupLogic](docs/Remove-RIDGroupLogic.md)
    - [Set-RIDGroupLogic](docs/Set-RIDGroupLogic.md)
    - [Test-RIDGroupLogic](docs/Test-RIDGroupLogic.md)

## Changes and versioning

Modules in this repository will use the semantic versioning model to declare breaking changes from v1.0.0. Prior to v1.0.0, breaking changes may be introduced in minor (0.x.0) version increments.

## Maintainers

 - [Chris Lee](https://github.com/clee1107)

## License

This project is [licensed under the MIT License](LICENSE).

## Roadmap

- [Users](ROADMAPUsers.md)
- [Groups](ROADMAPGroups.md)
