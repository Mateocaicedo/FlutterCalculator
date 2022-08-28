import 'package:flutter/material.dart';


class ContadorSinEstado extends StatelessWidget {
  int contador = 0;
  final textStyle =  new TextStyle(fontSize: 30.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contador sin estado', style:textStyle
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            children: [
              Text('Numero de clicks', style:textStyle),
              Text('Clicks $contador',style:textStyle)
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ), 
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          contador ++;
          },
        ),
    );
  }
}