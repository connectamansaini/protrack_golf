import 'package:flutter_test/flutter_test.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/locations.dart';
import 'package:protrack_golf/src/sessions/sessions.dart';

import '../../helpers/fake_locations_repository.dart';
import '../../helpers/fake_sessions_repository.dart';

Future<void> settle() => Future<void>.delayed(const Duration(milliseconds: 20));

void main() {
  const riverside = Location(id: 'riverside', name: 'Riverside Driving Range');
  const hilltop = Location(id: 'hilltop', name: 'Hilltop Golf Club');

  late FakeLocationsRepository locations;
  late FakeSessionsRepository sessions;

  SessionFormBloc build() => SessionFormBloc(
    GetLocationsUsecase(locations),
    AddLocationUsecase(locations),
    LogSessionUsecase(sessions),
  );

  setUp(() {
    locations = FakeLocationsRepository([riverside]);
    sessions = FakeSessionsRepository([]);
  });

  group('SessionFormBloc', () {
    test('pre-selects the only location, like the range logger', () async {
      final bloc = build()..add(const SessionFormStarted());
      await settle();

      expect(bloc.state.selectedLocationId, 'riverside');
      await bloc.close();
    });

    test('leaves the location unset when there is a choice', () async {
      locations = FakeLocationsRepository([riverside, hilltop]);
      final bloc = build()..add(const SessionFormStarted());
      await settle();

      expect(bloc.state.selectedLocationId, isEmpty);
      expect(bloc.state.canSubmit, isFalse);
      await bloc.close();
    });

    test('trims notes and saves the entries in order', () async {
      final bloc = build()
        ..add(const SessionFormStarted())
        ..add(
          const SessionFormClubEntryAdded(
            ClubEntry(club: GolfClub.iron7, distances: [145, 150]),
          ),
        )
        ..add(const SessionFormNotesChanged('thin contact, slice  '))
        ..add(const SessionFormSubmitted());
      await settle();

      final saved = bloc.state.savedSession!;
      expect(saved.locationId, 'riverside');
      expect(saved.notes, 'thin contact, slice');
      expect(saved.clubEntries.single.distances, [145, 150]);
      await bloc.close();
    });
  });
}
