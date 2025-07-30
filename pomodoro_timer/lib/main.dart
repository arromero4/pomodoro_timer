import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: Text('My Flutter App'),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Action for settings button
              },
            ),
          ],
        ),
        body: Center(child: Text('Hello World!')),
      ),
    );
  }
}
