import 'package:flutter/material.dart';

import 'registration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // backgroundColor: Col,
      //   title: const Text(
      //     'Login',
      //   ),
      // ),
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
                onPressed: () {
                  // checkData(context, emailLogin.text, passwordLogin.text);
                },
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
