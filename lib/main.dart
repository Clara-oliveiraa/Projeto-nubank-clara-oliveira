import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Inicia o aplicativo
}

// Widget principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterClara APP NUBANCK', // Título do app
      theme: ThemeData(
        primarySwatch: Colors.purple, // Define a cor primária como roxo
      ),
      home: const NubankHomePage(), // Define a página inicial
    );
  }
}

// Tela principal simulando a interface do Nubank
class NubankHomePage extends StatelessWidget {
  const NubankHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8A05BE), // Cor roxa sólida da barra superior
        leading: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFBA4DE3), // Roxo mais claro ao redor do ícone
            shape: BoxShape.circle, // Formato circular
          ),
          child: IconButton(
            icon: const Icon(Icons.visibility_outlined, color: Color(0xFFF5F5F5)), // Ícone de visibilidade
            onPressed: () {}, // Ação vazia por enquanto
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.question_mark_rounded, color: Color(0xFFF5F5F5)), // Ícone de ajuda
            onPressed: () {}, // Ação vazia
          ),
          IconButton(
            icon: const Icon(Icons.mark_email_read_outlined, color: Color(0xFFF5F5F5)), // Ícone de email
            onPressed: () {}, // Ação vazia
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Color(0xFFF5F5F5)), // Ícone de perfil
            onPressed: () {}, // Ação vazia
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Margem de 16px em todas as direções
        child: ListView(
          children: <Widget>[
            // Seção "Conta" e saldo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaça "Conta" e a seta
              children: const [
                Text(
                  'Conta',
                  style: TextStyle(
                    fontSize: 24, // Fonte tamanho 24
                    fontWeight: FontWeight.bold, // Texto em negrito
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: Colors.black), // Seta para a direita
              ],
            ),
            const SizedBox(height: 10), // Espaço de 10px
            const Text(
              'R\$ 1000,00',
              style: TextStyle(
                fontSize: 26, // Fonte tamanho 26
                fontWeight: FontWeight.bold, // Texto em negrito
              ),
            ),
            const SizedBox(height: 30), // Espaço de 30px

            // Seção de botões horizontais (Área Pix, Pagamentos, QRCode, Transferir)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espaça os botões igualmente
              children: [
                _buildIconButton(Icons.payment, 'Área Pix'), // Botão Área Pix
                _buildIconButton(Icons.money, 'Pagamentos'), // Botão Pagamentos
                _buildIconButton(Icons.qr_code, 'QRCode'), // Botão QRCode
                _buildIconButton(Icons.attach_money, 'Transferir'), // Botão Transferir
              ],
            ),
            const SizedBox(height: 30), // Espaço de 30px

            // Divider após botões
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey,
              ),
            ),

            // Seção "Meus Cartões"
            _buildMyCardSection(),
            const SizedBox(height: 30), // Espaço de 30px

            // Seção "Guarde seu dinheiro em caixinhas"
            _buildMyNewCardSection(
              'Guarde seu dinheiro em caixinhas',
              'Acessando a área de planejamento',
            ),
            const SizedBox(height: 30), // Espaço de 30px

            // Divider após "Guarde seu dinheiro"
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey,
              ),
            ),

            // Seção de Fatura
            _buildInvoiceSection(context),
            const SizedBox(height: 30), // Espaço de 30px

            // Divider após Fatura
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey,
              ),
            ),

            // Seção de Empréstimo
            _buildLoanCardSection(),
            const SizedBox(height: 30), // Espaço de 30px

            // Divider após Empréstimo
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey,
              ),
            ),

            // Seção "Descubra Mais"
            _buildDiscoverMoreSection(context),
          ],
        ),
      ),
    );
  }

  // Widget para os botões de ícones (Área Pix, Pagamentos, QRCode, Transferir)
  static Widget _buildIconButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 60, // Largura do ícone
          height: 60, // Altura do ícone
          decoration: const BoxDecoration(
            color: Color(0xFFE8DEF8), // Fundo cinza claro
            shape: BoxShape.circle, // Formato circular
          ),
          child: IconButton(
            icon: Icon(icon, color: Colors.black), // Ícone preto
            onPressed: () {}, // Ação vazia
          ),
        ),
        const SizedBox(height: 8), // Espaço de 8px
        Text(
          label,
          style: const TextStyle(
            fontSize: 24, // Fonte tamanho 24
            fontWeight: FontWeight.bold, // Texto em negrito
          ),
        ),
      ],
    );
  }

  // Widget para a seção "Meus Cartões"
  Widget _buildMyCardSection() {
    return Container(
      padding: const EdgeInsets.all(16), // Padding interno de 16px
      decoration: BoxDecoration(
        color: const Color(0xFFE8DEF8), // Fundo cinza claro
        borderRadius: BorderRadius.circular(6), // Cantos arredondados
      ),
      child: Row(
        children: const [
          Icon(Icons.credit_card, size: 24, color: Colors.black), // Ícone de cartão de crédito
          SizedBox(width: 8), // Espaço de 8px
          Text(
            'Meus Cartões',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold, // Texto em negrito
              color: Colors.black, // Texto preto
            ),
          ),
        ],
      ),
    );
  }

  // Widget para a seção "Guarde seu dinheiro em caixinhas"
  Widget _buildMyNewCardSection(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16), // Padding interno de 16px
      decoration: BoxDecoration(
        color: const Color(0xFFE8DEF8), // Fundo cinza claro
        borderRadius: BorderRadius.circular(6), // Cantos arredondados
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinhamento à esquerda
        children: [
          Text(
            title, // Título da seção
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold, // Texto em negrito
              color: Color(0xFF8A05BE), // Cor roxa
            ),
          ),
          const SizedBox(height: 4), // Espaço de 4px
          Text(
            subtitle, // Subtítulo da seção
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold, // Texto em negrito
              color: Colors.black54.withOpacity(0.7), // Cor cinza clara
            ),
          ),
        ],
      ),
    );
  }

  // Widget para a seção de Fatura
  Widget _buildInvoiceSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300]!, width: 1), // Linha superior
          bottom: BorderSide(color: Colors.grey[300]!, width: 1), // Linha inferior
        ),
      ),
      padding: const EdgeInsets.all(16), // Padding interno de 16px
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinhamento à esquerda
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaça os elementos
            children: const [
              Text(
                'Cartão de Crédito',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 24, // Fonte tamanho 24
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.black), // Seta para a direita
            ],
          ),
          const SizedBox(height: 10), // Espaço de 10px
          const Text(
            'Fatura Fechada',
            style: TextStyle(
              fontSize: 18, // Fonte tamanho 18
              color: Colors.black54, // Cor cinza
            ),
          ),
          const SizedBox(height: 10), // Espaço de 10px
          const Text(
            'R\$ 150,00',
            style: TextStyle(
              fontSize: 24, // Fonte tamanho 24
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 15), // Espaço de 15px
          const Text(
            'Vencimento dia 15',
            style: TextStyle(
              fontSize: 18, // Fonte tamanho 18
              color: Colors.black54, // Cor cinza
            ),
          ),
          const SizedBox(height: 15), // Espaço de 15px
          ElevatedButton(
            onPressed: () {}, // Ação vazia
            child: const Text(
              'Renegociar',
              style: TextStyle(
                fontSize: 18, // Fonte tamanho 18
                color: Colors.black, // Texto preto
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE8DEF8), // Fundo cinza claro
            ),
          ),
        ],
      ),
    );
  }

  // Widget para a seção de Empréstimo
  Widget _buildLoanCardSection() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!, width: 1), // Linha inferior
        ),
        color: Colors.transparent, // Fundo transparente
      ),
      padding: const EdgeInsets.all(16), // Padding interno de 16px
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinhamento à esquerda
        children: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaça os elementos
            children: [
              Text(
                'Empréstimo',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 24, // Fonte tamanho 24
                  color: Colors.black, // Texto preto
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.black), // Seta para a direita
            ],
          ),
          SizedBox(height: 10), // Espaço de 10px
          Text(
            'Tudo certo! Você está em dia',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18, // Fonte tamanho 18
              color: Colors.black54, // Cor cinza
            ),
          ),
        ],
      ),
    );
  }

  // Widget para a seção "Descubra Mais"
  Widget _buildDiscoverMoreSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), // Cantos arredondados
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Ocupa toda a largura
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0), // Padding interno de 16px
            child: Text(
              'Descubra Mais',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 24, // Fonte tamanho 24
                color: Colors.black87, // Cor do texto
              ),
              textAlign: TextAlign.start, // Alinhamento à esquerda
            ),
          ),
          Image.asset(
            'assets/images/seguro-de-vida-imagem.png', // Caminho atualizado da imagem
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover, // Ajusta a imagem proporcionalmente
          ),
          Container(
            padding: const EdgeInsets.all(10), // Padding interno de 10px
            decoration: const BoxDecoration(
              color: Color(0xFFE8DEF8), // Fundo cinza claro
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8), // Canto inferior esquerdo arredondado
                bottomRight: Radius.circular(8), // Canto inferior direito arredondado
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Alinhamento à esquerda
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0), // Padding vertical de 5px
                  child: Text(
                    'Seguro de vida',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Texto em negrito
                      fontSize: 20, // Fonte tamanho 20
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0), // Padding vertical de 5px
                  child: Text(
                    'Cuide bem de quem você ama de um jeito simples.',
                    style: TextStyle(
                      fontSize: 18, // Fonte tamanho 18
                      color: Colors.black54, // Cor cinza
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 10.0), // Padding específico
                  child: ElevatedButton(
                    onPressed: () {}, // Ação vazia
                    child: const Text(
                      'Conhecer',
                      style: TextStyle(
                        fontSize: 18, // Fonte tamanho 18
                        color: Colors.white, // Texto branco
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, // Cor do texto
                      backgroundColor: const Color(0xFF8A05BE), // Fundo roxo
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
