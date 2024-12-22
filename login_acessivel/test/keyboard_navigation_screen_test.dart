import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:login_acessivel/screens/keyboard_navigation_screen.dart';

void main() {
  testWidgets('Testa navegação por teclado na NavegacaoPorTeclado', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: NavegacaoPorTeclado()));

    // Verifica o primeiro botão
    expect(
      tester.getSemantics(find.bySemanticsLabel('Primeiro Botão')),
      matchesSemantics(
        label: 'Primeiro Botão',
        isButton: true,
        isEnabled: true,
      ),
    );

    // Simula a navegação para o próximo botão
    FocusNode focusNode = FocusNode();
    tester.testTextInput.receiveAction(TextInputAction.next);
    expect(focusNode.hasFocus, isTrue);
  });
}
