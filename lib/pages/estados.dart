import 'package:flutter/material.dart';

import 'package:whatsapp_clone/models/chatModel.dart';

/** 
 * un Listview no puede estar dentro de un column porque aparentemente todo
 * se va al carajo
 * RECUERDA: los ListView tambien son como las Columns, tienen children donde se pueden meter lo que sea
*/

class Estados extends StatelessWidget {
   final String _nombre ='erick';
   
   Widget _estados(ChatModel usuario,String time){
     return ListTile(
       leading: new CircleAvatar(
         backgroundImage: NetworkImage(usuario.image),
       ),
       title: new Text(usuario.name, style: new TextStyle(fontWeight: FontWeight.bold),),
       subtitle: new Text(time, style: new TextStyle(color: Colors.grey),),
     );
   }

   /*_buildStateList(){// esta funcion seria, para agregar varias
     return chatData.map((user)=> _estados(user)).toList();
   }*/

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new ListView(
          children: <Widget>[
            new Container(
              child: ListTile(
                leading: new CircleAvatar(
                    child: new Text(_nombre[0].toUpperCase()),
                ),
                title: new Text('Mi estado',style: new TextStyle(fontWeight: FontWeight.bold),),
                subtitle: new Text('Añadir un nuevo estado', style: new TextStyle(color: Colors.grey),),
              ) ,
            ),
            new Container(
              margin: const EdgeInsets.only(left: 10.0),
              alignment: Alignment.centerLeft,
              decoration: new BoxDecoration(
                color: Colors.grey[100]
              ),
              width: 1000,
              height: 25,
              child: new Text('Recientes', style: new TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold,fontSize: 15.0)),
            ),
            _estados(chatData[0],'Hace 8 Minutos'),
            new Divider(),
            _estados(chatData[3],'Hoy 9:27'),
            new Divider(),
            _estados(chatData[2],'Ayer 13:34'),
            new Divider(),
          ],
        ),
    );
  }
}


/*child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.all(12.0),
              child: new Row(
                children: <Widget>[
                  ///new Padding(padding: const EdgeInsets.all(8.0),),
                  new CircleAvatar(
                    child: new Text(_nombre[0].toUpperCase()),
                  ),
                  new Padding(padding: const EdgeInsets.all(8.0),),
                  new Column(
                    children: <Widget>[
                      new Container(
                        child: new Text('Añadir una nueva actualizacion',style: new TextStyle(color: Colors.grey),),
                      ),
                    ],
                  )
                ],
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(left: 10.0),
              alignment: Alignment.centerLeft,
              decoration: new BoxDecoration(
                color: Colors.grey[100]
              ),
              width: 1000,
              height: 25,
              child: new Text('Recientes', style: new TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold,fontSize: 15.0)),
            ),
            new ListView(children: _buildStateList()),
          ],
        ),*/
