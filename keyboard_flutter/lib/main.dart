import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var isInputList = [false, false, false, false];

  var dotList = [
    dotView(false),
    dotView(false),
    dotView(false),
    dotView(false)
  ];
  String Dialnum = "";
  void btnClicked(String btnText) {
    Dialnum += btnText;
    if ((Dialnum.length > 4 || Dialnum.length == 0)) {
      Dialnum = "";
      isInputList = [false, false, false, false];
    } else if (Dialnum.length == 1) {
      isInputList = [true, false, false, false];
    } else if (Dialnum.length == 2) {
      isInputList = [true, true, false, false];
    } else if (Dialnum.length == 3) {
      isInputList = [true, true, true, false];
    } else if (Dialnum.length == 4) {
      isInputList = [true, true, true, true];
    }

    setState(() {
      dotList = isInputList.map((e) => dotView(e)).toList();
    });
  }

  void btnDelete(String btnDelete) {
    if (btnDelete == 'DELETE') {
      Dialnum = Dialnum.substring(0, Dialnum.length - 1);
      if (Dialnum.length == 0) {
        isInputList = [false, false, false, false];
      } else if (Dialnum.length == 1) {
        isInputList = [true, false, false, false];
      } else if (Dialnum.length == 2) {
        isInputList = [true, true, false, false];
      } else if (Dialnum.length == 3) {
        isInputList = [true, true, true, false];
      } else if (Dialnum.length == 4) {
        isInputList = [true, true, true, true];
      }
    }

    setState(() {
      dotList = isInputList.map((e) => dotView(e)).toList();
    });
  }

  Widget DialKey(String number, letter) {
    return Container(
      width: 50,
      height: 50,
      child: FloatingActionButton(
          onPressed: () => btnClicked(number),
          backgroundColor: Colors.grey,
          child: Column(
            children: [
              Text(
                '$number',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                '$letter',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              )
            ],
          )),
    );
  }

  Widget Deletebtn(String textD) {
    return Container(
      width: 130,
      height: 50,
      child: TextButton(
        onPressed: () => btnDelete(textD),
        child: Text('$textD'),
      ),
    );
  }

  Widget DeleteBtnAll(String text) {
    return Container(
      width: 130,
      height: 50,
      child: TextButton(
        onPressed: () => btnClicked(text),
        child: Text('$text'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Enter Passcode'),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [dotList[0], dotList[1], dotList[2], dotList[3]],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DialKey('1', ''),
                DialKey('2', 'ABC'),
                DialKey('3', 'DEF'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DialKey('4', 'GHI'),
                DialKey('5', 'JKL'),
                DialKey('6', 'MNO'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DialKey('7', 'PQRS'),
                DialKey('8', 'TUV'),
                DialKey('9', 'WXYZ'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DeleteBtnAll('DELETE ALL'),
                DialKey('0', '+'),
                Deletebtn('DELETE')
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class dotView extends StatelessWidget {
  dotView(this.isInput);
  final isInput;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          // color: isInput ? Colors.red : Colors.blue,
          color: Colors.red),
      width: 16,
      height: 16,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(9.0)),
            color: isInput ? Colors.red : Colors.white),
      ),
    );
  }
}
