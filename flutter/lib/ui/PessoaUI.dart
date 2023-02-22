import 'package:appacademia/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:appacademia/modelo/Pessoa.dart';
import 'package:requests/requests.dart';

class PessoaUI extends StatelessWidget {
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

  Future<dynamic> cadastrar(Pessoa p1) async {
    // Intl.defaultLocale = 'pt_BR';

    // final nome = _controladorNome.text;
    // final cpf = _controladorCpf.text;
    // final sexo = _controladorSexo.text;
    // final nascimento = _controladorNasc.text;
    // final peso = int.parse(_controladorPeso.text);
    // final altura = int.parse(_controladorAltura.text);
    // final telefone = _controladorTel.text;
    // final observacao = _controladorObs.text;
    // final email = _controladorEmail.text;
    // final funcao = _controladorFuncao.text;
    // final salario = double.parse(_controladorSal.text);
    // final turno = _controladorTur.text;
    // final tipocadastro = int.parse(_controladorTip.text);

    var body = p1.toJson();
    print(body.runtimeType);

    var url = 'http://$host/pessoa/salvar';

    var response = await Requests.post(url, port: port, json: body);
    print(response.statusCode);

    _controladorNome.clear();
    _controladorCpf.clear();
    _controladorCpf.clear();
    _controladorNome.clear();
    _controladorSexo.clear();
    _controladorNasc.clear();
    _controladorPeso.clear();
    _controladorAltura.clear();
    _controladorTel.clear();
    _controladorObs.clear();
    _controladorEmail.clear();
    _controladorFuncao.clear();
    _controladorSal.clear();
    _controladorTur.clear();
    _controladorTip.clear();
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
              Navigator.pushReplacementNamed(context, '/consultarpessoas');
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
                      Text('Cadastro de Pessoas', textAlign: TextAlign.center),
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
            // Ink(
            //   decoration: const ShapeDecoration(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(8)),
            //     ),
            //   ),
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: Colors.red[400],
            //         padding: const EdgeInsets.all(16)),
            //     onPressed: () {},
            //     child: Text('Cadastrar'),
            //   ),
            // ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
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
          print(p1.toJson());
          // Navigator.pushReplacementNamed(context, '/consultarpessoas');
          cadastrar(p1);
        },
      ),
    );
  }
}
