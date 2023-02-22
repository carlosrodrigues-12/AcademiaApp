import 'package:appacademia/modelo/FichaTreino.dart';
import 'package:appacademia/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:requests/requests.dart';

class FichaTreinoUI extends StatelessWidget {
  final TextEditingController _controladorPessoa = TextEditingController();
  final TextEditingController _controladorExerc = TextEditingController();

  Future<dynamic> cadastrar(FichaTreino p1) async {

    var body = p1.toJson();
    print(body.runtimeType);

    var url = 'http://$host/fichatreino/salvar';

    var response = await Requests.post(url, port: port, json: body);
    print(response.statusCode);

    _controladorPessoa.clear();
    _controladorExerc.clear();
  }

  @override
  Widget build(BuildContext context) {
    final _formNome = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Text(
            'Academia',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        // title: const Text('Cadastro de Pessoas'),
        backgroundColor: Colors.red[400],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            tooltip: 'Home',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ), //IconButton
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Consultar',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/consultarfichatreino');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: 'Configurar Host',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/settings');
            },
          ), //IconButton
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => null,
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Container(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child:
                  Text('Cadastro da Ficha', textAlign: TextAlign.center),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Container(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Pessoa'),
                    controller: _controladorPessoa,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Container(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(labelText: 'Exercicio'),
                    controller: _controladorExerc,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.red[400],
        onPressed: () {
          // processar os dados
          final pessoa = int.parse(_controladorPessoa.text);
          final exercicio = int.parse(_controladorExerc.text);
          final FichaTreino p1 = FichaTreino(pessoa,exercicio);
          print(p1.toJson());
          // Navigator.pushReplacementNamed(context, '/consultarpessoas');
          cadastrar(p1);
        },
      ),
    );
  }
}
