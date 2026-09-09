# Play Console walkthrough — ProTrack Golf

Everything you type in Play Console, in the order the console asks for
it. Values marked **paste** come from `store/listing.md`; files come from
`store/` and `build/app/outputs/bundle/release/`.

Package name (fixed once uploaded): `com.makeanapplikeus.protrackgolf`

## 1. Create the app

Play Console → **Create app**

| Field | Value |
|---|---|
| App name | ProTrack Golf |
| Default language | English (United States) |
| App or game | App |
| Free or paid | Free (cannot be changed to paid later) |
| Declarations | tick both policy boxes |

## 2. Set up your app (Dashboard → "Set up your app")

Work down the list; each opens a form.

- **Privacy policy** → `https://connectamansaini.github.io/protrack_golf/`
- **App access** → "All functionality is available without special access"
- **Ads** → No, the app does not contain ads
- **Content rating** → email `makeanapplikeus@gmail.com`, category *Utility, Productivity, Communication, or Other*, answer No to everything. Expect *Everyone* / *3+*.
- **Target audience** → age group **18 and over** only (keeps you out of the Families policy). "Could the app unintentionally appeal to children?" → No.
- **News app** → No
- **COVID-19 contact tracing** → No
- **Data safety** → "Does your app collect or share any of the required user data types?" → **No**. Then **Save** and **Submit**. (Reasoning is in `listing.md`.)
- **Government apps** → No
- **Financial features** → none / No
- **Health** → No health features
- **App category** → App, category **Sports**; tags optional
- **Store listing contact details** → email `makeanapplikeus@gmail.com`; phone and website optional (the Pages URL works as a website)

## 3. Main store listing (Grow → Store presence → Main store listing)

| Field | Source |
|---|---|
| App name | ProTrack Golf |
| Short description | **paste** from `listing.md` (79 chars) |
| Full description | **paste** from `listing.md` |
| App icon | `store/icon_512.png` |
| Feature graphic | `store/feature_graphic.png` |
| Phone screenshots | `store/screenshots/01…05.png`, in order |
| 7-inch / 10-inch tablet screenshots | optional; skip for now (the app is portrait-only) |

Save. The dashboard task list should now show everything green except
the release itself.

## 4. Internal testing release (Test and release → Testing → Internal testing)

1. **Testers** tab → Create email list, name it "Internal", add your own
   Gmail (and any friends'). Save.
2. **Releases** tab → **Create new release**.
3. **App integrity → Play App Signing**: keep the default (Google manages
   the app signing key; the JKS on this machine is the *upload* key).
   Accept.
4. Upload `build/app/outputs/bundle/release/app-release.aab`.
5. Release name: leave as `1 (1.0.0)`.
6. Release notes (en-US):
   ```
   First release. Log range sessions one ball at a time, keep a yardage
   chart for every club, and see how each club trends over time.
   ```
7. **Next** → review warnings (there should be none) → **Save and publish**.

Internal testing is live within minutes. Open the **Testers** tab, copy
the opt-in link, open it on your Pixel while signed in with a tester
Gmail, tap *Become a tester*, then install from Play.

Uninstall the sideloaded release APK first — Play's copy is signed by
Google's app-signing key, so the two won't install over each other:

```bash
adb -s 49071FDAS0024R uninstall com.makeanapplikeus.protrackgolf
```

## 5. Closed testing (only if Play requires it)

Personal developer accounts created after 13 Nov 2023 must run a closed
test with **at least 12 testers opted in for 14 consecutive days** before
they can apply for production access. If your account is older, skip to
step 6.

1. Testing → **Closed testing** → Create track "Beta" → same steps as
   internal, reusing the same bundle (or a new one).
2. Add ≥12 tester emails (a Google Group works too). Share the opt-in
   link; each person must tap *Become a tester* **and install**.
3. After 14 days, Dashboard → **Apply for production access**, answer
   the short questionnaire about what you tested and learned.

## 6. Production

Test and release → **Production** → Create new release → same bundle (or
bump `version:` in `pubspec.yaml` to `1.0.1+2` and rebuild if anything
changed) → countries: **All countries** (or India + a few) → Save and
publish. Review takes hours to a few days for a first release.

## Every future update

```bash
# bump version in pubspec.yaml first, e.g. 1.0.1+2 (versionCode must increase)
flutter build appbundle --release
```

Upload the new `app-release.aab` to the track you want. The upload key
(`android/upload-keystore.jks`) must be the same one — keep it backed up.
