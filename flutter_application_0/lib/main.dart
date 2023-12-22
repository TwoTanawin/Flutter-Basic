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
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Hi Bro"),
              Text("Hi Bro"),
              Text("Hi Bro"),
            ],
          ),
        ),
      ),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
