import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/workshop_content_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Configura a orientação do app
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Workshop de Acessibilidade Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Esquema de cores
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
          // Aumentando contraste para melhor acessibilidade
          primary: Colors.blue.shade700,
          secondary: Colors.blue.shade600,
          error: Colors.red.shade700,
        ),

        // Habilita Material 3
        useMaterial3: true,

        // Tema dos campos de texto
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          // Estilo dos erros mais visível
          errorStyle: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          // Borda focada mais visível
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue.shade700,
              width: 2.0,
            ),
          ),
          // Borda de erro mais visível
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
        ),

        // Tema da tipografia
        textTheme: TextTheme(
          // Títulos com alto contraste
          headlineLarge: TextStyle(
            color: Colors.blue.shade900,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            height: 1.3,
          ),
          headlineMedium: TextStyle(
            color: Colors.blue.shade900,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            height: 1.3,
          ),
          headlineSmall: TextStyle(
            color: Colors.blue.shade900,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            height: 1.3,
          ),
          // Texto do corpo com bom contraste
          bodyLarge: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
            height: 1.5,
          ),
          bodyMedium: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            height: 1.5,
          ),
        ),

        // Tema dos botões
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            // Tamanho mínimo para melhor acessibilidade
            minimumSize: const Size(88, 48),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            // Estilo do texto do botão
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            // Forma dos botões
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      // Tela inicial
      home: const TelaConteudoWorkshop(),
    );
  }
}
