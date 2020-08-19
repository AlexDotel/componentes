import 'package:componentes/src/pages/Input_page.dart';
import 'package:componentes/src/pages/animated_container_page.dart';
import 'package:componentes/src/pages/listview_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/home_page.dart';

//Podriamos revolver en map en este metodo que llamaremos luego desde routes.

getAppRoutes(){

// return rutas

  return <String, WidgetBuilder>{

  '/'                 : (BuildContext context) => HomePage(),
  'alert'             : (BuildContext context) => AlertPage(),
  'avatar'            : (BuildContext context) => AvatarPage(),
  'card'              : (BuildContext context) => CardPage(),
  'animatedContainer' : (BuildContext context) => AnimatedContainerPage(),
  'inputs'            : (BuildContext context) => InputPage(),
  'slider'            : (BuildContext context) => SliderPage(),
  'list'              : (BuildContext context) => ListPage(),

};

}

//Podriamos llamar a la variable Map, que lleva consigo las rutas, pero es menos claro.

Map rutas = <String, WidgetBuilder>{

  '/'                 : (BuildContext context) => HomePage(),
  'alert'             : (BuildContext context) => AlertPage(),
  'avatar'            : (BuildContext context) => AvatarPage(),
  'card'              : (BuildContext context) => CardPage(),
  'animatedContainer' : (BuildContext context) => AnimatedContainerPage(),
  'inputs'            : (BuildContext context) => InputPage(),
  'slider'            : (BuildContext context) => SliderPage(),
  'list'              : (BuildContext context) => ListPage(),

};