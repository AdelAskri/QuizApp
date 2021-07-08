import 'questions.dart';

class QuizBrain {
  int _questionNumber = 0;
  bool _finished = false;
  int _rightAnswer=0;
  List<Question> _questionsList = [
    //TODO put your questions that you want to change and their answer here
    Question('Question 1', true),
    Question('Question 2', false),
    Question('Question 3', true),
    Question('Question 4', false),
    Question('Question 5', false),
    Question('Question 6', true),
  ];

  String getQuestion() {
    return _questionsList[_questionNumber].question;
  }

  bool getAnswer() {
    return _questionsList[_questionNumber].answer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionsList.length - 1) {
      _questionNumber++;
    } else {
      _finished = true;
    }
  }

  bool isFinished() {
    return _finished;
  }

  void resetQuestionNumber() {
    _questionNumber = 0;
    _rightAnswer = 0;
    _finished = false;
  }
  int getRightAnswer() {
    return _rightAnswer;
  }
  void incrementRightAnswer(){
    _rightAnswer++;
  }
  int getQuestionsLength(){
    return _questionsList.length;
  }
}
