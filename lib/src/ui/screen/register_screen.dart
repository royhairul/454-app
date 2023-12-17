import 'package:flutter/material.dart';
import 'register_header.dart';
import './register_form.dart';
import './register_footer.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                  title: "Register",
                  subTitle: "Masukkan identitas diri anda.",
                  imageHeight: 0.15,
                  heightBetween: 40,
                ),
                RegisterForm(),
                RegisterFooter(),
              ],
            ),
        ),
      ),
    );
  }
}