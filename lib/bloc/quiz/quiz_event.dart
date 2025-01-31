import 'package:quiz_app/models/quiz_model.dart';

class QuizEvent {}

class SelectedAnsewerEvent extends QuizEvent {
  List<QuizModel> quizs;
  String selectedAnswer;
  int id;
  SelectedAnsewerEvent(
      {required this.selectedAnswer, required this.id, required this.quizs});
}

class GetQuestionsEvent extends QuizEvent {}

class CompateQuizEvent extends QuizEvent {
  List<QuizModel> quizModels;
  int spendSeconds;

  CompateQuizEvent({required this.quizModels, required this.spendSeconds});
}
