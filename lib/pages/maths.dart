import 'package:flutter/material.dart';

class ArithmetitOperations extends StatefulWidget {
  const ArithmetitOperations({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Math();
}

class Math extends State<ArithmetitOperations> {
  dynamic resultado = 0;

  final textStyle =  TextStyle(color: Colors.amber[700], fontSize: 25);

  dynamic num1;
  dynamic num2;
  

  String temp ='0'; //psuedo output, we keep this in memory and later assign it as num1, num2, or as decimal value.
  String output = '0';
  String operand = "";
  String history = "";



  Widget buildbutton(String buttonValue, int flexValue) {
    return Expanded(
      flex: flexValue,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromRGBO(38, 38, 38, 1),
          ),
          onPressed: () {
            setEdition(buttonValue);
          },


//designing the button
          child: Container(
            // ignore: sort_child_properties_last
            child: Text(
              buttonValue,
              style: const TextStyle(
                  fontSize: 30, color: Color.fromRGBO(238, 134, 48, 1)),
            ),
            padding: const EdgeInsets.all(15),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:Text('Calculator', style: textStyle), 
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Expanded(
            child: Divider()
          ),


          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12.5),
            // ignore: unnecessary_new
            child: new Text(
              history,
              style: const TextStyle(
                fontSize: 30,
                // fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 77, 76, 76),
              ),
            ),
          ),


          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(12.5, 12.5, 12.5, 25),
            // ignore: unnecessary_new
            child: new Text(
              output,
              style: const TextStyle(
                fontSize: 85,
                // fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 189, 187, 187),
              ),
            ),
          ),

          Column(
            children: [
              Row(
                children: [
                  buildbutton("AC", 3),
                  buildbutton("/", 1),
                ],
              ),
              Row(
                children: [
                  buildbutton("7", 1),
                  buildbutton("8", 1),
                  buildbutton("9", 1),
                  buildbutton("x", 1),
                ],
              ),
              Row(
                children: [
                  buildbutton("4", 1),
                  buildbutton("5", 1),
                  buildbutton("6", 1),
                  buildbutton("-", 1),
                ],
              ),
              Row(
              children: [
                buildbutton("1", 1),
                buildbutton("2", 1),
                buildbutton("3", 1),
                buildbutton("+", 1),
              ],
            ),
            Row(
              children: [
                buildbutton("0", 1),
                buildbutton(".", 1),
                buildbutton("=", 2),
              ],
            ),
            ],
          ),
        
        ],
      ),

     
    );
  }

void setEdition( buttonValue){
    setState(() {
      if (buttonValue == 'AC') {
                temp = '0';
                num1 = 0;
                num2 = 0;
                operand = "";
              } else if (buttonValue == '+' ||
                  buttonValue == '-' ||
                  buttonValue == 'x' ||
                  buttonValue == '/' ||
                  buttonValue == '%') {
                num1 = double.parse(output);
                operand = buttonValue;
                temp = '0';
              } else if (buttonValue == '.') {
                if (temp.contains('.')) { // if the number already contains a decimal, we print this.
                  return;
                } else {
                  temp = temp +
                      buttonValue; //we are adding a decimal point to the number we have at hand
                }
              } else if (buttonValue == "=") {
                num2 = double.parse(output);

                if (operand == '+') {
                  temp = (num1 + num2).toString();
                } else if (operand == '-') {
                  temp = (num1 - num2).toString();
                } else if (operand == 'x') {
                  temp = (num1 * num2).toString();
                } else if (operand == '/') {
                  temp = (num1 / num2).toString();
                } else if (operand == '%') {
                  temp = (num1 % num2).toString();
                }

                num1 = 0;
                num2 = 0;
                operand = "";
              } else {
                temp = temp + buttonValue;
              }

              setState(() {
                output = double.parse(temp).toStringAsFixed(
                    2); // temp will contain many zeroes, so we make it into a double and allow only two decimals, then we make it back into string.
              });

//recording history of the operations done
             if(buttonValue!= 'AC'){
              history = history + buttonValue;  // as long as buttonValue is not 'AC', keep displaying them. 
              }
              else{
                history = '';                   // if 'AC' is pressed, then delete the history.
              }
              
    });
  }

 
}
