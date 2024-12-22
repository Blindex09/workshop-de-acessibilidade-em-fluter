import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/semantics.dart';
import 'module3_intro_screen.dart';

class NavegacaoPorTeclado extends StatefulWidget {
  const NavegacaoPorTeclado({Key? key}) : super(key: key);

  @override
  State<NavegacaoPorTeclado> createState() => _NavegacaoPorTecladoState();
}

class _NavegacaoPorTecladoState extends State<NavegacaoPorTeclado> {
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  int _currentFocusIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _focusNodes[0].requestFocus();
    for (var i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        if (_focusNodes[i].hasFocus) {
          setState(() => _currentFocusIndex = i);
        }
      });
    }
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _mostrarMensagem(String mensagem) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!).hideCurrentSnackBar();
      ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(mensagem),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
    }
    HapticFeedback.mediumImpact();
    SemanticsService.announce(mensagem, TextDirection.ltr);
  }

  void _executarAcao(int index) {
    switch (index) {
      case 0:
        _mostrarMensagem('Primeira ação executada!');
        break;
      case 1:
        _mostrarMensagem('Segunda ação executada!');
        break;
      case 2:
        _mostrarMensagem('Terceira ação executada!');
        break;
      case 3:
        HapticFeedback.mediumImpact();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TelaIntroducaoModulo3(),
          ),
        ).catchError((error) {
          _mostrarMensagem('Erro ao navegar para o próximo módulo.');
        });
        break;
    }
  }

  Widget _buildButton(int index, String text, {bool fullWidth = false, String? semanticLabel}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: _focusNodes[index].hasFocus 
            ? Border.all(color: Theme.of(context).primaryColor, width: 2)
            : null,
      ),
      child: MergeSemantics(
        child: Semantics(
          button: true,
          enabled: true,
          sortKey: index == 3 ? const OrdinalSortKey(9999) : null,
          label: semanticLabel ?? text,
          hint: 'Pressione Enter ou Espaço para ativar',
          child: ElevatedButton(
            focusNode: _focusNodes[index],
            onPressed: () {
              HapticFeedback.selectionClick();
              _executarAcao(index);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: fullWidth 
                  ? const Size(double.infinity, 48)
                  : null,
              elevation: _focusNodes[index].hasFocus ? 8 : 2,
              padding: const EdgeInsets.all(16.0),
            ).copyWith(
              overlayColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.focused)) {
                  return Theme.of(context).primaryColor.withOpacity(0.12);
                }
                return null;
              }),
            ),
            child: Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Semantics(
          header: true,
          child: const Text('Workshop de Acessibilidade Flutter - Navegação por Teclado'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildButton(
                    0, 
                    'Primeiro Botão',
                    semanticLabel: 'Executar primeira ação',
                  ),
                  const SizedBox(height: 16),
                  _buildButton(
                    1, 
                    'Segundo Botão',
                    semanticLabel: 'Executar segunda ação',
                  ),
                  const SizedBox(height: 16),
                  _buildButton(
                    2, 
                    'Terceiro Botão',
                    semanticLabel: 'Executar terceira ação',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildButton(
              3, 
              'Próximo Módulo',
              fullWidth: true,
              semanticLabel: 'Ir para a introdução do módulo 3. Gestos e Interações Acessíveis.',
            ),
          ),
        ],
      ),
    );
  }
}