$usrcreds = Get-Credential
Restart-Computer "TXFXPROD01", "TXFXPROD02" -Credential $usrcreds -Force
Read-Host -Prompt "The specified servers have been reset, press Enter to exit"
