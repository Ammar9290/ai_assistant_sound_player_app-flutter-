import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ai_voice_assistant_sound_player_app/main.dart';
import 'package:ai_voice_assistant_sound_player_app/pages/home_page.dart';
import 'package:ai_voice_assistant_sound_player_app/pages/login.dart';
import 'package:ai_voice_assistant_sound_player_app/pages/welcome.dart';

import '../ultils/ai_ultils.dart';

class User_SignUpPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const User_SignUpPage({key, this.showLoginPage}) : super(key: key);

  @override
  _User_SignUpPageState createState() => _User_SignUpPageState();
}

class _User_SignUpPageState extends State<User_SignUpPage> {
  var passwordField = TextEditingController();
  var emailField = TextEditingController();
  var confirmPassField = TextEditingController();
  var firstField = TextEditingController();
  var lastField = TextEditingController();
  var ageField = TextEditingController();
  var cityField = TextEditingController();
  bool _obsecureText = true;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference userData = FirebaseFirestore.instance.collection('User');
  @override
  void dispoe() {
    emailField.dispose();
    passwordField.dispose();
    confirmPassField.dispose();
    firstField.dispose();
    lastField.dispose();
    ageField.dispose();
    cityField.dispose();
    super.dispose();
  }

  Future signUp() async {
    try {
      if (passConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailField.text.trim(), password: passwordField.text.trim());

        await userData.add({
          'First Name': firstField.text.trim(),
          'Last Name': lastField.text.trim(),
          'Age': ageField.text.trim(),
          'Email': emailField.text.trim(),
          'City': cityField.text.trim(),
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => User_LoginPage()));
      } else {
        Fluttertoast.showToast(
          msg: 'Error: Password must Match with Confirm Password',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.lightBlue,
          timeInSecForIosWeb: 3,
          fontSize: 15,
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
                content: Text('Please Fill all given fields'));
          });
    }
  }

  bool passConfirmed() {
    if (passwordField.text.trim() == confirmPassField.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            AIColors.primaryColor2,
            AIColors.primaryColor1,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
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
                      tooltip: 'Go Back to Welcome',
                      splashColor: Colors.lightBlue,
                      hoverColor: Colors.blue,
                      enableFeedback: true,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: ClipOval(
                    child: Container(
                      width: 150,
                      height: 150,
                      color: Colors.lightBlue,
                      child: const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 50.0,
                        backgroundImage: AssetImage("assets/final_logo.png"),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Center(
                        child: Text(
                          'Sign Up Page',
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
                          controller: firstField,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(color: Colors.lightBlue),
                          autofocus: true,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            labelText: 'First Name',
                            labelStyle:
                                const TextStyle(color: Colors.lightBlue),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'First Name',
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
                              Icons.person,
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
                          controller: lastField,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(color: Colors.lightBlue),
                          autofocus: true,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            labelText: 'Last Name',
                            labelStyle:
                                const TextStyle(color: Colors.lightBlue),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Last Name',
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
                              Icons.person,
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
                          controller: ageField,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.lightBlue),
                          autofocus: true,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            labelText: 'Age',
                            labelStyle:
                                const TextStyle(color: Colors.lightBlue),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Age',
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
                              Icons.person,
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
                          controller: emailField,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.lightBlue),
                          autofocus: true,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            labelText: 'Email',
                            labelStyle:
                                const TextStyle(color: Colors.lightBlue),
                            filled: true,
                            fillColor: Colors.white,
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
                              Icons.email_sharp,
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
                          controller: cityField,
                          keyboardType: TextInputType.name,
                          style: const TextStyle(color: Colors.lightBlue),
                          autofocus: true,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 15),
                            labelText: 'City',
                            labelStyle:
                                const TextStyle(color: Colors.lightBlue),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'City',
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
                              Icons.location_on,
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
                      const SizedBox(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 60),
                        child: TextField(
                          controller: confirmPassField,
                          keyboardType: TextInputType.visiblePassword,
                          style: const TextStyle(color: Colors.lightBlue),
                          autofocus: true,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              labelText: 'Confirm Password',
                              labelStyle:
                                  const TextStyle(color: Colors.lightBlue),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Confirm Password',
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
                      const SizedBox(
                        height: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 50),
                        child: ElevatedButton(
                          onPressed: signUp,
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(25),
                              backgroundColor: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child: const Text(
                            'Sign Up ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an Account? ',
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
                                        builder: (context) =>
                                            User_LoginPage()));
                              },
                              child: const Text(
                                ' Go to Login',
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 14,
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
