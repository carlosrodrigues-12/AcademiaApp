import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'package:appacademia/settings/settings.dart';

class FichaTreinoSearch extends StatefulWidget {
  @override
  State createState() => _FichaTreinoSearch();
}

class _FichaTreinoSearch extends State<FichaTreinoSearch> {
  final List entries = [];

  Future<void> buscarFichaTreino() async {
    entries.clear();
    var url = 'http://$host/fichatreino/listar';
    // var r = await HttpRequest.request('http://10.101.100.101:port/pessoa');
    var r = await Requests.get(url, port: port);
    // r.raiseForStatus();
    // print(r.statusCode);
    // r.status;
    final body = json.decode(r.content());

    // ignore: avoid_print
    // print(r.hasError);
    // print(body);
    for (var element in body) {
      // entries.add('${element['id']} ${element['nome']}');
      entries.add(element);
      // print(element);
    }

    setState(() {
      entries;
      // print(entries);
    });
  }

  Future<void> deleteFichaTreino(int id) async {
    var url = 'http://$host/fichatreino/deletar/$id';

    var r = await Requests.delete(url, port: port);
    r.raiseForStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta da Ficha'),
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
      body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: ListTile(
                  title: Text('Ficha: ${entries[index]['id']}'),
                  subtitle: Text(
                    '''Aluno: ${entries[index]['pessoa']}\nExercicios:
                    ${entries[index]['exercicio']}
                    '''
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 20,
                  ),
                  tileColor: const Color(0xFFF5F5F5),
                  dense: false,
                  onLongPress: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.delete,
                                color: Color.fromARGB(255, 165, 165, 165)),
                            Text(
                                'Excluir Ficha: Id: ${entries[index]['id']} Nome: ${entries[index]['pessoa']}?'),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Fechar'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // print(entries[index]['id']);
                                    deleteFichaTreino(entries[index]['id']);
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Exluir'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/atualizarfichatreino',
                        arguments: {
                          "id": entries[index]['id'],
                          "pessoa": entries[index]['pessoa']
                        });
                  }),
            );
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red[400],
          onPressed: buscarFichaTreino,
          child: const Icon(Icons.search)),
    );
    throw UnimplementedError();
  }
}
