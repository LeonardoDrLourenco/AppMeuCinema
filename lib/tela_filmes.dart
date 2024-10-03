import 'package:flutter/material.dart';

class TelaFilmes extends StatelessWidget {
  final List<Map<String, String>> filmes = [
    {
      'nome': 'Joker 2',
      'imagem': 'assets/images/capa_filme1.jpg',
      'descricao': 'Após os eventos caóticos do primeiro filme, Arthur Fleck, o Coringa, encontra-se confinado no Asilo Arkham, à mercê de seus próprios demônios. Isolado do mundo e lutando contra sua dupla personalidade, ele se vê diante de um novo desafio: a psiquiatra Harleen Quinzel, que logo se torna obcecada por sua mente torturada.',
    },
    {
      'nome': 'Beetlejuice 2',
      'imagem': 'assets/images/capa_filme2.jpg',
      'descricao': 'Anos após os eventos do primeiro filme, Lydia Deetz, agora uma jovem adulta, retorna à casa assombrada de sua família em uma nova aventura macabra. Com a casa passando por reformas, Lydia se vê novamente envolvida em situações sobrenaturais e encontra o atrapalhado fantasma Beetlejuice, que está mais extravagante e caótico do que nunca.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filmes em Cartaz'),
        backgroundColor: Colors.black.withOpacity(0.9),
      ),
      body: Stack(
        children: [
          // Imagem de plano de fundo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fundo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Centralizando o conteúdo
          Center(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filmes.length,
              itemBuilder: (context, index) {
                final filme = filmes[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/compra',
                        arguments: {
                          'nome': filme['nome'],
                          'imagem': filme['imagem'],
                          'descricao': filme['descricao'],
                        },
                      );
                    },
                    child: Container(
                      width: 150,
                      child: Column(
                        children: [
                          Image.asset(
                            filme['imagem']!,
                            width: 150,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 8),
                          Text(
                            filme['nome']!,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
