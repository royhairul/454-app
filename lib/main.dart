import 'package:flutter/material.dart';
import 'package:upk_454_app/src/ui/pages/home_page.dart';
import 'package:upk_454_app/src/ui/pages/register_page.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "454 App",
      home: PersonalForm(),
      debugShowCheckedModeBanner: false
    );
  }
}