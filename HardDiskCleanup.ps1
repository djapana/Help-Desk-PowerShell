created by cody.read: 11/01/17
                                                                                                                  
$usertemp = "c:\users\*\appdata\local\temp"
$wintemp = "c:\windows\temp"   
$ccmcache = "c:\windows\ccmcache"
$swdist = "c:\windows\softwaredistribution"   
$time = (get-date).adddays(-30)                                                                                                                      

#delete c:\%username%\appdata\local\temp files - this removes all user temp files due to the wildcard
Remove-Item -Path $usertemp -Recurse -Force

#delete c:\windows\temp files
Remove-Item -Path $wintemp -Recurse -Force

#delete any items in c:\windows\ccmcache that are older than the set $time ($time - today's date minus 30, delete anything less than -lt)
Get-ChildItem -Path $ccmcache -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $time } | Remove-Item -Force

#delete any empty folders in c:\windows\ccmcache after deleting the old files
Get-ChildItem -Path $ccmcache -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse

#stop windows update service, delete any items in c:\windows\softwaredistribution based on size greater than 100Mb, start windows update service
net stop wuauserv
Get-ChildItem -Path $swdist -Recurse | Where-Object {$_.PSIsContainer -eq $false -and $_.length -gt 100000000} | Remove-Item -Force
net start wuauserv

#run diskcleanup to finish the rest
cleanmgr /sagerun:1 -Force

#compress c:\windows\installer
COMPACT /c /s:c:\windows\installer