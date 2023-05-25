import 'package:flutter/material.dart';
import 'package:ai_voice_assistant_sound_player_app/pages/login.dart';

class welcome extends StatefulWidget {
  const welcome({key});

  @override
  State<welcome> createState() => welcomeState();
}

class welcomeState extends State<welcome> {
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(microseconds: 2000000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => User_LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 77, 154),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 500,
              width: 500,
              child: const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 50.0,
                backgroundImage: AssetImage("assets/final_logo.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
