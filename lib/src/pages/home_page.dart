import 'package:flutter/material.dart';

import 'package:componentes/src/utils/icon_string_util.dart';
import 'package:componentes/src/providers/menu_providers.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
        
    return Scaffold(
      
      appBar: AppBar( 
      
        title: Text('HomePage - Componentes'),
      
      ),

      body: _lista(),
      );
  }

  _lista() {


    // print (menuProvider.opciones);
    return FutureBuilder(

      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context , AsyncSnapshot<List<dynamic>> snapshot){

        print(snapshot.data);

        return ListView(

          children: _listaItems( snapshot.data, context ),

        );  

      }

    );

   

  }

  _listaItems( List<dynamic> data, BuildContext contexto) {

    final List<Widget> opciones = [];

    data.forEach((opt){

      final widgetTemporal = ListTile(

        title: Text( opt['texto']),
        leading: getIcon(opt['icon'], Colors.blue),
        trailing: Icon(Icons.arrow_right, color: Colors.blueGrey),
        onTap: (){

          //Forna dinamica de navegacion a travez de nuestro Json
          Navigator.pushNamed(contexto, opt['ruta']);

          //Forma tradicional de navegacion
          // final ruta = MaterialPageRoute(
          //   builder: (contexto) => AlertPage()
          // );
          // Navigator.push(contexto, ruta);

        },

      );

      opciones..add(widgetTemporal)
              ..add(Divider(height: 0,));

    });

    return opciones;

  }


}