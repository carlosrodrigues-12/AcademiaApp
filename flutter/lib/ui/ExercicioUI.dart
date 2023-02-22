import 'package:appacademia/modelo/Exercicio.dart';
import 'package:appacademia/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:requests/requests.dart';

class ExercicioUI extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorDesc = TextEditingController();
  final TextEditingController _controladorSeries = TextEditingController();
  final TextEditingController _controladorRept = TextEditingController();
  final TextEditingController _controladorEqp = TextEditingController();

  Future<dynamic> cadastrar(Exercicio p1) async {

    var body = p1.toJson();
    print(body.runtimeType);

    var url = 'http://$host/exercicio/salvar';

    var response = await Requests.post(url, port: port, json: body);
    print(response.statusCode);

    _controladorNome.clear();
    _controladorDesc.clear();
    _controladorSeries.clear();
    _controladorNome.clear();
    _controladorRept.clear();
    _controladorEqp.clear();
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
              Navigator.pushReplacementNamed(context, '/consultarexercicios');
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
                  Text('Cadastro de Exercicios', textAlign: TextAlign.center),
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
                    decoration: const InputDecoration(labelText: 'Nome'),
                    controller: _controladorNome,
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
                    decoration: const InputDecoration(labelText: 'Descrição'),
                    controller: _controladorDesc,
                    keyboardType: TextInputType.number,
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
                    decoration: const InputDecoration(labelText: 'Séries'),
                    controller: _controladorSeries,
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
                    decoration:
                    const InputDecoration(labelText: 'Repetições'),
                    controller: _controladorRept,
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
                    decoration: const InputDecoration(labelText: 'Equipamento'),
                    controller: _controladorEqp,
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
          final nome = _controladorNome.text;
          final descricao = _controladorDesc.text;
          final series = int.parse(_controladorSeries.text);
          final repeticoes = int.parse(_controladorRept.text);
          final equipamento = _controladorEqp.text;
          final Exercicio p1 = Exercicio(nome,descricao, series, repeticoes, equipamento);
          print(p1.toJson());
          // Navigator.pushReplacementNamed(context, '/consultarpessoas');
          cadastrar(p1);
        },
      ),
    );
  }
}
