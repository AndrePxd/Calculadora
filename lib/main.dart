import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(
        title: '',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget customOutLineButton(String valor, Color btncolor, Color texto) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          operaciones(valor);
        },
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(10.0),
          backgroundColor: btncolor,
          shape: CircleBorder(),
        ),
        child: Text(
          valor,
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.w500, color: texto),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora")),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomRight,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            )),
            Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customOutLineButton(
                    "C", Colors.amber, Color.fromARGB(255, 90, 89, 89)),
                customOutLineButton(
                    "+/-", Colors.amber, Color.fromARGB(255, 90, 89, 89)),
                customOutLineButton(
                    "%", Colors.amber, Color.fromARGB(255, 90, 89, 89)),
                customOutLineButton("/", Colors.purple, Colors.white)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                customOutLineButton(
                    "7", Color.fromARGB(255, 58, 58, 58), Colors.white),
                customOutLineButton(
                    "8", Color.fromARGB(255, 58, 58, 58), Colors.white),
                customOutLineButton(
                    "9", Color.fromARGB(255, 58, 58, 58), Colors.white),
                customOutLineButton("x", Colors.purple, Colors.white)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                customOutLineButton(
                    "4", Color.fromARGB(255, 58, 58, 58), Colors.white),
                customOutLineButton(
                    "5", Color.fromARGB(255, 58, 58, 58), Colors.white),
                customOutLineButton(
                    "6", Color.fromARGB(255, 58, 58, 58), Colors.white),
                customOutLineButton("-", Colors.purple, Colors.white)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                customOutLineButton(
                    "1", Color.fromARGB(255, 58, 58, 58), Colors.white),
                customOutLineButton(
                    "2", Color.fromARGB(255, 58, 58, 58), Colors.white),
                customOutLineButton(
                    "3", Color.fromARGB(255, 58, 58, 58), Colors.white),
                customOutLineButton("+", Colors.purple, Colors.white),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {
                    operaciones("0");
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                    shape: StadiumBorder(),
                    backgroundColor: Color.fromARGB(255, 58, 58, 58),
                  ),
                  child: Text(
                    "0",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                  //
                ),
                customOutLineButton(
                    ".", Color.fromARGB(255, 58, 58, 58), Colors.white),
                customOutLineButton("=", Colors.purple, Colors.white),
              ],
            )
          ],
        ),
      ),
    );
  }

  late int num1, num2;
  late String ope;
  late String resul, text = "";
  late double decimal;

  void operaciones(String cadena) {
    if (cadena == "C") {
      resul = "0";
      text = "0";
      num1 = 0;
      num2 = 0;
    } else if (cadena == "+" ||
        cadena == "-" ||
        cadena == "x" ||
        cadena == "/") {
      num1 = int.parse(text);
      resul = "";
      ope = cadena;
      if (cadena == ".") {
        if (!resul.toString().contains('.')) {
          resul = decimal.toString() + ".";
        }
        //text = resul;
      }
    } else if (cadena == "=") {
      num2 = int.parse(text);
      if (ope == "+") {
        resul = (num1 + num2).toString();
      } else if (ope == "-") {
        resul = (num1 - num2).toString();
      } else if (ope == "x") {
        resul = (num1 * num2).toString();
      } else if (ope == "/") {
        resul = (num1 / num2).toString();
      }
    } else if (cadena == "%") {
      num1 = int.parse(text);
      resul = (num1 / 100).toString();
    } else if (cadena == "+/-") {
      resul.toString().startsWith("-")
          ? resul = resul.toString().substring(1)
          : resul = "-" + resul.toString();
    } else {
      resul = int.parse(text + cadena).toString();
    }
    setState(() {
      text = resul;
    });
  }
}
