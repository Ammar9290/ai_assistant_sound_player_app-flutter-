import 'package:ai_voice_assistant_sound_player_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../ultils/ai_ultils.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var emailField = TextEditingController();

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailField.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
                content: Text('Passowrd Reset Email sent ! Check Your Email'));
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
                content: Text(
                    'No Such User Found, PLease Enter a Valid and Registered Email'));
          });
    }
  }

  @override
  void dispose() {
    emailField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            AIColors.primaryColor1,
            AIColors.primaryColor2,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: const Color.fromARGB(0, 0, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => User_LoginPage()));
                    },
                    tooltip: 'Back',
                    splashColor: Colors.lightBlue,
                    hoverColor: Colors.lightBlue,
                    enableFeedback: true,
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: ClipOval(
                        child: Container(
                          width: 150,
                          height: 150,
                          color: Colors.lightBlue,
                          child: const CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 50.0,
                            backgroundImage:
                                AssetImage("assets/final_logo.png"),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 130,
                    ),
                    const Center(
                      child: Text(
                        'Enter your Email and we will send you a Passord reset link',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 60),
                      child: TextField(
                        controller: emailField,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.lightBlue),
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          labelText: 'Email',
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: const TextStyle(color: Colors.lightBlue),
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue),
                          ),
                          prefixIcon: const Icon(
                            Icons.person_4_sharp,
                            color: Colors.lightBlue,
                          ),
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        enableInteractiveSelection: true,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      child: ElevatedButton(
                        onPressed: passwordReset,
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(25),
                            // backgroundColor: ourOrange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text(
                          'Reset Password',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
