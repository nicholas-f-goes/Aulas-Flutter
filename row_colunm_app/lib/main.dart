import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - Row e column',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Row e column'),
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

  double _size = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Exemplo - Row e column'),),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.purple,
              width: 100,
              height: 100,
              child: FlutterLogo(size: _size,),
            ),
            Container(
              color: Colors.blue,
              width: 100,
              height: 100,
              child: FlutterLogo(size: _size,),
            ),
            Container(
              color: Colors.red,
              width: 100,
              height: 100,
              child: FlutterLogo(size: _size,),
            )

          ],

        )

    );
  }

}


