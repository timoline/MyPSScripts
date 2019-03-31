$ModuleName = "ModuleName"
$Module = "Module" #Specify the module 
$SplittedFunctionPath = "Path" #Specify Splitted function path

#Import-Module
Import-Module $Module -Force -Verbose

#Function to split the module and export it as functions
Function Insert-Content 
{
    param ( [String]$Path )
    process 
    {
        $( , $_; Get-Content $Path -ea SilentlyContinue) | Out-File $Path
    }
}
$FunctionName = Get-Command -Module $ModuleName 
$path = "$SplittedFunctionPath" 
Foreach ($Function in $FunctionName.Name)
{
    (Get-Command $Function).definition | Out-File $Path\$Function.ps1
    "Function $Function `n {" | Insert-Content $Path\$Function.ps1
    "}" | Add-Content $Path\$Function.ps1

}