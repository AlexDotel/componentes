import 'package:componentes/src/providers/recursos.dart';
import 'package:flutter/material.dart';
  
class CardPage extends StatelessWidget {

  final String url = 'https://images.unsplash.com/photo-1579879070056-192cc6567f05?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        
        title: 
          Text('Card Page')

      ),

      body: ListView(

        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),

        children: <Widget>[

          _cardT1(),
          SizedBox(height: 30.0),
          _cardT2(),
          SizedBox(height: 30.0),

          _cardT1(),
          SizedBox(height: 30.0),
          _cardT2(),
          SizedBox(height: 30.0)

        ],

      )
      
    );
  }

  Widget _cardT1() {

    return Card(

      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(10)

        ),

      elevation: 5,

      child: Column(children: <Widget>[

        ListTile(
          
          leading: Icon(Icons.photo_album, color: Colors.blue,),
          title: Text('Titulo Tarjeta'),
          subtitle: Text('Este es mi subtitulo mi locario, realmente voy a escribir pila de vaina para qeu tenga mas cuerpo que el titulo bro.'),
        
        ),

        Row(

          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
              
            FlatButton(onPressed: (){}, child: Text('Mas Informacion'), textColor: Colors.blueAccent),
            FlatButton(onPressed: (){}, child: Text('Paso'), textColor: Colors.blueAccent)
            
          ],
        )

      ],),
    );

  }

  Widget _cardT2() {

    final card = Container(

      child: Column(

        children: <Widget>[

          FadeInImage(

            fadeInDuration: Duration(milliseconds: 100),
            placeholder: AssetImage(Recursos().holder), 
            image:  NetworkImage(url),
            height: 300.0,
            fit: BoxFit.cover //Esto hace lo miso que el ScaleType
            
          ),

          Container(
            
            padding: EdgeInsets.all(10.0),
            child: Text('Museum Arquitectonico')

          )
        ],

      ),

    );

    return Container(

      //En este contenedor metemos la tarjeta completa, para poder recortar los bordes
      //Tambien aplicacion sombra con el boxShadow en vez de con el elevation
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: 5
          )
        ]
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card
        )
    );

  }


}