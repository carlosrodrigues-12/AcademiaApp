import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:appacademia/settings/settings.dart';
import 'package:requests/requests.dart';
import 'package:appacademia/modelo/Exercicio.dart';

class ExercicioUpdate extends StatefulWidget {
  @override
  State createState() => _ExercicioUpdate();
}

class _ExercicioUpdate extends State<ExercicioUpdate> {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorDesc = TextEditingController();
  final TextEditingController _controladorSeries = TextEditingController();
  final TextEditingController _controladorRept = TextEditingController();
  final TextEditingController _controladorEqp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data = jsonEncode(ModalRoute.of(context)!.settings.arguments);
    var djson = jsonDecode(data);

    Future<void> atualizarExercicio(int id, Exercicio p1) async {
      print(p1);
      var url = 'http://$host/exercicio/atualizar/$id';

      var body = p1.toJson();

      var response = await Requests.put(url, port: port, json: body);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Academia'),
        backgroundColor: Colors.red[400],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            tooltip: 'Home',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ), //IconButton
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Text('Atualizar Exercicio'),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ListTile(
                title: Text('Id: ${djson['id']}'),
                subtitle: Text(
                  'Nome: ${djson['nome']}',
                ),
                trailing: const Icon(
                  Icons.update,
                  color: Color(0xFF303030),
                  size: 20,
                ),
                tileColor: const Color(0xFFF5F5F5),
                dense: false,
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
                    decoration: const InputDecoration(labelText: 'Series'),
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
                    const InputDecoration(labelText: 'Repeticoes'),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.update),
        backgroundColor: Colors.red[400],
        onPressed: () {
          // processar os dados
          final nome = _controladorNome.text;
          final descricao = _controladorDesc.text;
          final series = int.parse(_controladorSeries.text);
          final repeticoes = int.parse(_controladorRept.text);
          final equipamento = _controladorEqp.text;

          final Exercicio p1 = Exercicio(
              nome,
              descricao,
              series,
              repeticoes,
              equipamento);
          atualizarExercicio(djson['id'], p1);
          _controladorNome.clear();
          Navigator.pushReplacementNamed(
              context, '/consultarexercicios');
        },
      ),
    );
    throw UnimplementedError();
  }
}
