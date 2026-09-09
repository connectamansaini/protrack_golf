import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:protrack_golf/app/injector.dart';
import 'package:protrack_golf/app/router/app_routes.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/locations.dart';
import 'package:protrack_golf/src/sessions/bloc/session_detail_bloc.dart';
import 'package:protrack_golf/src/sessions/entities/practice_session.dart';
import 'package:protrack_golf/src/sessions/widgets/widgets.dart';

const _imageExtensions = {'.jpg', '.jpeg', '.png', '.heic', '.webp'};

/// Read-only detail screen for a single logged `PracticeSession`.
class SessionDetailView extends StatelessWidget {
  const SessionDetailView({required this.sessionId, super.key});

  final String sessionId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<SessionDetailBloc>()
                ..add(SessionDetailRequested(sessionId)),
        ),
        BlocProvider(
          create: (_) =>
              getIt<LocationsBloc>()..add(const LocationsRequested()),
        ),
      ],
      child: const _SessionDetailScaffold(),
    );
  }
}

class _SessionDetailScaffold extends StatelessWidget {
  const _SessionDetailScaffold();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Session')),
      body: BlocBuilder<SessionDetailBloc, SessionDetailState>(
        builder: (context, state) {
          switch (state.status) {
            case AppStatusInitial() || AppStatusLoading():
              return const LoadingView();
            case AppStatusFailure(:final failure):
              return ErrorView(message: failure.message);
            case AppStatusEmpty():
              return const EmptyView(message: 'Session not found.');
            case AppStatusSuccess():
              final session = state.session;
              if (session == null) {
                return const EmptyView(message: 'Session not found.');
              }
              return BlocBuilder<LocationsBloc, LocationsState>(
                builder: (context, locationsState) {
                  final locationName = locationsState.locations
                      .where((l) => l.id == session.locationId)
                      .map((l) => l.name)
                      .firstOrNull;
                  return _SessionDetailBody(
                    session: session,
                    locationName: locationName ?? 'Unknown location',
                  );
                },
              );
          }
        },
      ),
    );
  }
}

class _SessionDetailBody extends StatelessWidget {
  const _SessionDetailBody({required this.session, required this.locationName});

  final PracticeSession session;
  final String locationName;

  bool _isImage(String path) =>
      _imageExtensions.any((ext) => path.toLowerCase().endsWith(ext));

  @override
  Widget build(BuildContext context) {
    final clubs = session.clubEntries.length;
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        SessionDetailHero(
          session: session,
          locationName: locationName,
          onViewRecap: () => context.push(SessionsRoutes.recap(session.id)),
        ),
        const SizedBox(height: AppSpacing.lg),
        SectionHeader('By club  ·  $clubs'),
        for (final entry in session.clubEntries) ClubEntryTile(entry: entry),
        if (session.notes.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.md),
          const SectionHeader('Notes'),
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text(
                session.notes,
                style: AppTypography.textTheme.bodyLarge,
              ),
            ),
          ),
        ],
        if (session.mediaPaths.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.lg),
          const SectionHeader('Photos / videos'),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              for (final path in session.mediaPaths)
                if (_isImage(path))
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadii.md),
                    child: Image.file(
                      File(path),
                      width: _MediaFallbackIcon.size,
                      height: _MediaFallbackIcon.size,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => const _MediaFallbackIcon(),
                    ),
                  )
                else
                  const _MediaFallbackIcon(),
            ],
          ),
        ],
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}

class _MediaFallbackIcon extends StatelessWidget {
  const _MediaFallbackIcon();

  static const double size = AppSpacing.xxl * 2 + AppSpacing.lg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border, width: AppStrokes.thin),
        borderRadius: BorderRadius.circular(AppRadii.md),
      ),
      child: const Icon(Icons.movie_outlined, color: AppColors.textSecondary),
    );
  }
}
