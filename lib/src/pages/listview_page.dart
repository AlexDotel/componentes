import 'dart:async';

import 'package:componentes/src/providers/recursos.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController controlador = new ScrollController();
  List<int> _listaNumeros;
  int _ultimoItem = 0;

  bool cargando = false;

  @override
  void initState() {
    super.initState();

    _listaNumeros = List();
    _agregar10();

    controlador.addListener(() {
      if (controlador.position.pixels == controlador.position.maxScrollExtent) {
        // _agregar10();

        _pedirData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controlador.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Listas')),
        body: Stack(
          children: <Widget>[_crearLista(), _crearLoading()],
        ));
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: actualizar,
      child: ListView.builder(
          controller: controlador,
          itemCount: _listaNumeros.length,
          itemBuilder: (BuildContext context, int index) {
            final imagen = _listaNumeros[index];

            return Column(
              children: <Widget>[
                FadeInImage(
                  placeholder: AssetImage(Recursos().holderBottle),
                  image: NetworkImage(
                      'https://i.picsum.photos/id/$imagen/500/300.jpg'),
                ),
                Container(
                  child: Text(
                    'Imagen $imagen',
                    style: TextStyle(),
                  ),
                  padding: EdgeInsets.all(10),
                )
              ],
            );
          }),
    );
  }

  Future<Null> actualizar() async {
    // "hola"

    //Metodo para actualizar la lista

    //Establecemos la duracion del refresh
    final duracion = new Duration(seconds: 2);
    new Timer(duracion, () {
      _listaNumeros.clear(); //Limpiamos la lista
      _ultimoItem++; //Hacemos que inice despues de el ultimo item
      _agregar10(); //Agregamos 10 imagenes completamente nuevas
    });

    return Future.delayed(duracion);
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);

      setState(() {});
    }
  }

  Future<Null> _pedirData() async {
    cargando = true;
    setState(() {});

    final duracion = new Duration(seconds: 2);
    return new Timer(duracion, respuestaHTTP);
  }

  void respuestaHTTP() {
    cargando = false;
    _agregar10();
    controlador.animateTo(controlador.position.pixels + 250,
        duration: new Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
  }

  Widget _crearLoading() {
    if (cargando) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(
            height: 10.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
