import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/bloc/quiz/quiz_bloc.dart';
import 'package:quiz_app/bloc/quiz/quiz_event.dart';
import 'package:quiz_app/bloc/quiz/quiz_state.dart';
import 'package:quiz_app/controllers/quiz_page_controller.dart';
import 'package:quiz_app/core/constants/app_icons.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final quizState = context.read<QuizBloc>().state;
    if (quizState is FinshedQuizState) {
      double progress = quizState.percentage / 100; // 50% natija

      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Animatsion progress indikator
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: progress),
                  duration: const Duration(seconds: 2),
                  builder: (context, value, _) => Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: CircularProgressIndicator(
                          value: value,
                          strokeWidth: 10,
                          backgroundColor: Colors.grey.shade300,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              getProgressColor(progress)),
                        ),
                      ),
                      Text(
                        '${(value * 100).toInt()}%',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: getProgressColor(progress)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

           
                const Text(
                  "Yakunlandi",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),

         
                const Text(
                  "Afsuski sizga ball taqdim etilmadi",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),


                const Text(
                  "Ja'mi to'plangan ballaringiz soni: 0 ta",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),

           
                Text(
                  "Umumiy testlar soni: ${quizState.correctAnswers + quizState.unCorrectAnswers}",
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(height: 20),

                // To‘g‘ri va noto‘g‘ri javoblar bloklari
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildResultBox("${quizState.correctAnswers}",
                        "To'g'ri javob", Colors.green.shade100, Colors.green),
                    const SizedBox(width: 10),
                    _buildResultBox("${quizState.unCorrectAnswers}",
                        "Noto'g'ri javob", Colors.red.shade100, Colors.red),
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.timerSvg,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 5),
                    const Text("20:00", style: TextStyle(color: Colors.orange)),
                    const Text("  /  ", style: TextStyle(color: Colors.grey)),
                    Text(
                        "${((quizState.second) ~/ 60).toInt().toString().padLeft(2, '0')}:${(quizState.second % 60).toString().padLeft(2, '0')}",
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 20),

                ElevatedButton.icon(
                  onPressed: () {
                    context.read<QuizBloc>().add(GetQuestionsEvent());
                    Get.find<QuizPageController>().currentPage.value = 0;
                  },
                  icon: const Icon(Icons.refresh, color: Colors.white),
                  label: const Text("Qayta urinish",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  // Natija ko'rsatuvchi quti
  Widget _buildResultBox(
      String value, String label, Color bgColor, Color textColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: textColor),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 14, color: textColor),
            ),
          ],
        ),
      ),
    );
  }

  Color getProgressColor(double progress) {
    if (progress <= 0.2) {
      return Colors.red; // Qizil rang, 0.0 - 0.2 oraliqda
    } else if (progress <= 0.5) {
      return Colors.orange; // Orange rang, 0.2 - 0.5 oraliqda
    } else if (progress <= 0.8) {
      return Colors.yellow; // Sariq rang, 0.5 - 0.8 oraliqda
    } else {
      return Colors.green; // Yashil rang, 0.8 - 1.0 oraliqda
    }
  }
}
