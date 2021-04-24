
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import 'model/aluno.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário - Aluno',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Formulário - Aluno'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _media;
  String _nome;
  String _sobrenome;

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _surnameController = new TextEditingController();
  TextEditingController _nota1Controller = new TextEditingController();
  TextEditingController _nota2Controller = new TextEditingController();


  _rowName(BuildContext context) {
    return new TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.name,
      decoration: new InputDecoration(
        hintText: "Digite seu nome",
      ),
    );
  }

  _rowSurname(BuildContext context) {
    return new TextFormField(
      controller: _surnameController,
      keyboardType: TextInputType.name,
      decoration: new InputDecoration(
        hintText: "Digite seu sobrenome",
      ),
    );
  }

  _rowNota1(BuildContext context) {
    return new TextFormField(
      controller: _nota1Controller,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
        hintText: "Digite a nota 1",
      ),
    );
  }

  _rowNota2(BuildContext context) {
    return new TextFormField(
      controller: _nota2Controller,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
        hintText: "Digite a nota 2",
      ),
    );
  }

  _rowButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        _register(context);
        _resetFields();
      },
      label: Text('Calcular média aritmetica'),
      icon: Icon(Icons.add),
    );
  }


  _formUI(BuildContext context) {
    return Column(
      children: [
        _rowName(context),
        _rowSurname(context),
        _rowNota1(context),
        _rowNota2(context),
        _rowButton(context),
      ],
    );
  }

  _rowForm(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: _formUI(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/fundo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: FlareActor(
                'assets/WorldSpin.flr',
                fit: BoxFit.contain,
                animation: 'roll',
              ),
              width: 250,
              height: 250,
            ),
            _rowForm(context),
          ],
        ),
      ),
    );
  }

  _register(BuildContext context) {
    print('validate ${_formKey.currentState.validate()}');

    if (_formKey.currentState.validate()) {
      final aluno = Aluno(
        _nameController.text,
        _surnameController.text,
        double.tryParse(_nota1Controller.text),
        double.tryParse(_nota2Controller.text),
      );
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${aluno.toString()}'),
            backgroundColor: Colors.blue,
            elevation: 100.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            behavior: SnackBarBehavior.fixed,
            duration: Duration(seconds: 15),
          ));
      setState(() {
        _media = aluno.mediaAritmetica();
      });
    } else {
      print('Erro!');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Digite os campos corretamente!',)));
    }
  }
    _resetFields() => _formKey.currentState.reset();
  }


