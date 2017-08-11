$user = Read-Host -Prompt 'What is the name of the user you wish to unlock?'

Unlock-ADAccount -Identity $user

Read-Host -Prompt "The specified user AD account has been unlocked, press Enter to exit"