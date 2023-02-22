import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:appacademia/settings/settings.dart';
import 'package:requests/requests.dart';
import 'package:appacademia/modelo/FichaTreino.dart';

class FichaTreinoUpdate extends StatefulWidget {
  @override
  State createState() => _FichaTreinoUpdate();
}

class _FichaTreinoUpdate extends State<FichaTreinoUpdate> {
  final TextEditingController _controladorPessoa = TextEditingController();
  final TextEditingController _controladorExerc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data = jsonEncode(ModalRoute.of(context)!.settings.arguments);
    var djson = jsonDecode(data);

    Future<void> atualizarFichaTreino(int id, FichaTreino p1) async {
      print(p1);
      var url = 'http://$host/fichatreino/atualizar/$id';

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
              child: Text('Atualizar Ficha'),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ListTile(
                title: Text('Id: ${djson['id']}'),
                subtitle: Text(
                  'Pessoa: ${djson['pessoa']}',
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
          final pessoa = int.parse(_controladorPessoa.text);
          final exercicio = int.parse(_controladorExerc.text);

          final FichaTreino p1 = FichaTreino(
              pessoa,
              exercicio);
          atualizarFichaTreino(djson['id'], p1);
          _controladorPessoa.clear();
          _controladorExerc.clear();
          Navigator.pushReplacementNamed(
              context, '/consultarfichatreino');
        },
      ),
    );
    throw UnimplementedError();
  }
}
