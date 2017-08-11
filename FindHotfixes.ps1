$si = systeminfo /s computernamehere /fo csv | ConvertFrom-CSV            
$si."Network Card(s)".Split(",")            
$si."Hotfix(s)".Split(",")