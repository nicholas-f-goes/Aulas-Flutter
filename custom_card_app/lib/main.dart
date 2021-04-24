import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - FlipCard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter - Flipcard'),
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

  GlobalKey<FlipCardState> _cardKey = GlobalKey<FlipCardState>();

  _renderBackground() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
    );
  }
  _renderCard(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 0, right: 0, top: 155.0, bottom: 155.0),
      color: Colors.white,
      child: FlipCard(
        key: _cardKey,
        flipOnTouch: true,
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status){
          print('status $status');
        },
        front: _frontCard(),
        back: _backCard(),
      ),
    );
  }

  _frontCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),

      child:  Stack(
        children: [
          Container(
            margin: new EdgeInsets.only(left:110.0,top: 100.0,right:30.0,bottom:0.0),
            width: 30,
            height: 30,
            child:  Image.asset('assets/nfc.png'),
          ),
          Container(
            margin: new EdgeInsets.only(left:30.0,top: 80.0,right:30.0,bottom:0.0),
            width: 70,
            height: 70,
            child:  Image.asset('assets/chip.png'),
          ),
          Container(
            margin: new EdgeInsets.only(left:10.0,top: 140.0,right:30.0,bottom:0.0),
            width: 200,
            height: 200,
            child:  Image.asset('assets/nubank.png'),
          ),
          Container(
            margin: new EdgeInsets.only(left:270.0,top: 10.0,right: 0.0,bottom:0.0),
            width: 125,
            height: 125,
            child:  Image.asset('assets/mastercard.png'),
          ),


        ],

          
      ),
    );
  }
  _backCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: Stack(
            children: <Widget>[
              Container(
                margin: new EdgeInsets.symmetric(vertical: 50.0),
                width: 500,
                height: 80,
                color: Colors.black45,
              ),
            ],
          ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _renderBackground(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _renderCard(context),)
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _cardKey.currentState.toggleCard();
        },
        tooltip: 'Test Flip_card',
        child: Icon(Icons.add),
      ),
    );
  }
}
