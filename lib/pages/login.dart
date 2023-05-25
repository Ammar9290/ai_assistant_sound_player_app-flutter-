import 'package:ai_voice_assistant_sound_player_app/pages/forgetpassword.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

import '../ultils/ai_ultils.dart';
import 'Signup2.dart';
import 'feedback2.dart';
import 'home_page.dart';

class User_LoginPage extends StatefulWidget {
  final VoidCallback Signup;
  const User_LoginPage({key, this.Signup()}) : super(key: key);

  @override
  _User_LoginPageState createState() => _User_LoginPageState();
}

class _User_LoginPageState extends State<User_LoginPage> {
  var passwordField = TextEditingController();
  var emailField = TextEditingController();
  bool _obsecureText = true;

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailField.text.trim(), password: passwordField.text.trim());

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      Fluttertoast.showToast(
        msg: 'Log in Successful',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.lightBlue,
        timeInSecForIosWeb: 3,
        fontSize: 15,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
                content: Text('Invalid Email or Password !'));
          });
    }
  }

  @override
  void dispose() {
    emailField.dispose();
    passwordField.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AIColors.primaryColor1,
            AIColors.primaryColor2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: const Color.fromARGB(0, 0, 0, 0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
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
                      height: 18,
                    ),
                    const Center(
                      child: Text(
                        'Log In Page',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
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
                          vertical: 10, horizontal: 60),
                      child: TextField(
                        controller: passwordField,
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(color: Colors.lightBlue),
                        autofocus: true,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            labelText: 'Password',
                            labelStyle:
                                const TextStyle(color: Colors.lightBlue),
                            filled: true,
                            fillColor: Colors.white,
                            isDense: true,
                            hintText: 'Password',
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
                              Icons.security_sharp,
                              color: Colors.lightBlue,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obsecureText = !_obsecureText;
                                });
                              },
                              child: Icon(
                                _obsecureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.lightBlue,
                              ),
                            )),
                        textAlignVertical: TextAlignVertical.center,
                        enableInteractiveSelection: true,
                        obscureText: _obsecureText,
                        maxLength: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: ((context) {
                                  return ForgotPassword();
                                })));
                              },
                              child: const Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      child: ElevatedButton(
                        onPressed: signIn,
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(25),
                            backgroundColor: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont have an account? ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => User_SignUpPage()));
                            },
                            child: const Text(
                              ' Sign Up Now',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Do You want to give an feed back? ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FeedData()));
                            },
                            child: const Text(
                              ' Feed Back Now',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            ))
                      ],
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
