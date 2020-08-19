import 'package:flutter/material.dart';

import 'package:componentes/src/providers/recursos.dart';

class AvatarPage extends StatelessWidget {

  final String dennis = 'https://upload.wikimedia.org/wikipedia/commons/2/23/Dennis_Ritchie_2011.jpg';
  final String alan = 'https://upload.wikimedia.org/wikipedia/commons/e/e2/Alan_Cox_at_FOSS_2007.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( 
        title: Text('Avatar Page'),
        actions: <Widget>[

          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(alan),            
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              child: Text('AD')
            ),
          )

        ],

      ),

      body: Center(
        child: FadeInImage(
          image: NetworkImage(dennis),
          placeholder: AssetImage(Recursos().holder), 

          fadeInDuration: Duration( milliseconds: 200 ),
          height: 400,
          fit: BoxFit.cover
          
        ),
      ),
      

    );
  }
}