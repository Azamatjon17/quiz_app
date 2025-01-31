import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quiz_app/bloc/quiz/quiz_bloc.dart';
import 'package:quiz_app/bloc/quiz/quiz_state.dart';
import 'package:quiz_app/controllers/quiz_page_controller.dart';
import 'package:quiz_app/core/constants/app_colors.dart';

class CustomPageNumbersWidget extends StatelessWidget {
  const CustomPageNumbersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final quizPageController = Get.find<QuizPageController>();
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is LoadedQuizState) {
          return ListView.separated(
            controller: quizPageController.scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: state.quizs.length,
            itemBuilder: (context, index) {
              final isCorrect = state.quizs[index].isCorrect;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => quizPageController.currentPage.value == index
                        ? const Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.blue,
                            size: 24,
                          )
                        : const SizedBox(height: 25),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      quizPageController.onSelectTestIndex(index);
                    },
                    child: Ink(
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: isCorrect == null
                            ? Colors.white
                            : isCorrect
                                ? AppColors.green
                                : AppColors.red,
                      ),
                      child: Center(
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                            color:
                                isCorrect == null ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
