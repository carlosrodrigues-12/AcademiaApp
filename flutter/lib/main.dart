import 'package:appacademia/ui/ExercicioSearch.dart';
import 'package:appacademia/ui/ExercicioUpdate.dart';
import 'package:appacademia/ui/FichaTreinoSearch.dart';
import 'package:appacademia/ui/FichaTreinoUI.dart';
import 'package:appacademia/ui/FichaTreinoUpdate.dart';
import 'package:appacademia/ui/Home.dart';
import 'package:appacademia/ui/PessoaSearch.dart';
import 'package:appacademia/ui/Settings.dart';
import 'package:appacademia/ui/PessoaUpdate.dart';
import 'package:flutter/material.dart';
import 'package:appacademia/ui/PessoaUI.dart';
import 'package:appacademia/ui/ExercicioUI.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cadastro de Pessoas',
        color: Colors.red[400],
        initialRoute: '/home',
        routes: {
          '/home': (context) => Home(),
          '/cadastrarpessoas': (context) => PessoaUI(),
          '/consultarpessoas': (context) => PessoaSearch(),
          '/settings': (context) => Settings(),
          '/atualizarpessoa': (context) => PessoaUpdate(),
          '/cadastrarexercicio': (context) => ExercicioUI(),
          '/consultarexercicios': (context) => ExercicioSearch(),
          '/atualizarexercicio': (context) => ExercicioUpdate(),
          '/cadastrarfichatreino': (context) => FichaTreinoUI(),
          '/consultarfichatreino': (context) => FichaTreinoSearch(),
          '/atualizarfichatreino': (context) => FichaTreinoUpdate(),
        }
        // home: ProdutoUI(),
        );
  }
}
