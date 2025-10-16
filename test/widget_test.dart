// test/widget_test.dart

import 'package:aura_music_app/main.dart';
import 'package:aura_music_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // This test group verifies that the splash screen works correctly.
  testWidgets('Splash screen test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // We are testing the main MyApp widget.
    await tester.pumpWidget(const MyApp());

    // Verify that the SplashScreen is being shown.
    expect(find.byType(SplashScreen), findsOneWidget);

    // Verify that the title 'Aura' is on the screen.
    expect(find.text('Aura'), findsOneWidget);

    // Verify that the music note icon is present.
    expect(find.byIcon(Icons.music_note), findsOneWidget);
  });
}