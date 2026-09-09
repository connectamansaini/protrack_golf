import 'package:flutter/widgets.dart';

/// App-wide bloc providers.
///
/// Every bloc in this app is scoped to the screen that uses it (created via
/// `getIt<XBloc>()` inside that screen's own `BlocProvider`), so there is
/// currently nothing that needs to live above `MaterialApp.router`. This
/// widget exists as the single seam where a future truly-global bloc (e.g.
/// an app-wide settings bloc) would be wired in, per the architecture's
/// `app/bloc_providers` convention.
class AppBlocProviders extends StatelessWidget {
  const AppBlocProviders({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => child;
}
