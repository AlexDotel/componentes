import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  final int radioBorde = 5;
  String _nombre = 'Nombre';
  String _email = 'Email';
  String _fecha = '';

  String seleccion = 'Volar';

  List<String> _poderes = ['Volar','Correr','Vision','Telepatia','Invisivilidad'];

  TextEditingController _controladorFecha = new TextEditingController();

  InputDecorationTheme decoracion = InputDecorationTheme(

    isDense: false,

  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Inputs')
      ),

      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: ListView(
            children: <Widget>[

              // Divider(height: 15,),
              _crearInputText(),
              Divider(height: 10,),
              _crearMail(),
              Divider(height: 10,),
              _crearPss(),
              Divider(height: 10,),
              _crearDate(context),
              Divider(height: 10,),
              _crearDropDown(),
              Divider(height: 10,),
              _crearPersona(),


          ],
          ),
        ),
      )      
    );    
  }

  Widget _crearInputText() {

    return TextField(
      
      textCapitalization: TextCapitalization.words,
        
      decoration: InputDecoration(

        labelText: _nombre,
        counter: Text('Caracteres '+_nombre.length.toString()),
        hintText: 'Escribe tu nombre',
        suffix: Icon(Icons.people),
        icon: Icon(Icons.face),
        helperText: 'Solo introducir nombre',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
        
      ),

      onChanged: (valor){
        setState(() {
          if(valor == ''){
            _nombre = "Nombre";
          }else{
            _nombre = valor;
          }
          
        });}

    );

  }

  Widget _crearMail() {

    return TextField(
      
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.words,
        
      decoration: InputDecoration(

        labelText: 'Email',
        // counter: Text('Caracteres '+_nombre.length.toString()),
        hintText: 'Escribe tu correo',
        suffix: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
        helperText: 'Solo introducir nombre',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
        
      ),

      onChanged: (valor){
        setState(() {
          if(valor == ''){
            _email = "Email";
          }else{
            _email = valor;
          }
          
        });}

    );
      
  }

  Widget _crearPss() {

    return TextField(
      
      // keyboardType: TextInputType.emailAddress,
      obscureText: true,
      textCapitalization: TextCapitalization.words,
        
      decoration: InputDecoration(

        // counter: Text('Caracteres '+_nombre.length.toString()),
        labelText: 'Password',
        hintText: 'Password',
        suffix: Icon(Icons.lock),
        icon: Icon(Icons.lock_outline),
        helperText: 'Escriba su clave',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
        
      ),

      onChanged: (valor){
        setState(() {
          if(valor == ''){
            _email = "Email";
          }else{
            _email = valor;
          }
          
        });}

    );
      
  }

  Widget _crearDate(BuildContext context) {

    return TextField(
      
      textCapitalization: TextCapitalization.words,
      enableInteractiveSelection: false,
      controller: _controladorFecha,

      decoration: InputDecoration(

        // counter: Text('Caracteres '+_nombre.length.toString()),
        labelText: 'Fecha de nacimiento',
        hintText: 'Born date',
        suffix: Icon(Icons.date_range),
        icon: Icon(Icons.calendar_today),
        helperText: 'Escriba su clave',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
        
      ),

      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);

      },

    );

  }

  _selectDate(BuildContext context) async {

    DateTime seleccionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2016),
      lastDate: DateTime(2026),
      locale: Locale('es', 'ES')
    );

    if(seleccionada != null){

      setState(() {
        _fecha = seleccionada.toString();
        _controladorFecha.text = _fecha;
      });

    }

  }

  List<DropdownMenuItem<String>> getItemsDrop(){

    List<DropdownMenuItem<String>> _lista = new List();

    _poderes.forEach( (poder){

      _lista.add(DropdownMenuItem(
        child: Text(poder), 
        value: poder,
      ));

    });

    return _lista;

  }

  Widget _crearDropDown(){

    return Row(
      
      children: <Widget>[

        Icon(Icons.playlist_add_check),

        SizedBox(width: 16.0),

        DropdownButton(
          value: seleccion,
          items: getItemsDrop(),
          onChanged: (opt){

            setState(() {
              seleccion = opt;
            });
          }  
        )

      ],

    );
    
    
    

  }

  Widget _crearPersona() {

    return ListTile(

      title: Text('Tu nombre es $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(seleccion),

    );  

  }

}