// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:post_api_practice/screen/login/login_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/login_model.dart';
import '../home_screen/home_screen.dart';
import '../register/registration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  SharedPreferences? pref;

  Future<void> setPref() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setPref();
  }

  UserLogin? user;

  Future checkLoginUser() async {
    Map<String, dynamic>? body = {
      'email': emailLogin.text.trim(),
      'Password': passwordLogin.text.trim(),
    };

    user = await LoginAPI.loginPostAPI(body: body);
    print(user);
    if (user != null && user!.status == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            pref!.setString('LoginKey', 'Login Successful');
            print(pref);
            return const GetHomeScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://img.freepik.com/free-vector/blue-curve-abstract-background_53876-99570.jpg'))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailLogin,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'email'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordLogin,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Password'),
              ),
              Row(
                children: [
                  const Text('New User?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegistrationScreen(),
                          ),
                        );
                      },
                      child: const Text('Registration'))
                ],
              ),
              ElevatedButton(
                onPressed: () => checkLoginUser(),
                // checkData(context, emailLogin.text, passwordLogin.text);

                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
