import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pr15_tests/main.dart';

void main() {
  testWidgets('Title matches the template "<Group>: <Name>\'s last Flutter App"',
          (WidgetTester tester) async {
        await tester.pumpWidget(const MyApp());

        expect(find.text("ICT-32: Diana's last Flutter App"), findsOneWidget);
      });

  testWidgets('FloatingActionButton has the pets icon',
          (WidgetTester tester) async {
        await tester.pumpWidget(const MyApp());

        expect(find.byType(FloatingActionButton), findsOneWidget);
        expect(
          find.descendant(
            of: find.byType(FloatingActionButton),
            matching: find.byIcon(Icons.pets),
          ),
          findsOneWidget,
        );
      });

  testWidgets('Counter step is 6', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // початковий стан
    expect(find.text('0'), findsOneWidget);

    // перше натискання: 0 -> 6
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.text('6'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // друге натискання: 6 -> 12
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.text('12'), findsOneWidget);
  });
}