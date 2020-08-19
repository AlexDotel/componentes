import 'package:componentes/src/providers/recursos.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override

  String url = "https://cdna.artstation.com/p/assets/images/images/014/585/978/large/renan-moraes-arthur-shelby.jpg?1544590448";
  double _valorSlider = 100.0;

  bool _lockCheck = false;

  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title: Text('Slider'),
        centerTitle: true,
        elevation: 10,        

      ),

      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            _crearTitulo(),
            _crearCheckBox(),
            _crearSwitch(),
            _crearSlider(),
            Expanded(child: _crearImagen()),

          ]
        ),

      )
      
    );
  }

  Widget _crearSlider(){

    return Slider(
      value: _valorSlider, 
      min: 10.0,
      max: 350.0,
      // activeColor: Colors.blue,
      // inactiveColor: Colors.red,
      // divisions: 50,
      // label: _valorSlider.toInt().toString()+"%",
      onChanged: (_lockCheck) ? null : ( porcentaje ){

        setState(() {
          _valorSlider = porcentaje;
        });

      }
    );

  }

  Widget _crearCheckBox(){

    // return Checkbox(
    //   value: _lockCheck,
    //   onChanged: (valor){
    //     setState(() {
    //       _lockCheck = valor;         
    //     });
    //   },
    // );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CheckboxListTile(
        
        subtitle: Text('Al activarlo no podra cambiar el tamaño'),
        title: Text('Bloquear Slider'),
        value: _lockCheck,
        onChanged: (valor){
          setState(() {
            _lockCheck = valor;         
          });
        },

      ),
    );
    

  }


  Widget _crearSwitch(){

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SwitchListTile(
        
        subtitle: Text('Al activarlo no podra cambiar el tamaño'),
        title: Text('Bloquear Slider'),
        value: _lockCheck,
        onChanged: (valor){
          setState(() {
            _lockCheck = valor;         
          });
        },

      ),
    );

  }


  Widget _crearImagen() {

    return FadeInImage(

      placeholder: AssetImage(Recursos().holder),
      image: NetworkImage(url),
      width: _valorSlider,
      fit: BoxFit.contain,

    );

  }

  Widget _crearTitulo() {

    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Text('Arthur Shelby', 
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
    );
  }

}