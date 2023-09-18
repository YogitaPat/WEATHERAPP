import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weather_application_assign/controller/auth_controller.dart';

import '../core/constants.dart';
//import 'package:weather_application/view_model/controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginState();
}

//final authController = Get.put(AuthController());

class _LoginState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text(lblLogin)),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 50.0),
              child: Container(
                margin: EdgeInsets.only(
                    top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
                child: SizedBox(
                  height: 150,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          TextField(
                            decoration:
                                const InputDecoration(hintText: lblEmail),
                            controller: _emailController,
                          ),
                          TextField(
                            decoration:
                                const InputDecoration(hintText: lblPass),
                            controller: _passwordController,
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim());

                    // (_emailController.text.trim(),
                    //       _passwordController.text.trim());
                  },
                  child: const Text("Sign Up"),
                ),
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () async {
                      // if (
                      //     _emailController.text != '') {
                      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // } else if (_passwordController.text == '' ) {
                      //   ScaffoldMessenger.of(context)
                      //       .showSnackBar(snackPassBar);
                      // } else {
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim())
                          .catchError((err) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text(err.message),
                                actions: [
                                  ElevatedButton(
                                    child: Text("Ok"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      });
                    },
                    child: const Text("Login"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
