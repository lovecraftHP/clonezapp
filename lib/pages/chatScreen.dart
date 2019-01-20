import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String image;
  final String mensaje;

  ChatScreen({this.name,this.image,this.mensaje});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{
  final TextEditingController _textController= TextEditingController();
  final String _nombre = 'Erick';
  final List <ChatResponse> _mensajes=[];//esta seria una lista de ese tipo de widget
  bool _isTyped = false;

  Widget _buildText(){
    return new Row(
      children: <Widget>[
        new Flexible(
          child: Container(
            margin: const EdgeInsets.only(left: 5.0),
            child: new TextField(
              controller: _textController,
              onChanged: (value){
                //asi de facil le decimos, si lo que escribimos es mayor que 0
                //pasara a ser True de lo contrario sigue en false
                setState(() {
                    _isTyped = value.length >0;
                                });
              },
              decoration: new InputDecoration.collapsed(
                hintText: 'Escribe algo...'
              ),
            ),
          ),
        ),
        new IconButton(
          icon: Icon(Icons.send),
          // si esta en true, llama la funcion , sino no puede mandar nada
          onPressed: ()=> _isTyped?_onSubmit(_textController.text):null,
          color: Theme.of(context).accentColor,
        )
      ],
    );
  }

  void _onSubmit(String value){
    //creamos o llamamos el widget creado
    ChatResponse _mensaje = new ChatResponse(
      name: _nombre,
      mensaje: value,
      animation: new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 500)
      )
    );
    setState(() {
          _mensajes.insert(0,_mensaje);//insert, lo agrega pero deacuerdo a una posicion
          _textController.clear();
          _isTyped = false;
        });
    _mensaje.animation.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text(widget.name)),
      body: Container(
        child: new Column(
          children: <Widget>[
            //este widget mostrara cada uno de los mensajes que yo envie
            /**
             * la unica forma de que un ListView entre en un column sin problema
             * es que se envuelva en algo, como en este caso un flaxible
             */
            
            new Flexible(
              child: new ListView.builder(
                itemCount: _mensajes.length,
                itemBuilder: (_, index)=> _mensajes[index],
                reverse: true,
              ),
            ),
            new Divider(height: 1.0,),
            new Container(
              child: _buildText(),
            )
          ],
        ),
      ),
    );
  }
}

class ChatResponse extends StatelessWidget {
  final String name;
  final AnimationController animation;
  final String mensaje;

  ChatResponse({this.name,this.mensaje,this.animation});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      //esto da un tipo de animacion, en el que los mensajes se mostraran en una transicion
      //necesita la propiedad sizefactor
      sizeFactor: new CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut//como los colores
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 5.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 5.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Text('Yo',style: new TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),
                    ),
                    new Container(
                      child: new Text(mensaje),
                    )
                  ],
                ),
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: new CircleAvatar(
                child: new Text(name[0]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
