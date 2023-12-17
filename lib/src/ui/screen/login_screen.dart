import 'package:flutter/material.dart';
import 'register_header.dart';
import './login_form.dart';
import './login_footer.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height,
            child: const Column(
              children: [
                RegisterHeader(
                  image: 'assets/images/logo-UPK.png',
                  title: "Login",
                  subTitle: "Silahkan masuk dengan akun anda.",
                  imageHeight: 0.15,
                  heightBetween: 40,
                ),
                LoginForm(),
                LoginFooter(),
              ],
            ),
        ),
      ),
    );
  }
}