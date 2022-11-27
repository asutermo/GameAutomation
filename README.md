# Scripts

Simple and Hacky scripts to mess with/automate gaming.

## Prerequisites (Global)

You will need python 3.7+ and Selenium. Anything > 3.7 is untested today but I'll handle it soon.

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
