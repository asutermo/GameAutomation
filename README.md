# Scripts

Simple and Hacky scripts to mess with/automate gaming.

Note: Many of these methods should not be used in regular practice. Selenium, for example, is generally used for test automation and not actual user profiles.

Also used xpaths may be frail.

## Prerequisites (Global)

To get started, run:

```powershell
powershell.exe -File .\bootstrap.ps1 -ExecutionPolicy CurrentUser
```

### Scripts

#### GogGiveawayClaimer.py

Using your already logged in Chrome profile, go to GOG and claim the latest giveaway. Not ultra tested but worked on a giveaway.

```
python GogGiveawayClaimer.py
```

### Follow-ups

- Automate adding this as a scheduled task.
- Share common script functionality
- Check to ensure user logged in
