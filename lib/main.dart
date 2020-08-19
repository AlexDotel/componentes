import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
 
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(

      debugShowCheckedModeBanner: false,

      //Configuracion para internacionalizacion de app
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('es', 'ES'), // Hebrew
        const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],


      title: 'Componentes App',
        
        //Removemos el Home para navegar por rutas definidas abajo
        // home: HomePage()
      
        //Esta es la ruta inicial declarada, la ruta donde empezara nuestra aplicacion.
        initialRoute: '/',

        //Aqui en la propiedad routes, declaramos un MAP, que recibe un String y un Widget
        //Builder, que requiere esta propiedad, de esta forma declaramos las diferentes rutas
        //de nuestra aplicacion para luego solo navegar introduciendo la palabra clave.

        //Estas rutas, al ser demasiadas las pusimos aparte en un archivo /src/routes/routes.dart
        //De esta manera tenemos una aplicacion mucho mas organizada y un codigo mas limpio y legible.
        routes: getAppRoutes(),

        //Aqui guardamos una ruta, por defecto en caso de que se llame a una ruta inexistente en algun
        //boton. Basicamente esta ruta no deberia ser usada, pero podemos crear una pagina de 'Pagina no encontrada.'
        onGenerateRoute: ( RouteSettings settings ){

           return MaterialPageRoute(
           builder: (contexto) => AlertPage()
           );

        },




    );
    return materialApp;
  }
}