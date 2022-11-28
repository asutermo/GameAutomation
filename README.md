# Scripts

Simple and Hacky scripts to mess with/automate gaming.

Note: Many of these methods should not be used in regular practice. Selenium, for example, is generally used for test automation and not actual user profiles.

## Prerequisites (Global)

To get started, run:

```powershell
powershell.exe -File .\bootstrap.ps1 -ExecutionPolicy CurrentUser
```

### Scripts

#### GogGiveawayClaimer.py

Using your already logged in Chrome profile, go to GOG and claim the latest giveaway. Tested w/ python 3.7. Not ultra tested but worked on a giveaway.

##### Prerequisites

Using selenium 4 and web

```
python -m pip install selenium
python -m pip install webdriver-manager
```

### Execution 

```
python GogGiveawayClaimer.py
```

### Better Idea

Add this as a scheduled task, and run once a day (or however often you want.)
