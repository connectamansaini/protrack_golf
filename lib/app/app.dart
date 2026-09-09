import 'package:flutter/material.dart';
import 'package:protrack_golf/app/bloc_providers.dart';
import 'package:protrack_golf/app/router/app_router.dart';
import 'package:protrack_golf/app/themes/app_theme.dart';

/// The root widget of ProTrack Golf.
class ProTrackGolfApp extends StatelessWidget {
  const ProTrackGolfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBlocProviders(
      child: MaterialApp.router(
        title: 'ProTrack Golf',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        routerConfig: appRouter,
      ),
    );
  }
}
