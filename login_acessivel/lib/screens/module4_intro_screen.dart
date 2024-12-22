import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'accessibility_testing_screen.dart';

class TelaIntroducaoModulo4 extends StatelessWidget {
 const TelaIntroducaoModulo4({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Semantics(
         header: true,
         child: const Text('Workshop de Acessibilidade Flutter - Módulo 4'),
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
                 // Título principal
                 Semantics(
                   child: const Text(
                     'Exercício Prático do Módulo 4: Testando Acessibilidade com o SemanticsTester',
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
                   'Aprender a usar o SemanticsTester, uma ferramenta do Flutter para verificar '
                   'se elementos interativos estão acessíveis para leitores de tela. Neste '
                   'exercício, você testará se um botão possui uma descrição (label) adequada, '
                   'facilitando sua acessibilidade.',
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
                   'Vamos criar um teste automatizado com o SemanticsTester para verificar '
                   'se um botão apresenta uma descrição clara, garantindo que ele seja '
                   'identificado corretamente por leitores de tela, como o TalkBack e o VoiceOver.',
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
                         '1. Adicione o código ao seu projeto Flutter dentro do diretório test.',
                         style: TextStyle(fontSize: 16, height: 1.5),
                       ),
                       Text(
                         '2. Execute o teste no terminal usando o comando flutter test. O teste '
                         'verificará automaticamente se o botão possui uma descrição correta.',
                         style: TextStyle(fontSize: 16, height: 1.5),
                       ),
                       Text(
                         '3. Verifique o resultado: Se o teste passar, significa que o botão possui '
                         'um rótulo acessível. Caso contrário, o Flutter indicará onde está o problema.',
                         style: TextStyle(fontSize: 16, height: 1.5),
                       ),
                     ],
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
                   'Experimente adicionar mais botões com diferentes descrições e rótulos, e '
                   'configure novos testes usando SemanticsTester para garantir que cada botão '
                   'tenha uma descrição específica e que os leitores de tela possam identificá-los.',
                   style: TextStyle(fontSize: 16, height: 1.5),
                 ),
                 const SizedBox(height: 32),

                 // Dicas para os Testes
                 Semantics(
                   header: true,
                   child: const Text(
                     'Dicas para os Testes:',
                     style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
                 const SizedBox(height: 8),
                 Semantics(
                   container: true,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 16),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: const [
                         Text(
                           '• Use descrições claras e objetivas\n'
                           '• Evite textos genéricos como "botão" ou "clique aqui"\n'
                           '• Inclua informações sobre a ação do botão\n'
                           '• Teste com diferentes leitores de tela',
                           style: TextStyle(fontSize: 16, height: 1.5),
                         ),
                       ],
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ),
         // Botão fixo na parte inferior
         Padding(
           padding: const EdgeInsets.all(16.0),
           child: Semantics(
             sortKey: const OrdinalSortKey(9999),
             button: true,
             enabled: true,
             label: 'Ir para o exercício',
             child: Container(
               width: double.infinity,
               padding: const EdgeInsets.all(16.0),
               child: ElevatedButton(
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => const TelaTesteAcessibilidade(),
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
         ),
       ],
     ),
   );
 }
}