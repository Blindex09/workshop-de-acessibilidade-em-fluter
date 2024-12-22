import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'accessible_gestures_screen.dart';

class TelaIntroducaoModulo3 extends StatelessWidget {
 const TelaIntroducaoModulo3({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Semantics(
         header: true,
         child: const Text('Workshop de Acessibilidade Flutter - Módulo 3'),
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
                     'Exercício Prático do Módulo 3: Gestos e Interações Acessíveis',
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
                   'Criar um botão que responde a diferentes gestos, como toques duplos '
                   'e longos, e que possui descrições de acessibilidade para cada tipo '
                   'de interação. Isso permitirá que usuários de tecnologias assistivas '
                   'compreendam as opções disponíveis e interajam de forma mais eficiente.',
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
                   'Neste exercício, você vai criar um botão que responde a dois tipos de '
                   'gestos: toque duplo e toque longo. Cada interação desencadeia uma '
                   'ação diferente e é acompanhada de uma descrição apropriada para '
                   'leitores de tela.',
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
                         '1. Adicione o código ao seu projeto Flutter e execute a aplicação.',
                         style: TextStyle(fontSize: 16, height: 1.5),
                       ),
                       Text(
                         '2. Ative um leitor de tela no seu dispositivo (VoiceOver para iOS '
                         'ou TalkBack para Android).',
                         style: TextStyle(fontSize: 16, height: 1.5),
                       ),
                       Text(
                         '3. Navegue até o botão e ouça as instruções:',
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
                           '• O leitor de tela deve anunciar o botão como "Botão interativo".\n'
                           '• A dica "Toque duas vezes para confirmar ou mantenha pressionado '
                           'para mais opções" deve ser ouvida.',
                           style: TextStyle(fontSize: 16, height: 1.5),
                         ),
                       ],
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
                         '4. Testar os gestos:',
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
                           '• Dê um toque duplo no botão e verifique se a mensagem '
                           '"Ação de toque duplo executada!" é exibida.\n'
                           '• Pressione e segure o botão para acionar o gesto de toque '
                           'longo e verifique se a mensagem "Ação de toque longo executada!" '
                           'é exibida.',
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
                   'Adicione um terceiro gesto, como onTap, para uma ação de toque único. '
                   'Esse novo gesto deve ter uma descrição e ação específicas para '
                   'acessibilidade.',
                   style: TextStyle(fontSize: 16, height: 1.5),
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
             label: 'Ir para o exercício do módulo 3. Gestos e Interações Acessíveis.',
             child: Container(
               width: double.infinity,
               padding: const EdgeInsets.all(16.0),
               child: ElevatedButton(
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => const TelaComGestos(),
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