// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textfield/constants/constans.dart';
import 'package:textfield/home_screen/home_screen.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'LOGIN PAGE',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: userNameController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'username',
                border: OutlineInputBorder(),
              ),
              style: TextStyle(),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              obscuringCharacter: '*',
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'passoword', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (userNameController.text.trim() == userName &&
                      passwordController.text == password) {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setBool('isLogin', true);

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('login successfull')));
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ));

                    print('Successul');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('incorrect username or password')));
                    print('incorrect');
                  }
                },
                child: Text('submit'))
          ],
        ),
      ),
    );
  }
}
