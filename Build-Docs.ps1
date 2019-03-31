$moduleName = "moduleName"
$modulePath = "modulePath\$moduleName"
$docPath = "$modulePath\docs" 
$author = 'author'
$version = '0.0.1'

Import-Module platyPS -Force
Import-Module "$modulePath\$moduleName.psm1"-Force -Verbose

New-MarkdownHelp -Module $moduleName -OutputFolder $docPath -WithModulePage -Force

Update-MarkdownHelp -Path $docPath
Update-MarkdownHelpModule  $docPath -RefreshModulePage 
#New-ExternalHelp -Path $docPath -OutputPath $docPath -Force -Verbose



