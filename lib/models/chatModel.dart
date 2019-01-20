class ChatModel{
  final String name;
  final String time;
  final String image;
  final String estado;
  String mensaje;

  ChatModel({this.name,this.mensaje,this.image,this.time,this.estado});
}

List<ChatModel> chatData = [
  new ChatModel(
    name: 'Tony Stark',
    mensaje: 'Vengadores Reunance :v',
    image: 'https://media.metrolatam.com/2018/04/27/tony-22a0dc7bbb49357d1bc0e03352066f0b-1200x600.jpg',
    time: '10:00',
    estado: 'Solo Mark 42'
  ),
  new ChatModel(
    name: 'Steve Rogers',
    mensaje: 'Tienes mi escudo?',
    image: 'https://media.comicbook.com/2017/11/steve-rogers-1060339-1280x0.jpg',
    time: '12:14',
    estado: 'Dios y patria'
  ),
  new ChatModel(
    name: 'Natasha romannoff',
    mensaje: 'Sabes porque me dicen la viuda negra? 3:)',
    image: 'https://www.bolsamania.com/cine/wp-content/uploads/2016/06/4-3.jpg',
    time: '03:00',
    estado: 'El sol se oculta grandulon :v'
  ),
  new ChatModel(
    name: 'Thor',
    mensaje: 'Tengo el escudo del cap!',
    image: 'http://static.t13.cl/images/sizes/1200x675/1491844542-thor.jpg',
    time: '12:15',
    estado: 'Loki estuvo aqui'
  ),
  new ChatModel(
    name: 'DeadPool',
    mensaje: 'Unos revolcones o te mareas?',
    image: 'https://www.cinepremiere.com.mx/wp-content/uploads/2018/05/mejor-y-peor-deadpool-2.jpg',
    time: '21:00',
    estado: 'I\'m never gonna dance again'
  ),
];