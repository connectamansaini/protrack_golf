# ProTrack Golf

*Track your golf like a pro.*

[![CI](https://github.com/connectamansaini/protrack_golf/actions/workflows/ci.yml/badge.svg)](https://github.com/connectamansaini/protrack_golf/actions/workflows/ci.yml)

A Flutter app for new golfers at the driving range: record every ball as
you hit it, keep a personal yardage chart for each club, and watch your
distances change over time. Everything is stored on the device (Hive) -
there is no backend.

## Features

- **Range logger** - pick a location, bucket size and today's clubs, then
  one tap per ball with a distance slider. Finishing a session opens a
  recap comparing each club to the last time you hit it, plus recurring
  themes from your notes.
- **Add past session** - rebuild a session by hand (date, location, bucket,
  shots per club, notes, photos).
- **My Bag** - the clubs you carry with the distance you enter for each,
  merged with what your range sessions compute (average, best, latest), a
  bag illustration, and a per-club trend chart.
- **Locations** - the ranges you practise at, with sessions and balls hit
  at each.

## Architecture

Feature-first Clean Architecture (DDD) under `lib/src/<feature>/`, each
feature holding its own models, entities, failures, data source,
repository, usecases, bloc, widgets and views, wired with `get_it` +
`injectable`. Domain code never touches Flutter, Hive or JSON; data sources
throw `<Feature>Failure`, repositories return `Either<Failure, Entity>`.

Shared design tokens (colours, spacing, radii, typography) live in
`lib/core/design/` - widgets never hardcode them. The palette is tuned for
reading the phone in bright sunlight.

## Development

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter run
```

### Release builds

Release signing reads `android/key.properties` (git-ignored) and the
`android/upload-keystore.jks` it points at. Without them a release build
falls back to the debug key with a warning, so a fresh clone still builds.
Keep both files backed up somewhere private - the Play Store upload key
lives there.

```bash
flutter build appbundle --release
```

Launcher icons and the splash screen are generated from
`assets/branding/`, and the artwork there (plus the Play Store feature
graphic and 512px icon in `store/`) is drawn by `tool/make_branding.ps1`:

```bash
powershell -ExecutionPolicy Bypass -File tool/make_branding.ps1
dart run flutter_launcher_icons
dart run flutter_native_splash:create
```

### Store listing

`store/` holds everything for the Play Console listing: `listing.md`
(descriptions, category, data-safety answers), `feature_graphic.png`,
`icon_512.png` and phone screenshots captured on a Pixel 9 Pro XL.
