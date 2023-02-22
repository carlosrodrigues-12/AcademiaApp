import 'dart:convert';

import 'package:appacademia/modelo/Pessoa.dart';
import 'package:flutter/material.dart';
import 'package:appacademia/settings/settings.dart';
import 'package:requests/requests.dart';

class PessoaUpdate extends StatefulWidget {
  @override
  State createState() => _PessoaUpdate();
}

class _PessoaUpdate extends State<PessoaUpdate> {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorCpf = TextEditingController();
  final TextEditingController _controladorSexo = TextEditingController();
  final TextEditingController _controladorNasc = TextEditingController();
  final TextEditingController _controladorPeso = TextEditingController();
  final TextEditingController _controladorAltura = TextEditingController();
  final TextEditingController _controladorTel = TextEditingController();
  final TextEditingController _controladorObs = TextEditingController();
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorFuncao = TextEditingController();
  final TextEditingController _controladorSal = TextEditingController();
  final TextEditingController _controladorTur = TextEditingController();
  final TextEditingController _controladorTip = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var data = jsonEncode(ModalRoute.of(context)!.settings.arguments);
    var djson = jsonDecode(data);

    Future<void> atualizarPessoa(int id, Pessoa p1) async {
      print(p1);
      var url = 'http://$host/pessoa/atualizar/$id';

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
              child: Text('Atualizar Pessoa'),
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
                    decoration: const InputDecoration(labelText: 'Cpf'),
                    controller: _controladorCpf,
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
                    decoration: const InputDecoration(labelText: 'Sexo'),
                    controller: _controladorSexo,
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
                    const InputDecoration(labelText: 'Data Nascimento'),
                    controller: _controladorNasc,
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
                    decoration: const InputDecoration(labelText: 'Peso'),
                    controller: _controladorPeso,
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
                    decoration: const InputDecoration(labelText: 'Altura'),
                    controller: _controladorAltura,
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
                    decoration: const InputDecoration(labelText: 'Telefone'),
                    controller: _controladorTel,
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
                    decoration: const InputDecoration(labelText: 'Observacao'),
                    controller: _controladorObs,
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
                    decoration: const InputDecoration(labelText: 'Email'),
                    controller: _controladorEmail,
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
                    decoration: const InputDecoration(labelText: 'Funcao'),
                    controller: _controladorFuncao,
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
                    decoration: const InputDecoration(labelText: 'Salario'),
                    controller: _controladorSal,
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
                    decoration: const InputDecoration(labelText: 'Turno'),
                    controller: _controladorTur,
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
                    decoration: const InputDecoration(labelText: 'Tipo'),
                    controller: _controladorTip,
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
          final cpf = _controladorCpf.text;
          final sexo = _controladorSexo.text;
          final nascimento = _controladorNasc.text;
          final peso = int.parse(_controladorPeso.text);
          final altura = int.parse(_controladorAltura.text);
          final telefone = _controladorTel.text;
          final observacao = _controladorObs.text;
          final email = _controladorEmail.text;
          final funcao = _controladorFuncao.text;
          final salario = double.parse(_controladorSal.text);
          final turno = _controladorTur.text;
          final tipocadastro = int.parse(_controladorTip.text);
          final Pessoa p1 = Pessoa(
              nome,
              cpf,
              sexo,
              nascimento,
              peso,
              altura,
              telefone,
              observacao,
              email,
              funcao,
              salario,
              turno,
              tipocadastro);
          atualizarPessoa(djson['id'], p1);
          _controladorNome.clear();
          Navigator.pushReplacementNamed(
              context, '/consultarpessoas');
        },
      ),
    );
    throw UnimplementedError();
  }
}
