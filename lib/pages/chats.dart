import 'package:flutter/material.dart';

import 'package:whatsapp_clone/models/chatModel.dart';
import 'package:whatsapp_clone/pages/chatScreen.dart';
import 'package:whatsapp_clone/pages/contacts.dart';

class Chats extends StatefulWidget {
  _ChatState createState()=> _ChatState();
  }

class _ChatState extends State<Chats>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        child: ListView.builder(
          itemCount: chatData.length,
          itemBuilder: (context,index)=>new Column(
            children: <Widget>[
              new Divider(height: 10.0,),
              new ListTile(
                    leading: Container(
                      margin: EdgeInsets.all(5.0),
                      child: new CircleAvatar(
                        backgroundImage: NetworkImage(chatData[index].image),
                  ),
                    ),
                  title: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        child: new Text(chatData[index].name, style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ),
                      new Container(
                        child: new Text(chatData[index].time, style: new TextStyle(color: Colors.grey, fontSize: 14.0)),
                      )
                    ],
                  ),
                  subtitle: new Text(chatData[index].mensaje, style: new TextStyle(color: Colors.grey)),
                  onTap: (){
                    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>
                      new ChatScreen(name: chatData[index].name,image:chatData[index].image,mensaje: chatData[index].mensaje,)
                    ));
                  },
                ),
            ],
          )
        )
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: new Icon(Icons.message, color: Colors.white,),
        onPressed: (){
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (context)=> new ContactsPage()
          ));
        },
      ),
    );
  }
}