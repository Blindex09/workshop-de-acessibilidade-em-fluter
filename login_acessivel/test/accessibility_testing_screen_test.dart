import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:login_acessivel/screens/accessibility_testing_screen.dart';

void main() {
  testWidgets('Testa acessibilidade dos botões na TelaTesteAcessibilidade', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TelaTesteAcessibilidade()));

    // Verifica o botão "Ação principal"
    expect(
      tester.getSemantics(find.bySemanticsLabel('Ação principal')),
      matchesSemantics(
        label: 'Ação principal',
        hint: 'Ativa a funcionalidade principal',
        isButton: true,
        isEnabled: true,
      ),
    );

    // Verifica o botão "Ação secundária"
    expect(
      tester.getSemantics(find.bySemanticsLabel('Ação secundária')),
      matchesSemantics(
        label: 'Ação secundária',
        hint: 'Ativa a funcionalidade secundária',
        isButton: true,
        isEnabled: true,
      ),
    );
  });
}
