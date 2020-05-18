# VIM
This document contains very useful things that I want to remember. That is all.

## Quick Fix
The QuickFix shows a list of results in a pane at the bottom of the vim screen.

### Commands
```
:copen " Open the quickfix window
:ccl   " Close it
:cw    " Open it if there are "errors", close it otherwise (some people prefer this)
:cn    " Go to the next error in the window
:cnf   " Go to the first error in the next file
```

## Searching
:set hls is #hlsearch + incsearch

Tips
Use :noh to turn off highlighting

Config
Change search colors

### Options
ic ignorecase
is incsearch
hls hlsearch

