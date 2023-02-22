import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'package:appacademia/settings/settings.dart';

class ExercicioSearch extends StatefulWidget {
  @override
  State createState() => _ExercicioSearch();
}

class _ExercicioSearch extends State<ExercicioSearch> {
  final List entries = [];

  Future<void> buscarExercicio() async {
    entries.clear();
    var url = 'http://$host/exercicio/listar';
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

  Future<void> deleteExercicio(int id) async {
    var url = 'http://$host/exercicio/deletar/$id';

    var r = await Requests.delete(url, port: port);
    r.raiseForStatus();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controladorNome = TextEditingController();

    String id;
    String nome;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de Exercicios'),
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
                  title: Text('${entries[index]['id']} - ${entries[index]['nome']}'),
                  subtitle: Text(
                    '''
                    Descricao: ${entries[index]['descricao']}
                    Series: ${entries[index]['series']}
                    Repeticoes: ${entries[index]['repeticoes']}
                    Equipamento: ${entries[index]['equipamento']}
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
                                'Excluir Exercicio: Id: ${entries[index]['id']} Nome: ${entries[index]['nome']}?'),
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
                                    deleteExercicio(entries[index]['id']);
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
                    Navigator.pushNamed(context, '/atualizarexercicio',
                        arguments: {
                          "id": entries[index]['id'],
                          "nome": entries[index]['nome']
                        });
                  }),
            );
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red[400],
          onPressed: buscarExercicio,
          child: const Icon(Icons.search)),
    );
    throw UnimplementedError();
  }
}
