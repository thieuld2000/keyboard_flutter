import 'package:flutter/material.dart';

enum InputButton {
  numberButton,
  deleteButton,
  deleteAllButton,
}

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
  String _passCode = "";
  void _onButtonClicked(String btnText) {
    setState(() {
      _passCode += btnText;
      if (_passCode.length > 4) {
        _passCode = "";
      }
    });
  }

  void _onDelete(String keyDelete) {
    setState(() {
      {
        _passCode = _passCode.substring(0, _passCode.length - 1);
      }
    });
  }

  Widget formButton(InputButton? solutions, String? number, String? text) {
    switch (solutions) {
      case InputButton.numberButton:
        return SizedBox(
          width: 50,
          height: 50,
          child: FloatingActionButton(
              onPressed: () => _onButtonClicked('$number'),
              backgroundColor: Colors.grey,
              child: Column(
                children: [
                  Text(
                    '$number',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '$text',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  )
                ],
              )),
        );
      case InputButton.deleteButton:
        number = "";
        text = "DELETE";
        {
          return SizedBox(
              width: 130,
              height: 50,
              child: TextButton(
                onPressed: _passCode.isEmpty ? null : () => _onDelete('$text'),
                child: Text(text),
              ));
        }
      case InputButton.deleteAllButton:
        {
          number = "";
          text = "DELETE ALL";
          return SizedBox(
              width: 130,
              height: 50,
              child: TextButton(
                onPressed: () => _onButtonClicked('$text'),
                child: Text(text),
              ));
        }
      default:
        InputButton.numberButton;
    }
    return formButton(solutions, "", "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Text('Enter Passcode'),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List<DotView>.generate(
              4,
              (index) =>
                  DotView(index < _passCode.length && _passCode.length < 5),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              formButton(InputButton.numberButton, '1', ''),
              formButton(InputButton.numberButton, '2', 'ABC'),
              formButton(InputButton.numberButton, '3', 'DEF'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              formButton(InputButton.numberButton, '4', 'GHI'),
              formButton(InputButton.numberButton, '5', 'JKL'),
              formButton(InputButton.numberButton, '6', 'MNO'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              formButton(InputButton.numberButton, '7', 'PQRS'),
              formButton(InputButton.numberButton, '8', 'TUV'),
              formButton(InputButton.numberButton, '9', 'WXYZ'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              formButton(InputButton.deleteAllButton, '', 'DELETE'),
              formButton(InputButton.numberButton, '0', '+'),
              formButton(InputButton.deleteButton, '', 'DELETE ALL'),
            ],
          ),
        ],
      ),
    );
  }
}

class DotView extends StatelessWidget {
  const DotView(this.isInput, {super.key});
  // ignore: prefer_typing_uninitialized_variables
  final isInput;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0), color: Colors.red),
      width: 16,
      height: 16,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(9.0)),
            color: isInput ? Colors.red : Colors.white),
      ),
    );
  }
}
