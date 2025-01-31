import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/bloc/quiz/quiz_bloc.dart';
import 'package:quiz_app/bloc/quiz/quiz_event.dart';
import 'package:quiz_app/bloc/quiz/quiz_state.dart';
import 'package:quiz_app/controllers/quiz_page_controller.dart';
import 'package:quiz_app/core/constants/app_icons.dart';
import 'package:quiz_app/core/constants/app_text_style.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  late CountdownController countdownController;

  @override
  void initState() {
    super.initState();
    countdownController = CountdownController(autoStart: true);
  }

  @override
  Widget build(BuildContext context) {
    final quizPageController = Get.find<QuizPageController>();
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.logOutSvg),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.chatAlertSvg),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.nightSvg),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xffF1F3F7)),
            child: Countdown(
              controller: countdownController,
              seconds: 1200,
              onFinished: () {
                final blocState = context.read<QuizBloc>().state;
                if (blocState is LoadedQuizState) {
                  context.read<QuizBloc>().add(CompateQuizEvent(
                      quizModels: blocState.quizs, spendSeconds: 1200));
                }
              },
              build: (context, timeLeft) {
                final min = timeLeft ~/ 60;
                final sec = timeLeft % 60;
                String minutesStr = min.toStringAsFixed(0).padLeft(2, '0');
                String secondsStr = sec.toStringAsFixed(0).padLeft(2, '0');
                quizPageController.spendTime.value = timeLeft.toInt();
                return Row(
                  children: [
                    SvgPicture.asset(AppIcons.timerSvg),
                    const SizedBox(width: 5),
                    Text("$minutesStr:$secondsStr",
                        style: AppTextStyle.s15w4cB),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
