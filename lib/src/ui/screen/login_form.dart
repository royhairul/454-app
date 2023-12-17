import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  label: Text("Username"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.face)
              ),
            ),
            const SizedBox(height: 50 - 20),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text("Password"), prefixIcon: Icon(Icons.fingerprint), border: OutlineInputBorder()),
            ),
            const SizedBox(height: 50 - 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(backgroundColor: Colors.lightBlue),
                onPressed: () {},
                child: const Text("Masuk"),
              )
            )
          ],
        )
      );
  }
}