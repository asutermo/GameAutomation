# Scripts

Simple and Hacky scripts to mess with/automate gaming. 

For giveaways, you must already be logged in.
Note: Many of these methods should not be used in regular practice. Selenium, for example, is generally used for test automation and not actual user profiles.

Also used xpaths may be frail.

## Prerequisites (Global)

To get started, run:

```powershell
powershell.exe -File .\bootstrap.ps1 -ExecutionPolicy CurrentUser
```

### Scripts

#### Automate-Claimer.ps1

This will automatically add this script to your Windows Scheduled Tasks to make sure you get the giveaways every day.

```powershell
powershell -File .\Automate-Claimer.ps1 -hour 3 -timeOfDay pm -scriptPath .\GameClaimerScripts\GOGGiveawayClaimer.py -ExecutionPolicy CurrentUser
```

#### GogGiveawayClaimer.py

Using your already logged in Chrome profile, go to GOG and claim the latest giveaway. Not ultra tested but worked on a giveaway.

### Execution 

```
python GogGiveawayClaimer.py
```

### Follow-ups

Automate adding this as a scheduled task.
