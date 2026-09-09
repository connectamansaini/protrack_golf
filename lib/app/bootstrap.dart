import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:protrack_golf/app/app.dart';
import 'package:protrack_golf/app/injector.dart';
import 'package:protrack_golf/core/core.dart';

/// Initializes local storage and dependency injection, then launches the
/// app. All data is local - there is no backend to reach for.
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  final locationsBox = await Hive.openBox<Map<dynamic, dynamic>>(
    HiveBoxNames.locations,
  );
  final sessionsBox = await Hive.openBox<Map<dynamic, dynamic>>(
    HiveBoxNames.sessions,
  );
  final routinesBox = await Hive.openBox<Map<dynamic, dynamic>>(
    HiveBoxNames.routines,
  );
  final bucketSessionsBox = await Hive.openBox<Map<dynamic, dynamic>>(
    HiveBoxNames.bucketSessions,
  );
  final bagClubsBox = await Hive.openBox<Map<dynamic, dynamic>>(
    HiveBoxNames.bagClubs,
  );

  getIt
    ..registerSingleton<Box<Map<dynamic, dynamic>>>(
      locationsBox,
      instanceName: HiveBoxNames.locations,
    )
    ..registerSingleton<Box<Map<dynamic, dynamic>>>(
      sessionsBox,
      instanceName: HiveBoxNames.sessions,
    )
    ..registerSingleton<Box<Map<dynamic, dynamic>>>(
      routinesBox,
      instanceName: HiveBoxNames.routines,
    )
    ..registerSingleton<Box<Map<dynamic, dynamic>>>(
      bucketSessionsBox,
      instanceName: HiveBoxNames.bucketSessions,
    )
    ..registerSingleton<Box<Map<dynamic, dynamic>>>(
      bagClubsBox,
      instanceName: HiveBoxNames.bagClubs,
    );

  await configureDependencies();

  runApp(const ProTrackGolfApp());
}
