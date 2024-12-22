import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/semantics.dart';
import 'module4_intro_screen.dart';

class TelaComGestos extends StatefulWidget {
  const TelaComGestos({Key? key}) : super(key: key);
  
  @override
  State<TelaComGestos> createState() => _TelaComGestosState();
}

class _TelaComGestosState extends State<TelaComGestos> {
  bool _isLongPressed = false;
  DateTime? _lastTapTime;
  final FocusNode _gestureAreaFocusNode = FocusNode();
  final FocusNode _nextModuleFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _gestureAreaFocusNode.addListener(_handleFocusChange);
    _nextModuleFocusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _gestureAreaFocusNode.dispose();
    _nextModuleFocusNode.dispose();
    super.dispose();
  }

  void _executarAcaoDoubleTap() {
    HapticFeedback.mediumImpact();
    SemanticsService.announce(
      'Duplo toque executado',
      TextDirection.ltr,
    );
  }

  void _executarAcaoLongPress() {
    HapticFeedback.heavyImpact();
    setState(() => _isLongPressed = true);
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        content: const Text('Toque longo executado'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() => _isLongPressed = false);
            },
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  void _handleTap() {
    HapticFeedback.selectionClick();
    final now = DateTime.now();
    if (_lastTapTime != null && 
        now.difference(_lastTapTime!) < const Duration(milliseconds: 300)) {
      _executarAcaoDoubleTap();
    } else {
      SemanticsService.announce(
        'Área de gestos tocada uma vez',
        TextDirection.ltr,
      );
    }
    _lastTapTime = now;
  }

  Widget _buildAccessibleGestureArea() {
    return Container(
      width: 200,
      height: 200,
      child: GestureDetector(
        onTap: _handleTap,
        onDoubleTap: _executarAcaoDoubleTap,
        onLongPress: _executarAcaoLongPress,
        child: Focus(
          focusNode: _gestureAreaFocusNode,
          onKey: (node, event) {
            if (event is RawKeyDownEvent) {
              if (event.logicalKey == LogicalKeyboardKey.space) {
                _handleTap();
                return KeyEventResult.handled;
              } else if (event.logicalKey == LogicalKeyboardKey.enter) {
                _executarAcaoDoubleTap();
                return KeyEventResult.handled;
              } else if (event.logicalKey == LogicalKeyboardKey.keyL) {
                _executarAcaoLongPress();
                return KeyEventResult.handled;
              }
            }
            return KeyEventResult.ignored;
          },
          child: Container(
            decoration: BoxDecoration(
              color: _isLongPressed ? Colors.blue.shade700 : Colors.blue,
              borderRadius: BorderRadius.circular(8.0),
              border: _gestureAreaFocusNode.hasFocus
                  ? Border.all(color: Colors.white, width: 2)
                  : null,
            ),
            child: Semantics(
              button: true,
              enabled: true,
              label: 'Área de gestos interativa',
              hint: _gestureAreaFocusNode.hasFocus
                  ? 'Pressione Espaço para toque simples, Enter para duplo toque, ou L para toque longo'
                  : 'Toque uma vez, duas vezes ou pressione e segure para diferentes ações',
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Área de Gestos',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Toque ou use teclado',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccessibleButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Semantics(
        button: true,
        enabled: true,
        sortKey: const OrdinalSortKey(9999),
        label: 'Ir para o Próximo módulo',
        hint: 'Navega para a tela de testes de acessibilidade',
        child: ElevatedButton(
          focusNode: _nextModuleFocusNode,
          onPressed: () {
            HapticFeedback.mediumImpact();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TelaIntroducaoModulo4(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            elevation: _nextModuleFocusNode.hasFocus ? 8 : 2,
          ),
          child: const Text(
            'Próximo Módulo',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workshop de Acessibilidade Flutter - Gestos Acessíveis'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: _buildAccessibleGestureArea(),
              ),
            ),
            _buildAccessibleButton(),
          ],
        ),
      ),
    );
  }
}