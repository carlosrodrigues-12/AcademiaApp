import 'package:flutter/material.dart';
import 'package:appacademia/settings/settings.dart';

class Settings extends StatefulWidget {
  @override
  State createState() => _Settings();
}

class _Settings extends State<Settings> {
  final TextEditingController _controladorHost = TextEditingController();
  final TextEditingController _controladorPort = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings - App'),
        backgroundColor: Colors.red[400],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            tooltip: 'Home',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ), //IconButton
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(labelText: 'Host'),
                controller: _controladorHost,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: const InputDecoration(labelText: 'Port'),
                controller: _controladorPort,
              ),
            ),
            Row(
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                      padding: const EdgeInsets.all(16)
                      // primary: Colors.red, // background
                      // onPrimary: Colors.white, // foreground
                      ),
                  onPressed: () {
                    host = _controladorHost.text;
                    port = int.tryParse(_controladorPort.text)!;
                    _controladorHost.clear();
                    _controladorPort.clear();
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: const Text('Cadastrar'),
                ),
              ],
            )
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
