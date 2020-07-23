$srcPath = "$PSScriptRoot\src"
$buildPath = "$PSScriptRoot\build"
$docPath = "$PSScriptRoot\docs"
$moduleName = "RapidID"
$modulePath = "$buildPath\$moduleName"
$author = 'Chris Lee'
$manifestPath = "$srcPath\$moduleName.psd1"
$moduleVersion = (Test-ModuleManifest -Path $manifestPath).Version
$major = $moduleVersion.Major
$minor = $moduleVersion.Minor
$patch = $moduleVersion.Build
#$version = '0.0.1'
$ProjectUri = "https://github.com/clee1107/RapidID"

task Clean {
    If(Get-Module $moduleName){
        Remove-Module $moduleName
    }
    If(Test-Path $modulePath){
        $null = Remove-Item $modulePath -Recurse -ErrorAction Ignore
    }
}

task DocInit {

}

task DocBuild {
    New-ExternalHelp $docPath -OutputPath "$modulePath\EN-US"
}

task ModuleBuild Clean, DocBuild, {
    $pubFiles = Get-ChildItem "$srcPath\public" -Filter *.ps1 -File
    #$privFiles = Get-ChildItem "$srcPath\private" -Filter *.ps1 -File
    If(-not(Test-Path $modulePath)){
        New-Item $modulePath -ItemType Directory
    }
    ForEach($file in ($pubFiles)) {
        Get-Content $file.FullName | Out-File "$modulePath\$moduleName.psm1" -Append -Encoding utf8
    }
    <#ForEach($file in ($privFiles)) {
        Get-Content $file.FullName | Out-File "$modulePath\$moduleName.psm1" -Append -Encoding utf8
    }#>
    Copy-Item "$srcPath\$moduleName.psd1" -Destination $modulePath

    $moduleManifestData = @{
        Author = $author
        Copyright = "(c) $((get-date).Year) $author. All rights reserved."
        Path = "$modulePath\$moduleName.psd1"
        FunctionsToExport = $pubFiles.BaseName
        RootModule = "$moduleName.psm1"
        ModuleVersion = $moduleVersion
        ProjectUri = $ProjectURI
    }
    Update-ModuleManifest @moduleManifestData
    Import-Module $modulePath -RequiredVersion $version
}

task Publish {
    Invoke-PSDeploy -Path $PSScriptRoot -Force
}

task VersionPatch {
    $patch++
    $newVersion = [version]"$major.$minor.$patch"
    Write-Verbose "Bumping module version to [$newVersion]"
    Update-ModuleManifest -Path $manifestPath -ModuleVersion $newVersion
    $moduleVersion = (Test-ModuleManifest -Path $manifestPath).Version
}

task VersionMinor {
    $minor++
    $patch = 0
    $newVersion = [version]"$major.$minor.$patch"
    Write-Verbose "Bumping module version to [$newVersion]"
    Update-ModuleManifest -Path $manifestPath -ModuleVersion $newVersion
    $moduleVersion = (Test-ModuleManifest -Path $manifestPath).Version
}

task VersionMajor {
    $major++
    $minor = 0
    $patch = 0
    $newVersion = [version]"$major.$minor.$patch"
    Write-Verbose "Bumping module version to [$newVersion]"
    Update-ModuleManifest -Path $manifestPath -ModuleVersion $newVersion
    $moduleVersion = (Test-ModuleManifest -Path $manifestPath).Version
}

task All ModuleBuild, Publish