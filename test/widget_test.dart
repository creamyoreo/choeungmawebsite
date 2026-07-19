import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:choeungmawebsite/main.dart';

void main() {
  testWidgets('Home page renders nav and hero copy', (WidgetTester tester) async {
    await tester.pumpWidget(const ChoeungmaApp());
    await tester.pumpAndSettle();

    expect(find.text('Choeungma'), findsWidgets);
    expect(find.textContaining('Come as you are'), findsOneWidget);
  });

  testWidgets('About page lists all six team members', (WidgetTester tester) async {
    await tester.pumpWidget(const ChoeungmaApp());
    await tester.pumpAndSettle();

    final aboutLink = find.byKey(const Key('navlink-/about'));
    await tester.tap(aboutLink);
    await tester.pumpAndSettle();

    for (final name in ['Doungke', 'Karuna', 'Hanfa', 'Person 4', 'Jasmine', 'Cleo']) {
      expect(find.text(name), findsOneWidget);
    }
  });
}
