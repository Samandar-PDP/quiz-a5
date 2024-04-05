import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizitto/home_page.dart';

class IntroPage extends StatelessWidget {
  IntroPage({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/img/trophy.png',width: 200,height: 200),
                const SizedBox(height: 30),
                const Text("Welcome to Quizitto",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),),
                const SizedBox(height: 60),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Enter your nickname"),
                ),
                const SizedBox(height: 20),
                CupertinoTextField(
                  controller: _controller,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: 15),
                CupertinoButton(color: Colors.white,child: const Text("Next"), onPressed: () => _next(context)),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
  _next(BuildContext context) {
    // final regex = RegExp(r'[A-z]'); // r'[А-яЁё]'
    // if(regex.hasMatch(_controller.text)) {
    //   print('matched');
    // }
     if(_controller.text.length <= 2) {
       ScaffoldMessenger.of(context).clearSnackBars();
       ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(backgroundColor: Colors.red,content: Text("Enter correct name!"),duration: Duration(seconds: 1),));
       return;
     }
     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage(nickname: _controller.text,)), (route) => false);
  }
}
