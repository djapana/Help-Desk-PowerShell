$usrcreds = Get-Credential
Restart-Computer "TXFXPROD01", "TXFXPROD02" -Credential $usrcreds -Force