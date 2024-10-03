import 'package:flutter/material.dart';

class TelaCompraIngresso extends StatefulWidget {
  @override
  _TelaCompraIngressoState createState() => _TelaCompraIngressoState();
}

class _TelaCompraIngressoState extends State<TelaCompraIngresso> {
  final _nomeController = TextEditingController();
  final _precoController = TextEditingController();
  final _dataController = TextEditingController();
  final _horarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String?>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Compra de Ingresso'),
        backgroundColor: Colors.black.withOpacity(0.9),
      ),
      body: Stack(
        children: [
          // Imagem de fundo (opcional)
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fundo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Conteúdo centralizado
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Exibir imagem do filme
                  Image.asset(
                    args['imagem']!,
                    width: 150, // Ajuste a largura para ser menor
                    height: 250, // Ajuste a altura para ser maior
                    fit: BoxFit.cover, // Faz a imagem cobrir o espaço
                  ),
                  SizedBox(height: 8),
                  Text(
                    args['nome']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Caixa de texto rolável para a descrição do filme
                  Container(
                    width: 300, // Defina a largura da caixa de texto
                    padding: const EdgeInsets.all(8.0), // Adiciona espaçamento interno
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7), // Fundo da caixa
                      borderRadius: BorderRadius.circular(8.0), // Bordas arredondadas
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        args['descricao']!,
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 30), // Aumentado o espaçamento antes dos campos de entrada
                  // Coluna para campos de entrada
                  _buildTextField(_nomeController, 'Nome', width: 250),
                  SizedBox(height: 20),
                  _buildTextField(_precoController, 'Preço', keyboardType: TextInputType.number, width: 250),
                  SizedBox(height: 20),
                  _buildTextField(_dataController, 'Data', width: 250),
                  SizedBox(height: 20),
                  _buildTextField(_horarioController, 'Horário', width: 250),
                  SizedBox(height: 20),
                  // Botão de comprar
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        // Simulação de envio de dados (POST)
                        Navigator.pushReplacementNamed(context, '/historico');
                      },
                      child: Text('Comprar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {TextInputType? keyboardType, double? width}) {
    return SizedBox(
      width: width, // Recebe a largura como parâmetro
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
          labelStyle: TextStyle(color: Colors.black),
          contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0), // Ajuste o preenchimento para menor altura
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
