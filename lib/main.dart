import 'package:flutter/material.dart';


import 'pages/camera.dart';
import 'pages/chats.dart';
import 'pages/llamadas.dart';
import 'pages/estados.dart';
import 'pages/contacts.dart';

void main()=>runApp(new MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.blueAccent,
    accentColor: Colors.orange
  ),
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  _MyAppState createState()=> _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin{
  TabController _controller;

  @override
    void initState() {
      super.initState();
      _controller = new TabController(
        length: 4,
        vsync: this,
        initialIndex: 1
      );
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('CloneZapp'),
        bottom: new TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: <Widget>[
            new Icon(Icons.camera_alt,color: Theme.of(context).accentColor ),
            new Text('CHATS', style:new TextStyle(color: Colors.white)),
            new Text('ESTADOS', style:new TextStyle(color: Colors.white)),
            new Text('LLAMADAS', style:new TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: Container(
        child: new TabBarView(
          controller: _controller,
          children: <Widget>[
            new Camera(),
            new Chats(),
            new Estados(),
            new Llamadas()
          ],
        ),
      ),
    );
  }
}