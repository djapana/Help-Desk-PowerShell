$PC = Read-Host -Prompt 'What is the name of the machine you wish to scan?'

Write-Host '
Generating the Hotfixes and Network Information...
'

$si = systeminfo /s $PC /fo csv | ConvertFrom-CSV            
$si."Network Card(s)".Split(",")            
$si."Hotfix(s)".Split(",")

Read-Host -Prompt "Press Enter to exit"
