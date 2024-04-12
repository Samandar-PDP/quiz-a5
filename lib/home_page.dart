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
  int _score = 0;

  @override
  Widget build(BuildContext context) {
     //_currentIndex = 0;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Slider(
                      max: questionList.length.toDouble() - 1,
                      value: _currentIndex.toDouble(),
                      onChanged: (v) {},
                      activeColor: Colors.greenAccent,
                      inactiveColor: Colors.grey.shade200,
                    )),
                    const SizedBox(width: 5),
                    Text("${_currentIndex+1}/${questionList.length}")
                  ],
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
                    title: _currentIndex == questionList.length -1 ? "Finish" : "Next",
                    onClick: () {
                      if (_currentIndex < questionList.length - 1) {
                        _currentIndex++;
                        _isClicked = true;
                      } else {
                        _showFinishDialog();
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

  void _showFinishDialog() {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: const Text("Your result"),
      content: Text("$_score/${questionList.length}",style: const TextStyle(fontSize: 25),),
      actions: [
        TextButton(onPressed: _finishTheGame, child: const Text("OK"))
      ],
    ));
  }

  void _finishTheGame() {
    Navigator.of(context).pop();
    _score = 0;
    _currentIndex = 0;
    questionList.shuffle();
    _isClicked = true;
    setState(() {});
  }

  void _checkOption(int index, int correct) {
    _isClicked = false;
    setState(() {
    });
    if (index == correct) {
      _score++;
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
