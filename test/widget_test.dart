import 'package:flutter_test/flutter_test.dart';

import 'package:flutterguys/main.dart';

void main() {
  testWidgets('Welcome screen renders primary content', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TaskLoopApp());

    expect(find.text('TaskLoop'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
  });
}
