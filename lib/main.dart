import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hocgiaoly_v1/generated/assets.dart';
import 'package:hocgiaoly_v1/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Học Giáo Lý',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Học Giáo Lý'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _num = 0;
  String _question = '';
  String _answer = '';
  Random rand = Random();
  ListItem _listItem = ListItem();

  void initState() {
    this._listItem = new ListItem.fromJson();
    _showNewQuestion();
  }

  void _showNewQuestion() {
    setState(() {
      _num = rand.nextInt(60);
      _question = _listItem.items![_num].question!;
      _answer = '';
    });
  }

  void _showAnswer() {
    setState(() {
      if (_answer == '') {
        _answer = _listItem.items![_num].answer!;
      } else {
        _answer = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesBackground),
              fit: BoxFit.cover,
            )
          ),
          child: SingleChildScrollView(
            child: (
                Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(200, 255, 255, 255),
                          ),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 12),
                            child: Text('$_question',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Sans")),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(200, 255, 255, 255),
                          ),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () { _showAnswer(); },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 12),
                              child: Text('$_answer',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 27, fontFamily: "Sans"),

                              ),
                            ),
                          )
                        ),
                      ),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue, // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {
                              _showAnswer();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 60),
                              child: Text(
                                'Câu trả lời',
                                style: TextStyle(
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          )),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.lightBlue, // background
                              onPrimary: Colors.white, // foreground
                            ),
                            onPressed: () {
                              _showNewQuestion();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 42),
                              child: Text(
                                'Câu hỏi khác',
                                style: TextStyle(
                                  fontSize: 32,
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            )),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showNewQuestion,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
