import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:esercitazione_17/main.dart';

void main() {
  testWidgets('App mostra il catalogo anime', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Catalogo Anime'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
