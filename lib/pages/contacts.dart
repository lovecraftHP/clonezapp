import 'package:flutter/material.dart';

import 'package:whatsapp_clone/models/chatModel.dart';

class ContactsPage extends StatelessWidget {

  List<Widget> _miselaneus(){
    return [
      new ListTile(
        leading: new Icon(Icons.person),
        title: new Text('Nuevo contacto', style: new TextStyle(fontWeight: FontWeight.bold),),
      ),
      new ListTile(
        leading: new Icon(Icons.people),
        title: new Text('Nuevo grupo',style: new TextStyle(fontWeight: FontWeight.bold)),
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Contactos'),),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Tiles(icono: new Icon(Icons.people),text: 'Nuevo grupo',),
            new Tiles(icono: new Icon(Icons.person),text: 'Nuevo contacto',),
            new Divider(height: 1.0,),
            new Flexible(
              child: new ListView.builder(
                itemCount: chatData.length,
                itemBuilder: (_,i)=> new ListTile(
                  leading: new CircleAvatar(
                    backgroundImage: NetworkImage(chatData[i].image),
                  ),
                  title: new Text(chatData[i].name,style: new TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: new Text(chatData[i].estado, style: new TextStyle(color: Colors.grey)),
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}

class Tiles extends StatelessWidget {
  final String text;
  final Icon icono;

  Tiles({this.text,this.icono});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:5.0,horizontal: 8.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(8.0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Theme.of(context).accentColor
            ),
            child: new GestureDetector(
              onTap: (){},
              child: new IconButton(
                icon: icono,
                color: Colors.white,
                onPressed: (){},
              ),
            ),
          ),
          new Text(text, style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),)
        ],
      ),
    );
  }
}