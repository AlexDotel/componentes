import 'package:flutter/material.dart';


final Map <String, IconData> _icons = {

  "add_alert"     : Icons.add_alert ,
  "accessibility" : Icons.accessibility,
  "folder_open"   : Icons.folder_open,
  "donut_large"   : Icons.donut_large,
  "power_input"   : Icons.power_input,
  "tune"          : Icons.tune,
  "list"          : Icons.list,

};


Icon getIcon(String nombreIcono, Color coloricono){

  return Icon( _icons[nombreIcono] , color: coloricono);

}