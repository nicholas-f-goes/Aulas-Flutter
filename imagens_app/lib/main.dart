import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - Imagens',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Imagens'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemplo - Imagens'),),
      body: Column(
        children: [
          Image.asset('images/Tst.jpg',),
          Text('IOS e Android'),
          Image.network('https://img.ibxk.com.br/2018/04/09/09143244644188.jpg?w=1120&h=420&mode=crop&scale=both'),
          Text('IOS e Android')
        ],

          )

      );
  }

}

