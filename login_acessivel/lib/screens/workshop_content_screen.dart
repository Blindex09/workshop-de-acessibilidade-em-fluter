import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'module1_intro_screen.dart';

// Mover ModuleContent para fora da classe TelaConteudoWorkshop
class ModuleContent {
  final String title;
  final String duration;
  final List<String> topics;

  const ModuleContent({
    required this.title,
    required this.duration,
    required this.topics,
  });
}

class TelaConteudoWorkshop extends StatelessWidget {
  // Adicionar definições de estilo
  static final TextStyle kBodyTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );

  static final TextStyle kSubtitleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  const TelaConteudoWorkshop({Key? key}) : super(key: key);

  String _getModuleTitle(int number) {
    return 'Módulo $number: ${moduleContents[number]!.title}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Semantics(
          header: true,
          child: const Text('Workshop de Acessibilidade Flutter'),
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
                  _buildModuleList(),
                  const SizedBox(height: 32),
                  _buildModuleDetails(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Semantics(
              button: true,
              sortKey: const OrdinalSortKey(9999),
              label: 'Começar Workshop',
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelaIntroducaoModulo1(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text(
                  'Começar Workshop',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: moduleContents.length,
      itemBuilder: (context, index) {
        final moduleNumber = index + 1;
        final module = moduleContents[moduleNumber]!;
        
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            '$moduleNumber. ${module.title}\n${module.duration}',
            style: kBodyTextStyle,
          ),
        );
      },
    );
  }

  Widget _buildModuleDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: moduleContents.entries.map((entry) {
        final moduleNumber = entry.key;
        final module = entry.value;
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _getModuleTitle(moduleNumber),
              style: kSubtitleTextStyle,
            ),
            const SizedBox(height: 16),
            ...module.topics.map((topic) => Padding(
              padding: const EdgeInsets.only(
                left: 16,
                bottom: 8,
              ),
              child: Text(
                '• $topic',
                style: kBodyTextStyle,
              ),
            )),
            const SizedBox(height: 24),
          ],
        );
      }).toList(),
    );
  }
}

// Tornar moduleContents final
final moduleContents = {
  1: const ModuleContent(
    title: '''Introdução ao Flutter e 
acessibilidade digital''',
    duration: '30 minutos',
    topics: [
      'Introdução ao framework Flutter e\n'
      'sua importância',
      'Principais conceitos de acessibilidade em\n'
      'aplicativos mobile',
      'Impacto das WCAGs 2.2 no\n'
      'desenvolvimento mobile',
    ],
  ),
  2: const ModuleContent(
    title: '''Acessibilidade no desenvolvimento 
de UI em Flutter''',
    duration: '1 hora e 30 minutos',
    topics: [
      'Criação de widgets acessíveis',
      'Uso adequado de labels, tooltips e\n'
      'descrições',
      'Gerenciamento de foco e navegação\n'
      'por teclado',
      'Exercício prático: Ajustes de\n'
      'acessibilidade em layout',
    ],
  ),
  3: const ModuleContent(
    title: '''Acessibilidade em recursos 
de interação''',
    duration: '1 hora e 30 minutos',
    topics: [
      'Acessibilidade em gestos e\n'
      'interações personalizadas',
      'Implementação de feedback sonoro\n'
      'e tátil',
      'Considerações para acessibilidade\n'
      'em animações',
      'Exercício prático: Implementação\n'
      'de gestos acessíveis',
    ],
  ),
  4: const ModuleContent(
    title: '''Testes de acessibilidade em 
aplicativos Flutter''',
    duration: '30 minutos',
    topics: [
      'Ferramentas de teste:\n'
      'Flutter Accessibility Inspector',
      'Testes manuais com VoiceOver\n'
      'e TalkBack',
      'Integration Tests e\n'
      'Semantics Tester',
      'Integração de testes em\n'
      'pipelines de CI/CD',
    ],
  ),
};
 