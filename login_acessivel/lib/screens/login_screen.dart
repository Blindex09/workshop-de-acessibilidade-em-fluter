import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'module2_intro_screen.dart';

class TelaDeLogin extends StatefulWidget {
  const TelaDeLogin({Key? key}) : super(key: key);

  @override
  State<TelaDeLogin> createState() => _TelaDeLoginState();
}

class _TelaDeLoginState extends State<TelaDeLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _senhaFocusNode = FocusNode();
  final _esqueceuSenhaButtonFocusNode = FocusNode();
  final _entrarButtonFocusNode = FocusNode();
  final _proximoModuloButtonFocusNode = FocusNode();
  final _mostrarSenhaFocusNode = FocusNode();

  bool _mostrarSenha = false;
  bool _emailPreenchido = false;
  bool _senhaPreenchida = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_verificarEmail);
    _senhaController.addListener(_verificarSenha);
    _emailFocusNode.addListener(_handleFocusChange);
    _senhaFocusNode.addListener(_handleFocusChange);
    _esqueceuSenhaButtonFocusNode.addListener(_handleFocusChange);
    _entrarButtonFocusNode.addListener(_handleFocusChange);
    _proximoModuloButtonFocusNode.addListener(_handleFocusChange);
    _mostrarSenhaFocusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {});
  }

  void _verificarEmail() {
    setState(() {
      _emailPreenchido = _emailController.text.isNotEmpty;
    });
  }

  void _verificarSenha() {
    setState(() {
      _senhaPreenchida = _senhaController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    _emailFocusNode.dispose();
    _senhaFocusNode.dispose();
    _esqueceuSenhaButtonFocusNode.dispose();
    _entrarButtonFocusNode.dispose();
    _proximoModuloButtonFocusNode.dispose();
    _mostrarSenhaFocusNode.dispose();
    super.dispose();
  }

  void _fazerLogin() {
    if (_formKey.currentState!.validate()) {
      HapticFeedback.mediumImpact();
      SemanticsService.announce(
        'Processando login...',
        TextDirection.ltr,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Processando login...'),
          behavior: SnackBarBehavior.floating,
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TelaIntroducaoModulo2(),
        ),
      );
    } else {
      HapticFeedback.vibrate();
      SemanticsService.announce(
        'Formulário contém erros. Por favor, verifique os campos.',
        TextDirection.ltr,
      );
    }
  }

  Widget _buildAccessibleButton({
    required String text,
    required VoidCallback onPressed,
    required FocusNode focusNode,
    required String semanticLabel,
    String? semanticHint,
    bool isTextButton = false,
    bool fullWidth = false,
  }) {
    final ButtonStyle baseStyle = isTextButton 
        ? TextButton.styleFrom()
        : ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          );

    final button = isTextButton
        ? TextButton(
            focusNode: focusNode,
            onPressed: () {
              HapticFeedback.selectionClick();
              onPressed();
            },
            style: baseStyle.copyWith(
              overlayColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.focused)) {
                  return Theme.of(context).primaryColor.withOpacity(0.12);
                }
                return null;
              }),
            ),
            child: Text(
              text,
              style: const TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          )
        : ElevatedButton(
            focusNode: focusNode,
            onPressed: () {
              HapticFeedback.mediumImpact();
              onPressed();
            },
            style: baseStyle.copyWith(
              elevation: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.focused)) {
                  return 8;
                }
                return 2;
              }),
            ),
            child: Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
          );

    return Semantics(
      button: true,
      enabled: true,
      label: semanticLabel,
      hint: semanticHint ?? 'Pressione Enter ou Espaço para ativar',
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
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    required Icon prefixIcon,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        filled: isPassword ? _senhaPreenchida : _emailPreenchido,
        fillColor: (isPassword ? _senhaPreenchida : _emailPreenchido)
            ? Colors.green.withOpacity(0.1)
            : null,
        suffixIcon: isPassword ? _buildMostrarSenhaButton() : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
      ),
      obscureText: isPassword && !_mostrarSenha,
      keyboardType: isPassword ? null : TextInputType.emailAddress,
      autofillHints: [
        isPassword ? AutofillHints.password : AutofillHints.email
      ],
      validator: validator,
      onChanged: (_) {
        HapticFeedback.selectionClick();
      },
    );
  }

  Widget _buildMostrarSenhaButton() {
    return IconButton(
      focusNode: _mostrarSenhaFocusNode,
      icon: Icon(
        _mostrarSenha ? Icons.visibility_off : Icons.visibility,
      ),
      onPressed: () {
        HapticFeedback.selectionClick();
        _toggleMostrarSenha();
      },
      tooltip: _mostrarSenha ? 'Ocultar senha' : 'Mostrar senha',
    );
  }

  void _toggleMostrarSenha() {
    setState(() {
      _mostrarSenha = !_mostrarSenha;
    });
    HapticFeedback.selectionClick();
    SemanticsService.announce(
      _mostrarSenha ? 'Senha visível' : 'Senha oculta',
      TextDirection.ltr,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de Login'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              Icon(
                Icons.account_circle,
                size: 80,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 32),
              _buildTextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                label: 'E-mail',
                hint: 'Insira seu e-mail',
                prefixIcon: const Icon(Icons.email),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail.';
                  }
                  if (!value.contains('@')) {
                    return 'Por favor, insira um e-mail válido.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildTextFormField(
                controller: _senhaController,
                focusNode: _senhaFocusNode,
                label: 'Senha',
                hint: 'Insira sua senha',
                prefixIcon: const Icon(Icons.lock),
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha.';
                  }
                  if (value.length < 8) {
                    return 'A senha deve ter pelo menos 8 caracteres.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 12),
                child: Text(
                  'A senha deve conter pelo menos 8 caracteres.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildAccessibleButton(
                text: 'Esqueci minha senha',
                onPressed: () {
                  HapticFeedback.selectionClick();
                  SemanticsService.announce(
                    'Abrindo tela de recuperação de senha',
                    TextDirection.ltr,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Funcionalidade de recuperação de senha será implementada.'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                focusNode: _esqueceuSenhaButtonFocusNode,
                semanticLabel: 'Esqueci minha senha',
                semanticHint: 'Abre a tela de recuperação de senha',
                isTextButton: true,
              ),
              const SizedBox(height: 32),
              _buildAccessibleButton(
                text: 'Entrar',
                onPressed: _fazerLogin,
                focusNode: _entrarButtonFocusNode,
                semanticLabel: 'Entrar',
                semanticHint: 'Pressione para fazer login',
                fullWidth: true,
              ),
              const SizedBox(height: 16),
              _buildAccessibleButton(
                text: 'Próximo Módulo',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelaIntroducaoModulo2(),
                    ),
                  );
                },
                focusNode: _proximoModuloButtonFocusNode,
                semanticLabel: 'Ir para a introdução do módulo 2',
                semanticHint: 'Navega para o próximo módulo do workshop',
                fullWidth: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}