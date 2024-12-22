import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_acessivel/screens/accessibility_testing_screen.dart';

void main() {
  testWidgets('Testa acessibilidade dos botões', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: TelaTesteAcessibilidade(),
    ));

    // Testa o primeiro botão
    expect(
      tester.getSemantics(find.byType(ElevatedButton)),
      matchesSemantics(
        label: 'Botão de exemplo',
        hint: 'Demonstração de botão com descrição semântica para testes',
        isButton: true,
        isEnabled: true,
      ),
    );

    // Testa o segundo botão
    expect(
      tester.getSemantics(find.byType(OutlinedButton).first),
      matchesSemantics(
        label: 'Botão de ação',
        hint: 'Este botão demonstra uma ação com descrição personalizada',
        isButton: true,
        isEnabled: true,
      ),
    );
  });
}
