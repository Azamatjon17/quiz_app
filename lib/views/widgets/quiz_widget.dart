import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/quiz/quiz_bloc.dart';
import 'package:quiz_app/bloc/quiz/quiz_event.dart';
import 'package:quiz_app/bloc/quiz/quiz_state.dart';
import 'package:quiz_app/core/constants/app_colors.dart';
import 'package:quiz_app/core/constants/app_text_style.dart';
import 'package:quiz_app/models/quiz_model.dart';

class QuizWidget extends StatefulWidget {
  final Function() onselectAnsewer;
  final QuizModel quizModel;

  const QuizWidget({
    super.key,
    required this.quizModel,
    required this.onselectAnsewer,
  });

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Savol:",
                  style: AppTextStyle.s20w6cB,
                ),
                const SizedBox(height: 8),
                Text(
                  widget.quizModel.question,
                  style: AppTextStyle.s15w4cB,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Javoblar",
            style: AppTextStyle.s15w4cP,
          ),
          const SizedBox(height: 10),
          Column(
            children: widget.quizModel.options.map((option) {
              return Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: widget.quizModel.isCorrect == null
                      ? () {
                          final quizState = context.read<QuizBloc>().state;

                          if (quizState is LoadedQuizState) {
                            context.read<QuizBloc>().add(
                                  SelectedAnsewerEvent(
                                    selectedAnswer: option,
                                    id: widget.quizModel.id,
                                    quizs: quizState.quizs,
                                  ),
                                );
                            widget
                                .onselectAnsewer();
                          }
                        }
                      : null,
                  child: Ink(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: _getOptionColor(option),
                    ),
                    child: Text(
                      option,
                      style: AppTextStyle.s15w4cB,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  /// Determines the color of the answer option based on its correctness.
  Color _getOptionColor(String option) {
    if (widget.quizModel.isCorrect == null) {
      return Colors.white;
    } else if (widget.quizModel.selectedAnswer == option &&
        widget.quizModel.isCorrect!) {
      return AppColors.green;
    } else if (widget.quizModel.selectedAnswer == option &&
        !widget.quizModel.isCorrect!) {
      return AppColors.red;
    }
    return Colors.white;
  }
}
