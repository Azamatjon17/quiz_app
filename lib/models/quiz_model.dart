import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class QuizModel extends Equatable {
  int id;

  String question;
  String answer;
  List<String> options;
  bool? isCorrect;
  String? selectedAnswer;

  QuizModel({
    required this.id,
    required this.answer,
    required this.options,
    required this.question,
  });

    // fromMap method
  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      id: map['id'] as int,
      question: map['question'] as String,
      answer: map['answer'] as String,
      options: List<String>.from(map['options'] as List<dynamic>),
    );
  }
  @override
  List<Object?> get props => [question];
}
