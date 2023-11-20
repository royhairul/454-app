import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key})

//   @override
//   _HomePageState createState() => _HomePageState();
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.account_circle)
        ]
      ),
      body: Container(
        child: Text('First Time'),
      ),
    );
  }

}