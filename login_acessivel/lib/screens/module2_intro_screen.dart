import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'keyboard_navigation_screen.dart';

class TelaIntroducaoModulo2 extends StatelessWidget {
 const TelaIntroducaoModulo2({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Semantics(
         header: true,
         child: const Text('Workshop de Acessibilidade Flutter - Módulo 2'),
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
                     'Exercício Prático do Módulo 2: Navegação por Teclado em Aplicativos Flutter',
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
                   'Configurar a navegação por teclado para um conjunto de botões em uma '
                   'interface Flutter, assegurando que todos os botões possam receber o '
                   'foco do teclado e sejam acessíveis de maneira sequencial ao '
                   'pressionar a tecla Tab.',
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
                   'Neste exercício, você criará três botões que serão acessíveis pelo '
                   'teclado, permitindo que o usuário navegue entre eles usando Tab e '
                   'realize ações com Enter ou Espaço. A interface será configurada para '
                   'respeitar a sequência de navegação definida.',
                   style: TextStyle(fontSize: 16, height: 1.5),
                 ),
                 const SizedBox(height: 32),

                 // Explicação do Código
                 Semantics(
                   header: true,
                   child: const Text(
                     'Explicação do Código:',
                     style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
                 const SizedBox(height: 8),
                 Semantics(
                   container: true,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: const [
                       Text(
                         'FocusNode: Cada botão é associado a um FocusNode, que permite controlar '
                         'o foco de teclado. Isso garante que, ao navegar usando Tab, o foco '
                         'passe corretamente para o próximo botão.',
                         style: TextStyle(fontSize: 16, height: 1.5),
                       ),
                       SizedBox(height: 8),
                       Text(
                         'dispose(): No método dispose, liberamos os FocusNodes quando a tela '
                         'não é mais usada, evitando problemas de memória.',
                         style: TextStyle(fontSize: 16, height: 1.5),
                       ),
                       SizedBox(height: 8),
                       Text(
                         'Focus: Cada botão é envolto em um widget Focus com seu respectivo '
                         'FocusNode. Isso configura o foco para o botão e permite que ele '
                         'responda a eventos de teclado.',
                         style: TextStyle(fontSize: 16, height: 1.5),
                       ),
                       SizedBox(height: 8),
                       Text(
                         'ElevatedButton: Configura cada botão com uma ação que exibe uma '
                         'mensagem ao ser pressionado, confirmando que o botão foi ativado '
                         'com sucesso.',
                         style: TextStyle(fontSize: 16, height: 1.5),
                       ),
                     ],
                   ),
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
                         '2. Conecte um teclado ao seu dispositivo (ou use o teclado do próprio '
                         'dispositivo se estiver em um emulador).',
                         style: TextStyle(fontSize: 16, height: 1.5),
                       ),
                       Text(
                         '3. Navegue entre os botões usando a tecla Tab. Cada botão deve '
                         'receber o foco conforme você navega pela interface.',
                         style: TextStyle(fontSize: 16, height: 1.5),
                       ),
                       Text(
                         '4. Pressione Enter ou Espaço para ativar cada botão e verifique se '
                         'a mensagem correspondente é exibida.',
                         style: TextStyle(fontSize: 16, height: 1.5),
                       ),
                       Text(
                         '5. Desafie-se trocando a ordem dos FocusNodes para customizar a '
                         'sequência de navegação.',
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
                   'Adicione mais botões ou outros elementos interativos (como campos de texto) '
                   'e ajuste a sequência de foco para verificar se eles seguem a navegação '
                   'desejada.',
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
             label: 'Ir para o exercício do módulo 2. Navegação por Teclado em Aplicativos Flutter.',
             child: Container(
               width: double.infinity,
               padding: const EdgeInsets.all(16.0),
               child: ElevatedButton(
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => const NavegacaoPorTeclado(),
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