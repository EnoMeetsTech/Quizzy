import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question(
      'The atomic number for lithium is 17',
      false,
    ),
    Question(
      'The black box in a plane is black',
      false,
    ),
    Question(
      'H&M stands for Hennes & Mauritz',
      true,
    ),
    Question(
      'Hot and cold water sound the same when poured.',
      false,
    ),
    Question(
      'There are two parts of the body that cannot heal themselves',
      false,
    ),
    Question(
      'In Harry Potter, Draco Malfoy has no siblings',
      false,
    ),
    Question(
      'Spaghetto is the singular word for a piece of spaghetti',
      true,
    ),
    Question(
      'Goldfish have a two second memory',
      false,
    ),
    Question(
      'An octopus has three hearts',
      true,
    ),
    Question(
      'Australia is wider than the moon',
      true,
    ),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    if (isFinished()) {
      _questionNumber = 0;
    }
  }
}
