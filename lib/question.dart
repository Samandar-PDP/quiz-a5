class Question {
  String logo;
  String option1;
  String option2;
  String option3;
  String option4;
  int correctOption;

  Question(
      {
      required this.option1,
      required this.option2,
      required this.option3,
      required this.option4,
      required this.correctOption,
        required this.logo,});
}
final questionList = [
  Question(option1: "Mexico", option2: "Russia", option3: "USA", option4: "Argentina", correctOption: 2, logo: 'img'),
  Question(option1: "Uzbekistan", option2: "Mexico", option3: "Brazil", option4: "Afghanistan", correctOption: 1, logo: 'img_1'),
  Question(option1: "Argentina", option2: "Morocco", option3: "Uruguay", option4: "Uruguay", correctOption: 0, logo: 'img_2'),
  Question(option1: "Korea", option2: "New Zealand", option3: "Bolivia", option4: "Brazil", correctOption: 3, logo: 'img_3'),
  Question(option1: "Panama", option2: "Canada", option3: "Austria", option4: "France", correctOption: 1, logo: 'img_4'),
];
