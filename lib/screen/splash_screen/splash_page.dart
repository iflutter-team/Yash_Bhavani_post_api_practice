import 'dart:async';

import 'package:flutter/material.dart';
import 'package:post_api_practice/screen/home_screen/home_screen.dart';
import 'package:post_api_practice/screen/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? preferences;
  String loginKey = '';

  Future<void> setPref() async {
    preferences = await SharedPreferences.getInstance();
    loginKey = preferences!.getString("LoginKey") ?? "";
  }

  @override
  void initState() {
    super.initState();
    setPref();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => loginKey != ""
                  ? const GetHomeScreen()
                  : const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Image.network(
                'https://png.pngtree.com/png-vector/20190710/ourmid/pngtree-user-vector-avatar-png-image_1541962.jpg',
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            const CircularProgressIndicator(
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
