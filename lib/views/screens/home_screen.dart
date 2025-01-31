import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/bloc/quiz/quiz_bloc.dart';
import 'package:quiz_app/bloc/quiz/quiz_event.dart';
import 'package:quiz_app/bloc/quiz/quiz_state.dart';
import 'package:quiz_app/controllers/quiz_page_controller.dart';
import 'package:quiz_app/core/constants/app_colors.dart';
import 'package:quiz_app/core/constants/app_icons.dart';
import 'package:quiz_app/core/constants/app_text_style.dart';
import 'package:quiz_app/views/screens/result_screen.dart';
import 'package:quiz_app/views/widgets/custom_appbar.dart';
import 'package:quiz_app/views/widgets/custom_bottom.dart';
import 'package:quiz_app/views/widgets/custom_page_numbers_widget.dart';
import 'package:quiz_app/views/widgets/quiz_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // GetQuestionsEvent ni QuizBloc orqali yuklash
    context.read<QuizBloc>().add(GetQuestionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    // QuizPageController-ni topish
    final quizPageController = Get.find<QuizPageController>();

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<QuizBloc, QuizState>(
          builder: (context, state) {
            if (state is LoadingQuizState) {
              // Yuklanayotgan holat
              return const Center(child: CircularProgressIndicator());
            } else if (state is FinshedQuizState) {
              // Test tugagan holat
              return const ResultScreen();
            } else if (state is LoadedQuizState) {
              // Savollar yuklangan holat
              return Column(
                children: [
                  const CustomAppbar(),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 80,
                    // ignore: prefer_const_constructors
                    child: CustomPageNumbersWidget(),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: PageView.builder(
                      controller: quizPageController.pageController,
                      itemCount: state.quizs.length,
                      onPageChanged: (value) {
                        quizPageController.onChangeByHand(value);
                      },
                      itemBuilder: (context, index) {
                        return QuizWidget(
                          quizModel: state.quizs[index],
                          onselectAnsewer: () {
                            setState(() {
                              // Update the parent widget state
                            });
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Obx(
                      () => quizPageController.currentPage.value ==
                              state.quizs.length - 1
                          ? CustomBottom(
                              onTap: () {
                                if (quizPageController
                                    .checkAllAswerd(state.quizs)) {
                                  context.read<QuizBloc>().add(CompateQuizEvent(
                                        quizModels: state.quizs,
                                        spendSeconds:
                                            quizPageController.spendTime.value,
                                      ));
                                }
                              },
                              title: "Testni yakunlash",
                              color: AppColors.blue,
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Oldingi sahifa tugmasi
                                IconButton(
                                  onPressed:
                                      quizPageController.currentPage.value > 1
                                          ? quizPageController.onPreviousPage
                                          : null,
                                  icon: SvgPicture.asset(AppIcons.arrowLeftSvg),
                                ),
                                // Joriy sahifa raqami
                                Text(
                                  "${quizPageController.currentPage.value + 1}/${state.quizs.length}",
                                  style: AppTextStyle.s15w4cP,
                                ),
                                // Keyingi sahifa tugmasi
                                IconButton(
                                  onPressed: () {
                                    quizPageController.onNextPage();
                                  },
                                  icon:
                                      SvgPicture.asset(AppIcons.arrowRightSvg),
                                ),
                              ],
                            ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              );
            }
            // Ma'lumot bo'lmagan holat
            return const Center(
              child: Text("Hech qanday ma'lumot yo'q"),
            );
          },
        ),
      ),
    );
  }
}
