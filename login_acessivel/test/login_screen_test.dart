import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import necessário para LogicalKeyboardKey
import 'package:login_acessivel/screens/login_screen.dart';

void main() {
  testWidgets('Verifica títulos, campos de formulário, botões e ordem de foco na TelaDeLogin',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TelaDeLogin()));

    // Verifica o título da tela
    expect(
      find.text('Login'), // Atualizado para refletir o texto da tela
      findsOneWidget,
    );

    // Verifica o campo de e-mail
    expect(
      tester.getSemantics(find.bySemanticsLabel('E-mail')),
      matchesSemantics(
        label: 'E-mail',
        hint: 'Campo para inserir o e-mail do usuário',
        isTextField: true,
        isEnabled: true,
      ),
    );

    // Verifica o campo de senha
    expect(
      tester.getSemantics(find.bySemanticsLabel('Senha')),
      matchesSemantics(
        label: 'Senha',
        hint: 'Campo para inserir a senha do usuário',
        isTextField: true,
        isEnabled: true,
      ),
    );

    // Verifica o botão "Entrar"
    expect(
      tester.getSemantics(find.bySemanticsLabel('Entrar botão')),
      matchesSemantics(
        label: 'Entrar botão',
        hint: 'Ativa para fazer login no aplicativo',
        isButton: true,
        isEnabled: true,
      ),
    );

    // Verifica a ordem de foco
    final focusOrder = [
      find.bySemanticsLabel('E-mail'),
      find.bySemanticsLabel('Senha'),
      find.bySemanticsLabel('Entrar botão'),
    ];

    for (var finder in focusOrder) {
      await tester.sendKeyEvent(LogicalKeyboardKey.tab);
      await tester.pump();
      expect(finder, findsOneWidget);
      expect(tester.binding.focusManager.primaryFocus?.context?.widget, equals(tester.widget(finder)));
    }
  });
}
