import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:loopnote/main.dart';

void main() {
  Future<void> pumpWelcomeScreen(WidgetTester tester) async {
    await tester.pumpWidget(const LoopNoteApp());
    await tester.pump(const Duration(milliseconds: 3200));
    await tester.pump(const Duration(milliseconds: 500));
  }

  Future<void> tapVisible(WidgetTester tester, Finder finder) async {
    await tester.ensureVisible(finder);
    await tester.pump();
    await tester.tap(finder);
  }

  testWidgets('Welcome screen renders primary content', (
    WidgetTester tester,
  ) async {
    await pumpWelcomeScreen(tester);

    expect(find.text('Get Started'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });

  testWidgets('Get Started opens onboarding and enters home', (
    WidgetTester tester,
  ) async {
    await pumpWelcomeScreen(tester);

    await tapVisible(tester, find.text('Get Started'));
    await tester.pumpAndSettle();

    expect(find.text('Collect every idea'), findsOneWidget);

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    expect(find.text('Turn notes into tasks'), findsOneWidget);

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(find.text('Close the loop'), findsOneWidget);

    await tester.tap(find.text('Start Now'));
    await tester.pumpAndSettle();

    expect(find.text('Ready for your first loop'), findsOneWidget);
  });

  testWidgets('Sign In validates form and enters home', (
    WidgetTester tester,
  ) async {
    await pumpWelcomeScreen(tester);

    await tapVisible(tester, find.text('Sign In'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back'), findsOneWidget);

    await tapVisible(tester, find.widgetWithText(ElevatedButton, 'Sign In'));
    await tester.pump();

    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Password must be at least 6 characters'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).at(0), 'user@test.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'secret1');
    await tapVisible(tester, find.widgetWithText(ElevatedButton, 'Sign In'));
    await tester.pumpAndSettle();

    expect(find.text('Ready for your first loop'), findsOneWidget);
  });
}
