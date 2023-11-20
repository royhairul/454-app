import 'package:flutter/material.dart';
import 'package:upk_454_app/src/model/pjmk.dart';

class PJMKDetail extends StatefulWidget {
  final List<Person> items;

  const PJMKDetail({required this.items});

  @override
  _PJMKDetailState createState() => _PJMKDetailState();
}

class _PJMKDetailState extends State<PJMKDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Color.fromARGB(255, 10, 148, 150),
        foregroundColor: Colors.white
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 20),
        child : Center(
          child: ListView.builder(
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5, // Tambahkan elevasi untuk efek bayangan
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Tambahkan margin
                child: ListTile(
                  title: Text("Selamat Datang"),
                  subtitle: Text(widget.items[0].fullName)
                ),
              );
            }
          )
        )
      )
    );
  }
}
