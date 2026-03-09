import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_menu/main.dart';

void main() {
  testWidgets('App should start', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const EMenuApp());

    // Verify that the app has a bottom navigation bar
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}
