import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:login_acessivel/screens/accessible_gestures_screen.dart';

void main() {
  testWidgets('Testa acessibilidade do botão com gestos na TelaComGestos', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TelaComGestos()));

    // Verifica o botão de gestos
    expect(
      tester.getSemantics(find.bySemanticsLabel('Botão com gestos')),
      matchesSemantics(
        label: 'Botão com gestos',
        hint: 'Toque duas vezes ou pressione e segure para ativar',
        isButton: true,
        isEnabled: true,
      ),
    );
  });
}
