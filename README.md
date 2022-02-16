# RCLootCouncil-MoP
RCLootCouncil backport for MoP
Only enUS locale is supported!

## Changelog: ##

16-02-2022 (1.0.2):
votingFrame QoL changes.
Disable the built in roll functionality. (useless)
New buttons have their alpha set to 1 (instead of 0) by default. (core -> Line 228)
Added back the title for Session & votingFrame (toggles the frame off/on)

11-02-2022 (1.0.1):
Auto pass now works with tokens.

08-02-2022 (1.0.0):
Reverted AceTimer-3.0 lib back to previous version (r1079) (was causing C_ errors)

### Known bugs: ### 

Pressing enter on note after already needing/passing the item gives a lua error

Ranks do not display properly in the voting frame (curently string is empty, ml_core.lua -> Line 91)

Item listing (tabs, left side) in the VotingFrame sometimes appear at the last position of the frame, not current.
This also affects the loot history on the frame.

New buttons do not appear in the votingFrame, unless you toggle OFF and then ON the specific response in the Filter tab (votingFrame)