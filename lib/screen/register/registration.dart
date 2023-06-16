// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:post_api_practice/screen/register/registration_api.dart';

import '../../model/post_api_model.dart';
import '../login/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailReg = TextEditingController();
  TextEditingController passwordReg = TextEditingController();
  TextEditingController nameReg = TextEditingController();
  TextEditingController lastReg = TextEditingController();

  void clearTextField() {
    emailReg.clear();
    passwordReg.clear();
    nameReg.clear();
    lastReg.clear();
  }

  UserSingUp? user;

  Future userSignUp() async {
    Map<String, dynamic> body = {
      'EmailId': emailReg.text.trim(),
      'Password': passwordReg.text.trim(),
      'FirstName': nameReg.text.trim(),
      'LastName': lastReg.text.trim(),
    };

    user = await RegisterAPI.registerUser(body);

    if (user != null && user!.status == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Registration'),
      // ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://img.freepik.com/free-vector/blue-curve-abstract-background_53876-99570.jpg'))),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: nameReg,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Name'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: lastReg,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Last Name'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailReg,
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
                  controller: passwordReg,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Password'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text('Already User?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: const Text('Login'),
                    )
                  ],
                ),
                ElevatedButton(
                    // onPressed: () async {
                    //   Map<String, dynamic> user = {
                    //     'name': nameReg.text,
                    //     'password': passwordReg.text,
                    //     'age': ageReg.text,
                    //     'email': emailReg.text,
                    //     'hobby': hobbyReg.text
                    //   };
                    //   if (emailReg.text.isNotEmpty &&
                    //       passwordReg.text.isNotEmpty &&
                    //       nameReg.text.isNotEmpty &&
                    //       ageReg.text.isNotEmpty &&
                    //       hobbyReg.text.isNotEmpty) {
                    //     await addData(
                    //       emailReg.text,
                    //       context,
                    //       user,
                    //     );
                    //   } else {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       const SnackBar(
                    //         content: Text('Please Fill All Data'),
                    //       ),
                    //     );
                    //   }
                    //   clearTextField();
                    //   // ignore: use_build_context_synchronously
                    //   // Navigator.of(context).pop();
                    // },
                    onPressed: () => userSignUp(),
                    child: const Text('Registration')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
