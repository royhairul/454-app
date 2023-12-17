import 'package:flutter/material.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Text.rich(
            TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,

              children: const [
                TextSpan(text: "Sudah Punya Akun ? "),
                TextSpan(
                  text: "Login",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.w700
                  ),
                )
              ]
            )
          ),
        )
      ],
    );
  }
}