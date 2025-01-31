import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/quiz/quiz_event.dart';
import 'package:quiz_app/bloc/quiz/quiz_state.dart';
import 'package:quiz_app/models/quiz_model.dart';
import 'package:quiz_app/services/quiz_servise.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizService quizServise = QuizService();

  QuizBloc() : super(InitialQuizState()) {
    on<GetQuestionsEvent>(_onGetquizs);
    on<SelectedAnsewerEvent>(_onSelectAnswer);
    on<CompateQuizEvent>(_onComplate);
  }

  _onGetquizs(GetQuestionsEvent event, Emitter<QuizState> emit) async {
    emit(LoadingQuizState());
    try {
      final quizs = await quizServise.getQuizzes();
      emit(LoadedQuizState(quizs: quizs));
    } catch (e) {
      emit(ErrorQuizState(message: e.toString()));
    }
  }

  _onSelectAnswer(SelectedAnsewerEvent event, Emitter<QuizState> emit) {
    int index = event.quizs.indexWhere(
      (element) => element.id == event.id,
    );
    event.quizs[index].selectedAnswer = event.selectedAnswer;
    if (event.quizs[index].answer == event.selectedAnswer) {
      event.quizs[index].isCorrect = true;
    } else {
      event.quizs[index].isCorrect = false;
    }
  }

  _onComplate(CompateQuizEvent event, Emitter<QuizState> emit) {
    int correctAnswers = 0;
    int unCorrectAnswers = 0;
    for (QuizModel quizModel in event.quizModels) {
      if (quizModel.isCorrect != null && quizModel.isCorrect!) {
        correctAnswers++;
      } else {
        unCorrectAnswers++;
      }
    }
    double percentage = (correctAnswers / event.quizModels.length) * 100;

    emit(
      FinshedQuizState(
        correctAnswers: correctAnswers,
        percentage: percentage,
        second: event.spendSeconds,
        unCorrectAnswers: unCorrectAnswers,
      ),
    );
  }
}
