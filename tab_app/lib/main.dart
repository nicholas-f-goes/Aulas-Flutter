import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - Flare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
    return MaterialApp(
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_walk)),
                  Tab(icon: Icon(Icons.directions_run)),
                  Tab(icon: Icon(Icons.directions_walk)),
                ],
              ),
              title: Text('Exemplo de Tab'),
            ),
            body: TabBarView(
              children: [
                new Container(
                    width: 300,
                    height: 300,
                  child: new Image.asset('assets/1img.jpg')
                ),

                new Container(
                    width: 300,
                    height: 300,
                    child: new Image.asset('assets/2img.jpg')
                ),

                new Container(
                    width: 300,
                    height: 300,
                    child: new Image.asset('assets/3img.jpg')
                ),
            ],
            )

            ),
          ),
        );

  }

}
