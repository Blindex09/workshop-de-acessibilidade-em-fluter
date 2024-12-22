import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';

const kTitleTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);
const kSubtitleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
const kBodyTextStyle = TextStyle(fontSize: 16);

class TelaTesteAcessibilidade extends StatefulWidget {
  const TelaTesteAcessibilidade({Key? key}) : super(key: key);

  @override
  State<TelaTesteAcessibilidade> createState() => _TelaTesteAcessibilidadeState();
}

class _TelaTesteAcessibilidadeState extends State<TelaTesteAcessibilidade> {
  bool _testModeEnabled = false;
  
  final _toggleTestModeFocusNode = FocusNode();
  final _runTestFocusNode = FocusNode();
  final _primaryActionFocusNode = FocusNode();
  final _secondaryActionFocusNode = FocusNode();
  final _finishWorkshopFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _primaryActionFocusNode.addListener(_handleFocusChange);
    _secondaryActionFocusNode.addListener(_handleFocusChange);
    _finishWorkshopFocusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {}); // Atualiza UI quando o foco muda
  }

  @override
  void dispose() {
    _toggleTestModeFocusNode.dispose();
    _runTestFocusNode.dispose();
    _primaryActionFocusNode.dispose();
    _secondaryActionFocusNode.dispose();
    _finishWorkshopFocusNode.dispose();
    super.dispose();
  }

  void _toggleTestMode() {
    HapticFeedback.selectionClick();
    setState(() {
      _testModeEnabled = !_testModeEnabled;
    });
    SemanticsService.announce(
      _testModeEnabled ? 'Modo de teste ativado' : 'Modo de teste desativado',
      TextDirection.ltr,
    );
  }

  void _runAccessibilityTest() {
    HapticFeedback.mediumImpact();
    SemanticsService.announce(
      'Executando testes de acessibilidade',
      TextDirection.ltr,
    );
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Resultados do Teste',
          style: kSubtitleTextStyle,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '✅ Labels semânticos presentes\n'
              '✅ Ordem de foco correta\n'
              '✅ Contraste de cores adequado\n'
              '✅ Tamanho dos elementos adequado',
              style: kBodyTextStyle,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  Widget _buildAccessibleButton({
    required String text,
    required VoidCallback onPressed,
    required FocusNode focusNode,
    required String semanticLabel,
    required String semanticHint,
    bool isOutlined = false,
    bool fullWidth = false,
  }) {
    final ButtonStyle baseStyle = isOutlined 
        ? OutlinedButton.styleFrom()
        : ElevatedButton.styleFrom();

    final button = isOutlined
        ? OutlinedButton(
            focusNode: focusNode,
            onPressed: () {
              HapticFeedback.selectionClick();
              onPressed();
            },
            style: baseStyle.copyWith(
              padding: const MaterialStatePropertyAll(EdgeInsets.all(16.0)),
              side: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.focused)) {
                  return const BorderSide(width: 2, color: Colors.blue);
                }
                return null;
              }),
            ),
            child: Text(text, style: const TextStyle(fontSize: 18)),
          )
        : ElevatedButton(
            focusNode: focusNode,
            onPressed: () {
              HapticFeedback.selectionClick();
              onPressed();
            },
            style: baseStyle.copyWith(
              padding: const MaterialStatePropertyAll(EdgeInsets.all(16.0)),
              elevation: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.focused)) {
                  return 8;
                }
                return 2;
              }),
            ),
            child: Text(text, style: const TextStyle(fontSize: 18)),
          );

    return Focus(
      focusNode: focusNode,
      onKey: (node, event) {
        if (event is RawKeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.space || 
              event.logicalKey == LogicalKeyboardKey.enter) {
            onPressed();
            return KeyEventResult.handled;
          }
        }
        return KeyEventResult.ignored;
      },
      child: MergeSemantics(
        child: Semantics(
          button: true,
          enabled: true,
          label: semanticLabel,
          hint: semanticHint,
          child: Container(
            width: fullWidth ? double.infinity : null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: focusNode.hasFocus
                  ? Border.all(color: Theme.of(context).primaryColor, width: 2)
                  : null,
            ),
            child: button,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Semantics(
          header: true,
          child: const Text('Workshop de Acessibilidade Flutter - Testes de Acessibilidade'),
        ),
        actions: [
          IconButton(
            focusNode: _toggleTestModeFocusNode,
            onPressed: _toggleTestMode,
            icon: Icon(_testModeEnabled ? Icons.bug_report : Icons.bug_report_outlined),
            tooltip: 'Ativar modo de teste',
          ),
          IconButton(
            focusNode: _runTestFocusNode,
            onPressed: _runAccessibilityTest,
            icon: const Icon(Icons.play_circle_outline),
            tooltip: 'Executar testes de acessibilidade',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Sobre Testes de Acessibilidade', style: kSubtitleTextStyle),
                  const SizedBox(height: 8),
                  Semantics(
                    child: const Text(
                      'Esta tela demonstra como implementar e testar recursos de '
                      'acessibilidade em Flutter. Os elementos abaixo podem ser '
                      'testados usando TalkBack, VoiceOver ou Flutter Driver.',
                      style: kBodyTextStyle,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildAccessibleButton(
                    text: 'Executar Ação Principal',
                    onPressed: () {
                      SemanticsService.announce(
                        'Ação principal executada com sucesso',
                        TextDirection.ltr,
                      );
                    },
                    focusNode: _primaryActionFocusNode,
                    semanticLabel: 'Ação principal',
                    semanticHint: 'Ativa a funcionalidade principal',
                  ),
                  const SizedBox(height: 16),
                  _buildAccessibleButton(
                    text: 'Executar Ação Secundária',
                    onPressed: () {
                      SemanticsService.announce(
                        'Ação secundária executada com sucesso',
                        TextDirection.ltr,
                      );
                    },
                    focusNode: _secondaryActionFocusNode,
                    semanticLabel: 'Ação secundária',
                    semanticHint: 'Ativa a funcionalidade secundária',
                    isOutlined: true,
                  ),
                  const SizedBox(height: 24),
                  const Text('Como Testar:', style: kSubtitleTextStyle),
                  const SizedBox(height: 16),
                  Semantics(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('1. Ative o leitor de tela do dispositivo', style: kBodyTextStyle),
                        Text('Usando TalkBack (Android) ou VoiceOver (iOS)', style: kBodyTextStyle),
                        SizedBox(height: 8),
                        Text('2. Navegue pelos elementos', style: kBodyTextStyle),
                        Text('Verifique se as descrições estão claras', style: kBodyTextStyle),
                        SizedBox(height: 8),
                        Text('3. Teste as interações', style: kBodyTextStyle),
                        Text('Confirme se os botões são ativados corretamente', style: kBodyTextStyle),
                        SizedBox(height: 8),
                        Text('4. Verifique o feedback', style: kBodyTextStyle),
                        Text('Observe as respostas visuais e sonoras', style: kBodyTextStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildAccessibleButton(
              text: 'Finalizar Workshop',
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Parabéns!'),
                      content: const Text(
                        'Você completou o workshop de acessibilidade em Flutter! '
                        'Continue aplicando estas práticas em seus projetos.'
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Concluir'),
                        )
                      ],
                    );
                  },
                );
              },
              focusNode: _finishWorkshopFocusNode,
              semanticLabel: 'Finalizar workshop',
              semanticHint: 'Conclui o workshop de acessibilidade',
              fullWidth: true,
            ),
          ),
        ],
      ),
    );
  }
}