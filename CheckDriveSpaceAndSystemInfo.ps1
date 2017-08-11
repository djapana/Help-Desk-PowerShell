$PC = Read-Host -Prompt 'What is the name of the machine you wish to scan?'

Write-Host 'C:\ space:
'

# Free C: space in MB
$CFree   = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" -Property FreeSpace -ComputerName $PC |
 Select-Object @{name="CFreeMB";expression={$_.FreeSpace/1MB}} |
 Select-Object -ExpandProperty CFreeMB
If     ($CFree -gt 1000) { "C drive is OK at $($CFree)MB free
" }
ElseIf ($CFree -lt 1000) { "C drive is low at $($CFree)MB free
" }
ElseIf ($CFree -lt 100)  { "C drive is critically low at $($CFree)MB free
" }

# Free H: space in MB (Can't get this one to work, nulling it for now)
#$HFree   = Get-WmiObject Win32_Share -Filter "DeviceID='H:'" -Property FreeSpace -ComputerName $PC |
 #Select-Object @{name="HFreeMB";expression={$_.FreeSpace/1MB}} |
 #Select-Object -ExpandProperty HFreeMB
#If     ($HFree -gt 1000) { "H drive is OK at $($HFree)MB free
#" }
#ElseIf ($HFree -lt 1000) { "H drive is low at $($HFree)MB free
#" }
#ElseIf ($HFree -lt 100)  { "H drive is critically low at $($HFree)MB free
#" }

Write-Host 'Generating System Info...
'

SYSTEMINFO /S $PC

Read-Host -Prompt "Press Enter to exit"