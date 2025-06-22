import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gap_o_eat/my_app.dart'; // ✅ Make sure this matches your project structure

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // You may need to adjust this depending on your Scaffold or widgets
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
