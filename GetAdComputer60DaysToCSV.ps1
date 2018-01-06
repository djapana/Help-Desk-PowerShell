$time = (Get-Date).AddDays(-60)

Get-ADComputer -SearchBase "OU=Computers,OU=Mouser North America,DC=mouser,DC=lan" -Filter {(OperatingSystem -notlike '*SERVER*') -and (lastLogonDate -lt $time)} -Properties Name,lastlogondate,operatingsystem | select name,lastlogondate | Export-CSV -NoType \\istxw-2y9k\c$\users\cody.read\desktop\lasttest.csv