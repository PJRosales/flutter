import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_app/main.dart'; // Replace with your app's main file

void main() {
  group('MyApp', () {
    testWidgets('renders AppointmentScheduler', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.byType(AppointmentScheduler), findsOneWidget);
    });
  });

  group('AppointmentScheduler', () {
    testWidgets('renders AppBar with title', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Clinic Appointment Scheduler'), findsOneWidget);
    });

    testWidgets('renders Form with 5 TextFormField', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(5));
    });

    testWidgets('renders TableCalendar', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.byType(TableCalendar), findsOneWidget);
    });

    testWidgets('renders ElevatedButton', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}