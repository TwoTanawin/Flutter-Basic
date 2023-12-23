import 'package:flutter/material.dart';

void main() {
  // print("Hello dart");
  runApp(MyApp());
}

// my widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0; // define state

  @override
  Widget build(BuildContext context) {
    List<Widget> data = [];
    data.add(Text("Hi Bro"));
    data.add(Text("Hi Bro"));
    data.add(Text(
      number.toString(),
      style: TextStyle(fontSize: 60),
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getData(20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNumber,
        child: Icon(Icons.add),
      ),
    );
  }

  void addNumber() {
    setState(() {
      number++;
    });
  }

  List<Widget> getData(int count) {
    List<Widget> data = [];
    for (var i = 0; i < count; i++) {
      data.add(Text(
        "Task ${i + 1}",
        style: TextStyle(fontSize: 20),
      ));
    }

    return data;
  }
}
