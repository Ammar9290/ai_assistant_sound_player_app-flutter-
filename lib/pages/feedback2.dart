import 'package:ai_voice_assistant_sound_player_app/pages/home_page.dart';
import 'package:ai_voice_assistant_sound_player_app/pages/logIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../ultils/ai_ultils.dart';

class FeedData extends StatefulWidget {
  FeedData({key}) : super(key: key);

  @override
  State<FeedData> createState() => _FeedDataState();
}

class _FeedDataState extends State<FeedData> {
  var feedbackField = TextEditingController();
  var emailField = TextEditingController();
  var rateField = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference feedback =
      FirebaseFirestore.instance.collection('Feedback');

  /* Future addFeedback(String email, String feedback, int rating) async {
    return await FirebaseFirestore.instance
        .collection('Feedback')
        .add({'Email': email, 'Feedback': feedback, 'Rating': rating});
  }*/

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
                      child: Image(
                        image: AssetImage('final_logo.jpg'),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 7,
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
                        'Feedback Page',
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
                        style: const TextStyle(
                          color: Colors.lightBlue,
                        ),
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          labelText: 'Email',
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: const TextStyle(
                            color: Colors.lightBlue,
                          ),
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
                            borderSide: BorderSide(
                              color: Colors.lightBlue,
                            ),
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
                        controller: feedbackField,
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Colors.lightBlue,
                        ),
                        autofocus: true,
                        maxLength: 150,
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          labelText: 'Feedback',
                          labelStyle: const TextStyle(
                            color: Colors.lightBlue,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Please Submit a Feedback',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.message_rounded,
                            color: Colors.lightBlue,
                          ),
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        enableInteractiveSelection: true,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 60),
                      child: TextField(
                        controller: rateField,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: Colors.lightBlue,
                        ),
                        maxLength: 1,
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          labelText: 'Rate Us',
                          labelStyle: const TextStyle(
                            color: Colors.lightBlue,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Rate us out of 5',
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
                            Icons.star,
                            color: Colors.lightBlue,
                          ),
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        enableInteractiveSelection: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      child: ElevatedButton(
                        onPressed: () async {
                          await feedback.add({
                            'Email': emailField.text.trim(),
                            'Feedback': feedbackField.text.trim(),
                            'Rating': int.parse(rateField.text.trim())
                          }).then((value) => Fluttertoast.showToast(
                                msg: 'Thank You for the Feedback',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.lightBlue,
                                timeInSecForIosWeb: 3,
                                fontSize: 15,
                              ));

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(25),
                            backgroundColor: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text(
                          'Submit Feedback',
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
