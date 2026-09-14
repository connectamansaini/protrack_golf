# Manual test plan — ProTrack Golf

Run on a physical Android phone (Pixel 9 Pro XL, Android 16) against the
debug build (`com.makeanapplikeus.protrackgolf.debug`) with app data
cleared first. Each scenario lists the steps, what must be true, and the
result of the last run.

Legend: ✅ pass · ❌ fail · ⚠️ pass with a note

## S1 · First launch and empty states

1. Clear app data, launch.
2. Splash shows the ball-on-tee mark and the "ProTrack Golf" wordmark.
3. Range tab shows the welcome hero with the tagline, "Start range
   session" and "Add manually". No session list, no month stats.
4. My Bag tab shows the empty bag illustration and "Build your bag".
5. Locations screen (pin icon) shows its empty state.

## S2 · Locations

1. From the pin icon, add "Riverside Driving Range" with a note. Save is
   disabled until a name is typed.
2. Add a second range "Hilltop Golf Club".
3. Both tiles show a monogram and "0 sessions".
4. Delete "Hilltop Golf Club": a confirm dialog appears; Cancel keeps it;
   confirming removes it.

## S3 · Range logger, free practice

1. Start range session. Location is pre-selected when only one exists.
2. Clubs: select Driver and PW in addition to 7 Iron. "Clear" empties the
   set and disables Start; re-select the three.
3. Bucket: Custom shows a balls slider; set 30. Summary bar reads
   "30 balls · 3 clubs · free practice".
4. Start hitting. Counter shows 30 balls left; intent defaults to Full.
5. Slider −/+ nudges by 5; drag changes distance; FAB label follows.
6. Log 3 × 7 Iron at 140, switch to Driver, set 210, log 2. Switch back to
   7 Iron: slider returns to 140.
7. Undo last removes only the last Driver shot; counter updates.
8. Switch intent to Practice: FAB turns gold; log 1 PW practice ball.
9. Edit clubs mid-session: remove PW; already logged PW shot is kept.
10. Type notes "slice on the driver". Finish.
11. Recap: 6 balls hit, 2 clubs counted, best Driver, "1 practice ball
    not counted", both clubs "First time". Done returns to Range with the
    session listed and month stats updated.

## S4 · Range logger, Dial In Distances plan

1. Start range session: "Same as last time" restores Driver, 7 Iron, PW.
2. Bucket 25. Focused Practice is greyed with "Needs at least 40 balls";
   Dial In Distances and Quick Bucket are enabled.
3. Choose Dial In Distances: timeline shows Warm-up (practice, PW) then
   PW, 7 Iron, Driver yardage phases; counts sum to 25.
4. Start hitting: phase 1 of 4, intent Practice, PW selected, gold FAB.
5. Log the warm-up balls: phase rolls to "PW yardages", intent Full.
6. Next phase / Back move between phases; the last phase disables Next.
7. Log every remaining ball; the last phase never rolls over and the
   counter reaches 0 balls left without going negative when one more is
   logged.
8. Finish: recap names the plan and the practice count; detail hero shows
   "Dial In Distances".

## S5 · Discard protection

1. Start a session, log one ball, press back.
2. "Discard this session?" appears. "Keep going" stays; back again then
   "Discard" leaves without saving.

## S6 · Add past session by hand

1. Add manually: date chips (Today / Yesterday / pick); pick Yesterday.
2. Location Riverside; add 7 Iron entry with distances 145, 150 via the
   slider; add Driver 220.
3. Notes "thin contact, slice". Save.
4. Session appears in the list dated yesterday; month stats count it.

## S7 · Session detail, recap and recurring notes

1. Open the manual session: hero shows date, location, bucket, balls,
   clubs, best; club tiles list every distance.
2. View recap: 7 Iron compared against the earlier session (delta shown).
3. Recurring notes panel lists "slice" (in 2 of the last sessions).
4. Delete a session from the list: confirm dialog; list and stats update.

## S8 · My Bag

1. My Bag shows clubs hit at the range (7 Iron, Driver, PW) grouped by
   category with range averages, and the bag illustration.
2. Add club: pick 5 Iron, toggle "in my bag", set 170 via slider, save.
3. 5 Iron detail: "your yds 170", no range data, chart absent.
4. 7 Iron detail: range avg, best, sessions list, trend chart with two
   points; "Add to bag" then "Edit distance" to 150. Back to the list:
   the 7 Iron card shows "In bag · 150 yds" without any other action.
5. Remove 5 Iron from the bag.

## S9 · Persistence and platform

1. Force-stop the app and relaunch: sessions, locations and bag survive.
2. Rotate the phone: the app stays portrait.
3. Back from a tab root leaves the app rather than looping.

## Results — run of 14 September 2026

Debug build of commit `ec6312c` plus the two fixes below, Pixel 9 Pro XL,
Android 16, app data cleared before S1. Driven over adb with UI Automator
dumps for element positions; screenshots kept per scenario.

| Scenario | Result | Notes |
|---|---|---|
| S1 First launch and empty states | ✅ | Splash, welcome hero, empty bag, empty locations all as specified |
| S2 Locations | ✅ | Save disabled until a name is typed; Keep/Delete dialog correct; "1 location" after delete |
| S3 Range logger, free practice | ✅ | Slider nudges, per-club distance memory, undo, practice toggle, club editor keeps logged shots, recap counts 5 balls / 2 clubs counted / 1 practice |
| S4 Dial In Distances plan | ✅ | 25 balls → 4 + 7 + 7 + 7; Focused greyed with "Needs at least 40 balls"; auto-rollover after warm-up; Back/Next; last phase never rolls over; 26 of 25 hit shows 0 balls left; recap and detail name the plan |
| S5 Discard protection | ✅ | Dialog on back; Keep going preserves the session; Discard saves nothing |
| S6 Add past session by hand | ⚠️ | Works end to end, dated Sep 13, month stats updated. Nit fixed after the run: the only location was not pre-selected (the logger does this). Nit fixed: notes were saved with trailing whitespace |
| S7 Detail, recap, recurring notes, delete | ✅ | Earliest session shows "First time"; the later one shows −10 / −8 yds vs it and "slice · 2 of 2"; delete dialog and stats update |
| S8 My Bag | ✅ | Only clubs with counted shots listed (PW with practice-only balls correctly absent); add 5 Iron at 170; 7 Iron chart with two points; Add to bag + Edit distance to 150; remove 5 Iron with confirm |
| S9 Persistence and platform | ✅ | Data survives force-stop; activity requests SCREEN_ORIENTATION_PORTRAIT; back from the tab root leaves the app |

No Dart exceptions in the run log across the whole session.

Found afterwards while recapturing the store screenshots, fixed in the
same release: the My Bag list did not reload after coming back from a
club's detail screen, so a club added to the bag (or a changed distance)
from there stayed stale until another bag action. S8 step 4 now also
checks the list after returning from detail.

### Observations not treated as bugs

- Switching to a club that has no shots yet keeps the slider where it
  was (e.g. a PW practice ball logged at 210 yds because the Driver was
  hit before). A per-club typical distance, or the club's My Bag number,
  would be a better starting point. Candidate for the next update.
- The slider does not remember a club's distance across sessions, only
  within one; same candidate fix as above.
- In a plan's last phase the progress line caps at "7 of 7 hit · phase
  done" even after more balls; intentional, the bucket counter shows the
  overflow.
