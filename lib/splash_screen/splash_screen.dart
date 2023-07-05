// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textfield/home_screen/home_screen.dart';
import 'package:textfield/login_screen/login_screen.dart';

class SplsahPage extends StatefulWidget {
  const SplsahPage({super.key});

  @override
  State<SplsahPage> createState() => _SplsahPageState();
}

class _SplsahPageState extends State<SplsahPage> {
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }

  Future<void> checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print('pref   -->   ${pref.getBool('isLogin')}');
    if (pref.get('isLogin') == true) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginPage(),
      ));
    }
  }
}
