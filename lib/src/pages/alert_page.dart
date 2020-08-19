import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( 
        title: Text('Alert Page')
      ),


    body: Center(
      child: RaisedButton(
        child: Text('Mostrar Alerta'),
        color: Colors.blue,
        textColor: Colors.white,
        shape: StadiumBorder(),
        onPressed: () => _mostrarAlerta(context),
        )   
    ,),


      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: (){
          Navigator.pop(context);
        }      
      ),

    );
  }


  void _mostrarAlerta(BuildContext context){

    showDialog(
  
      context: context,
      barrierDismissible: true, //Cierra el dialogo al dar clic fuera
      builder: (context){       //Se encarga de retornar el dialogo construido

        return AlertDialog(

          contentPadding: EdgeInsets.all(30),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),

          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min, //Es como un wrap Content
            children: <Widget>[
              Text('Este es el contenido de la caja de la alerta'),
              FlutterLogo(size: 100,)
            ],
          ),

          actions: <Widget>[

            FlatButton(
              onPressed: () => Navigator.of(context).pop(), //Cerrar Alerta
              child: Text('Aceptar')
            ),
            
            FlatButton(
              onPressed: (){Navigator.of(context).pop();},
              child: Text('Cancelar'),
            )

          ],
        );

      }
    );

  }
}