import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizitto/option_btn.dart';
import 'package:quizitto/question.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.nickname});

  final String nickname;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool _isClicked = true;

  @override
  Widget build(BuildContext context) {
     //_currentIndex = 0 ;
    final currentQuestion = questionList[_currentIndex];
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purpleAccent, Color(0xFF051433)],
                begin: AlignmentDirectional.topCenter)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Choose the correct option",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/img/${currentQuestion.logo}.png',
                      width: 320, height: 200, fit: BoxFit.cover),
                ),
                Slider(
                  max: questionList.length.toDouble() - 1,
                  value: _currentIndex.toDouble(),
                  onChanged: (v) {},
                  activeColor: Colors.greenAccent,
                  inactiveColor: Colors.grey.shade200,
                ),
                Column(children: [
                  OptionBtn(
                    enabled: _isClicked,
                    title: currentQuestion.option1,
                    onClick: () =>
                        _checkOption(0, currentQuestion.correctOption),
                  ),
                  OptionBtn(
                    enabled: _isClicked,
                    title: currentQuestion.option2,
                    onClick: () =>
                        _checkOption(1, currentQuestion.correctOption),
                  ),
                  OptionBtn(
                    enabled: _isClicked,
                    title: currentQuestion.option3,
                    onClick: () =>
                        _checkOption(2, currentQuestion.correctOption),
                  ),
                  OptionBtn(
                    enabled: _isClicked,
                    title: currentQuestion.option4,
                    onClick: () =>
                        _checkOption(3, currentQuestion.correctOption),
                  ),
                  OptionBtn(
                    enabled: true,
                    title: "Next",
                    onClick: () {
                      if (_currentIndex < questionList.length - 1) {
                        _currentIndex++;
                        _isClicked = true;
                      } else {
                        print('tugadi');
                      }
                      setState(() {});
                    },
                    isNext: true,
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _checkOption(int index, int correct) {
    _isClicked = false;
    setState(() {
    });
    if (index == correct) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Correct"),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Incorrect"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 1)));
    }
  }
}
