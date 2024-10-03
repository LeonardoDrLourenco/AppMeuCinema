import 'package:flutter/material.dart';
import 'tela_login.dart';
import 'tela_filmes.dart';
import 'tela_compra_ingresso.dart';
import 'tela_historico_compras.dart';

void main() {
  runApp(AppCinema());
}

class AppCinema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Cinema',
      theme: ThemeData.dark(), // Define o tema escuro para toda a aplicação
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => TelaLogin(),
        '/filmes': (context) => TelaFilmes(),
        '/compra': (context) => TelaCompraIngresso(),
        '/historico': (context) => TelaHistoricoCompras(),
      },
    );
  }
}
