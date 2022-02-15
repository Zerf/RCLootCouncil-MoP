# RCLootCouncil-MoP
RCLootCouncil backport for MoP

## Changelog: ##

11-02-2022 (1.0.1):
Auto pass now works with tokens.

08-02-2022 (1.0.0):
Reverted AceTimer-3.0 lib back to previous version (r1079) (was causing C_ errors)

### Known bugs: ### 

Pressing enter on note after already needing/passing the item gives a lua error

Ranks do not display properly in the voting frame (curently string is empty, ml_core.lua -> Line 91)

Item listing (tabs, left side of the frame) in the VotingFrame sometimes refuse to appear. (only way to reproduce is after server refuses to assign items to the current ML, pserver issue only?) OR they appear somewhere in africa (unknown yet)