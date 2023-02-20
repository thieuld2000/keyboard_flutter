import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Lock Screen',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 50, left: 50, right: 50),
        children: [
          ButtonKeyboard(
            number: '1',
            letters: '',
          ),
          ButtonKeyboard(
            number: '2',
            letters: 'ABC',
          ),
          ButtonKeyboard(
            number: '3',
            letters: 'DEF',
          ),
          ButtonKeyboard(
            number: '4',
            letters: 'GHI',
          ),
          ButtonKeyboard(
            number: '5',
            letters: 'JKL',
          ),
          ButtonKeyboard(
            number: '6',
            letters: 'MNO',
          ),
          ButtonKeyboard(
            number: '7',
            letters: 'PQRS',
          ),
          ButtonKeyboard(
            number: '8',
            letters: 'TUV',
          ),
          ButtonKeyboard(
            number: '9',
            letters: 'WXYZ',
          ),
          DeleteButton(
            text: 'DELETE',
          ),
          ButtonKeyboard(
            number: '0',
            letters: '',
          ),
          DeleteAllButton(
            text: 'DELETE ALL',
          ),
        ],
      ),
    ));
  }
}

class ButtonKeyboard extends StatelessWidget {
  final String? number;
  final String? letters;

  ButtonKeyboard({this.number, this.letters});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$number',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                '$letters',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  final String? text;

  DeleteButton({this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 100,
            height: 50,
            child: TextButton(
                onPressed: () {},
                child: Text('$text',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 13,
                        fontWeight: FontWeight.bold)))));
  }
}

class DeleteAllButton extends StatelessWidget {
  final String? text;

  DeleteAllButton({this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 100,
            height: 50,
            child: TextButton(
                onPressed: () {},
                child: Text('$text',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 13,
                        fontWeight: FontWeight.bold)))));
  }
}
