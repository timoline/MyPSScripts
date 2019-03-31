$Path = 'Path'
$ModulePath = 'ModulePath'
$ModuleName = 'ModuleName '
$Author = 'Author'
$CompanyName = 'CompanyName'
$Description = 'PowerShell module with common functions'

# Create the module and private function directories
New-Item $ModulePath\$ModuleName -ItemType Directory
New-Item $ModulePath\$ModuleName\private -ItemType Directory
New-Item $ModulePath\$ModuleName\public -ItemType Directory
New-Item $ModulePath\$ModuleName\docs -ItemType Directory
#New-Item $ModulePath\$ModuleName\en-US -ItemType Directory # For about_Help files
New-Item $Path\Test -ItemType Directory

#Create the module and related files
New-Item "$ModulePath\$ModuleName\$ModuleName.psm1" -ItemType File
#New-Item "$ModulePath\$ModuleName\$ModuleName.Format.ps1xml" -ItemType File
#New-Item "$ModulePath\$ModuleName\en-US\about_$ModuleName.help.txt" -ItemType File
New-Item "$Path\Test\$ModuleName.Tests.ps1" -ItemType File
New-ModuleManifest -Path $ModulePath\$ModuleName\$ModuleName.psd1 `
                   -RootModule $ModuleName.psm1 `
                   -Description $Description `
                   -PowerShellVersion 5.0 `
                   -Author $Author `
                   -CompanyName $CompanyName `
                  # -FormatsToProcess "$ModuleName.Format.ps1xml"
