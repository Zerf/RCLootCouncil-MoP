# RCLootCouncil-MoP
RCLootCouncil backport for MoP

## Changelog: ##

11-02-2022:
Autopass now auto passes tokens.

08-02-2022:
Reverted AceTimer-3.0 lib back to previous version (r1079) (was causing C_ errors)

### Known bugs: ### 

Pressing enter on note after already needing/passing the item gives a lua error

Ranks do not display properly in the voting frame (curently string is empty, ml_core.lua -> Line 91)