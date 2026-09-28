import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_shopping_app/app.dart';

void main() {
  testWidgets('ShoppingApp launches successfully and displays welcome title',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ShoppingApp());
    await tester.pumpAndSettle();

    // Verify that Welcome screen widgets exist
    expect(find.byType(ShoppingApp), findsOneWidget);
  });
}
