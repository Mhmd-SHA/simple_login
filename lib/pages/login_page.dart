import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_login/widgets/app_text_field.dart';

import '../services/firebase_service.dart';
import '../widgets/app_button.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController(text: "testuser@gmail.com");
  final passwordController = TextEditingController(text: "password");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Center(child: Text("Login Page", style: TextStyle(fontSize: 36))),
            SizedBox(height: 48),
            AppTextField(controller: emailController, hintText: "Email"),
            SizedBox(height: 16),
            AppTextField(controller: passwordController, hintText: "Password"),
            SizedBox(height: 16),
            AppButton(
              onPressed: () async {
                final User? user = await signInWithEmail(
                  emailController.text,
                  passwordController.text,
                );

                if (user != null) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false,
                  );
                }
              },
              buttonText: "Login",
            ),
          ],
        ),
      ),
    );
  }
}
