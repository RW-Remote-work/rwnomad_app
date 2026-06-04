import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rwnomad_app/app.dart';

void main() {
  testWidgets('App shows splash page on launch', (WidgetTester tester) async {
    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('zh')],
        path: 'assets/l10n',
        fallbackLocale: const Locale('en'),
        child: const ProviderScope(
          child: RWApp(),
        ),
      ),
    );

    // Verify the app loads and shows the splash page
    expect(find.text('RWNomad'), findsOneWidget);
  });
}
