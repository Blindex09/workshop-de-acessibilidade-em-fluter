import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'login_screen.dart';

class TelaIntroducaoModulo1 extends StatelessWidget {
  const TelaIntroducaoModulo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Semantics(
          header: true,
          child: const Text('Workshop de Acessibilidade Flutter - Módulo 1'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Semantics(
                    child: const Text(
                      'Exercício Prático do Módulo 1: Interface Acessível com Textos e Botões',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Objetivo
                  Semantics(
                    child: const Text(
                      'Objetivo:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Criar uma tela de login acessível que funcione corretamente com '
                    'leitores de tela, permitindo que pessoas com deficiência visual '
                    'possam navegar pelos elementos com clareza e facilidade.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 32),

                  // Descrição
                  Semantics(
                    header: true,
                    child: const Text(
                      'Descrição:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Nesta atividade, vamos construir uma tela de login com dois campos '
                    'de texto (um para o e-mail e outro para a senha) e dois botões: '
                    '"Login" e "Recuperar Senha". A acessibilidade será garantida por '
                    'meio de descrições adequadas nos widgets, que serão anunciadas por '
                    'tecnologias assistivas, como o VoiceOver no iOS e o TalkBack no Android.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 32),

                  // Como Realizar o Exercício
                  Semantics(
                    header: true,
                    child: const Text(
                      'Como Realizar o Exercício:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Semantics(
                    container: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '1. Adicione o código ao seu projeto Flutter e rode a aplicação.',
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                        Text(
                          '2. Ative um leitor de tela no dispositivo (VoiceOver para iOS ou TalkBack para Android).',
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                        Text(
                          '3. Navegue pelos elementos da tela usando o leitor de tela e verifique '
                          'se cada um é identificado e descrito corretamente.',
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                        Text(
                          '4. Verifique as descrições de cada elemento:',
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                  Semantics(
                    container: true,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '• O campo de e-mail deve ser identificado como "Campo de e-mail" '
                            'com a dica "Insira seu e-mail"\n'
                            '• O campo de senha deve ser identificado como "Campo de senha" '
                            'com a dica "Insira sua senha"\n'
                            '• O botão de login deve ser identificado como "Botão de login" '
                            'com a dica "Toque para fazer login"\n'
                            '• O botão de recuperação de senha deve ser identificado como '
                            '"Botão de recuperação de senha" com a dica "Toque para recuperar a senha"',
                            style: TextStyle(fontSize: 16, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Desafio Extra
                  Semantics(
                    header: true,
                    child: const Text(
                      'Desafio Extra:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Crie um terceiro botão de "Criar Conta" com rótulos e dicas apropriados '
                    'e adicione-o à tela. Teste novamente com o leitor de tela para garantir '
                    'que todos os elementos são anunciados corretamente.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ),
          ),
          // Botão fixo na parte inferior
          Semantics(
            sortKey: const OrdinalSortKey(9999),
            button: true,
            enabled: true,
            label: 'Ir para o exercício de login acessível.',
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelaDeLogin(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text(
                  'Ir para o Exercício',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}