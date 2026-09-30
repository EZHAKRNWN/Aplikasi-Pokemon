import 'package:flutter_test/flutter_test.dart';
import 'package:kuis_si_d/main.dart';

void main() {
  testWidgets('Pokemon App loads LoginPage properly', (WidgetTester tester) async {
    await tester.pumpWidget(const PokemonApp());

    // Verify LoginPage elements exist
    expect(find.text('Pokemon App'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
  });
}
