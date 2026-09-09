import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:protrack_golf/core/core.dart';

void main() {
  testWidgets('PrimaryButton fires onPressed when tapped', (tester) async {
    var tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PrimaryButton(
            label: 'Save session',
            onPressed: () => tapped = true,
          ),
        ),
      ),
    );

    expect(find.text('Save session'), findsOneWidget);

    await tester.tap(find.text('Save session'));
    await tester.pump();

    expect(tapped, isTrue);
  });
}
