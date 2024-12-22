import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:login_acessivel/screens/workshop_content_screen.dart';

void main() {
  testWidgets('Testa os botões e módulos na TelaConteudoWorkshop', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TelaConteudoWorkshop()));

    // Verifica o botão "Começar Workshop"
    expect(
      tester.getSemantics(find.bySemanticsLabel('Começar Workshop')),
      matchesSemantics(
        label: 'Começar Workshop',
        isButton: true,
        isEnabled: true,
      ),
    );

    // Verifica a exibição de um módulo
    expect(find.textContaining('Introdução ao Flutter e'), findsOneWidget);
  });
}
