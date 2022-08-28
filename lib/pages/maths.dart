import 'package:flutter/material.dart';

class ArithmetitOperations extends StatefulWidget {
  const ArithmetitOperations({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Math();
}

class Math extends State<ArithmetitOperations> {
  dynamic resultado = 0;

  final textStyle = const TextStyle(fontSize: 20.0);

  dynamic num1;
  dynamic num2;
  final exp = RegExp(r'^[0-9]+$');
  final key = GlobalKey<FormState>();
  



  @override
  Widget build(BuildContext context) {
    var form = <Widget> [
               TextFormField(
                decoration: const  InputDecoration(
                  border:  OutlineInputBorder(),
                  labelText: 'Write a number',
                  prefixIcon: Icon(Icons.numbers,color: Colors.deepOrangeAccent),
                  fillColor: Colors.deepOrangeAccent,
                 
                ),
                
                onSaved: (value) => num1 = value,
                validator: (value){
                  if (value == null  || value.isEmpty) {
                    return 'Llene este campo';
                  }
                  if (!exp.hasMatch(value) ) {
                    return 'Solo numeros';
                  }
                  return null;
                },
              ),
              const Padding(padding: EdgeInsets.all(16.0)),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Write another number',
                   prefixIcon: Icon(Icons.numbers,color: Colors.deepOrangeAccent,)
                  
                ),
                onSaved: (value)=> num2 = value,
                validator: (value){
                  if (value == null  || value.isEmpty) {
                    return 'Llene este campo';
                  }
                   if (!exp.hasMatch(value)) {
                    return 'Solo numeros';
                  }
                   return null;
                },
              ),
              const Padding(padding: EdgeInsets.all(13.0)),
              Text('RESULTADO $resultado', style: textStyle),
            ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text('Operaciones matematicas', style: textStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left:30, right:30 ),
        child: Form(
          key: key,
          child: Column(
            // ignore: sort_child_properties_last
            children: form,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            onPressed: add,
            child:const  Icon(Icons.add),
          ),
          const Padding(padding: EdgeInsets.all(3.0)),
         FloatingActionButton(
             backgroundColor: Colors.amber,

            onPressed: minus,
             child:const Icon(Icons.remove),
          ),
          const Padding(padding: EdgeInsets.all(3.0)),
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: multiply,
            child:const Icon(Icons.close),
          ),
          const Padding(padding: EdgeInsets.all(3.0)),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: divider,
            child: const Icon(Icons.dashboard),
          ),
        ],
      ),
    );
  }

  divider() {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      if (double.parse(num2) <= 0  ) {
        return showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                // Recupera el texto que el usuario ha digitado utilizando nuestro
                // TextEditingController
                content: Text('Division imposible'),
              );
            },
          );
      }
      setState(() {
        resultado = double.parse(num1) / double.parse(num2);
      });
    }
 

    
  }

  void add() {
     if (key.currentState!.validate()) {
      key.currentState!.save();
      setState(() {
        resultado = int.parse(num1) + int.parse(num2);
      });
    }
 
  }

  void minus() {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      setState(() {
        resultado = int.parse(num1) - int.parse(num2);
      });
    }
 
  }

  void multiply() {
     if (key.currentState!.validate()) {
      key.currentState!.save();
      setState(() {
        resultado = int.parse(num1) * int.parse(num2);
      });
    }
 
  }
}
