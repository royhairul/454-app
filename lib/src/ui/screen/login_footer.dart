import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: Text.rich(
            TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,

              children: const [
                TextSpan(text: "Belum Punya Akun ? "),
                TextSpan(
                  text: "Register",
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.w700
                  ),
                ),
                TextSpan(text: " terlebih dahulu")
              ]
            )
          ),
        )
      ],
    );
  }
}