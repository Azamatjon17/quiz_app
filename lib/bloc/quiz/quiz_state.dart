import 'package:quiz_app/models/quiz_model.dart';

abstract class QuizState {}

class InitialQuizState extends QuizState {}

class LoadingQuizState extends QuizState {}

class LoadedQuizState extends QuizState {
  List<QuizModel> quizs;
  LoadedQuizState({required this.quizs});
}

class FinshedQuizState extends QuizState {
  int correctAnswers;
  int unCorrectAnswers;
  double percentage;
  int second;

  FinshedQuizState({
    required this.correctAnswers,
    required this.percentage,
    required this.second,
    required this.unCorrectAnswers,
  });
}

class ErrorQuizState extends QuizState {
  final String message;
  ErrorQuizState({required this.message});
}
