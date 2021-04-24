
import 'package:flutter/material.dart';

import 'model/number.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - Formulário',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter - Formulário'),
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

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _number1Controller = new TextEditingController();
  TextEditingController _number2Controller = new TextEditingController();

  double _soma;
  double _sub;
  double _div;
  double _mult;

  _rowButton(BuildContext context) {
    return TextButton.icon(
      onPressed: (){
        _register(context);
        _resetFields();
      },
      label: Text('Cadastrar'),
      icon: Icon(Icons.add),
    );
  }

  _rowNumber1(BuildContext context) {
    return new TextFormField(
      controller: _number1Controller,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
        hintText: "Digite um numero",
      ),
    );

  }

  _rowNumber2(BuildContext context) {
    return new TextFormField(
      controller: _number2Controller,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
        hintText: "Digite um numero",
      ),
    );

  }


  _formUI(BuildContext context) {
    return Column(
      children: [

        _rowNumber1(context),
        _rowNumber2(context),
        _rowButton(context),
        _rowResults(),
      ],
    );
  }

  _rowForm(BuildContext context) {
    return Form(
      key: _formKey ,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: _formUI(context),
    );
  }

  _rowResults(){
    return Row(
      children: [
        Text('Soma é -> $_soma\nSubtração é -> $_sub\nMultiplicação é -> $_mult\nDivisão é -> $_div', style: TextStyle(fontSize: 20.0),),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _rowForm(context),

          ],
        ),
      ),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  _register(BuildContext context) {
    print('validate ${_formKey.currentState.validate()}');

  if(_formKey.currentState.validate()) {

    final number = Number(
        double.tryParse(_number1Controller.text),
        double.tryParse(_number2Controller.text)
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('resultado: ${number.toString()}'))
    );

    setState(() {
      _soma = number.somar();
      _sub = number.subtrair();
      _div = number.dividir();
      _mult = number.multiplicar();
    });
  } else {
    print(' Digite os campos Corretamente :-/');

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Digite os Campos Corretamente', ),)
    );
  }
  }

  _resetFields() => _formKey.currentState.reset();

}

