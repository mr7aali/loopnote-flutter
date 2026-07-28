import 'package:flutter_test/flutter_test.dart';

import 'package:loopnote/main.dart';

void main() {
  testWidgets('Welcome screen renders primary content', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const LoopNoteApp());

    await tester.pump(const Duration(milliseconds: 3200));
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Get Started'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });
}
