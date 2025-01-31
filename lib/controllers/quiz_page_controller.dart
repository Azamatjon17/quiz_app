import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/quiz_model.dart';

class QuizPageController extends GetxController {
  var currentPage = 0.obs;
  var spendTime = 1200.obs;
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();

  PageController get pageController => _pageController;
  ScrollController get scrollController => _scrollController;

  // Funksiya tepadagi sonlarni avtomatik scroll qiladi
  void scrollToCurrentIndex() {
    double offset = (currentPage.value - 2) *
        60.0; // Har bir element kengligi (60.0 misol uchun)
    if (offset < 0) offset = 0; // Salbiy qiymatga yo'l qo'ymaslik
    _scrollController.animateTo(
      offset,
      duration: const Duration(microseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Keyingi sahifaga o'tish
  onNextPage() {
    _pageController.nextPage(
        duration: const Duration(microseconds : 300), curve: Curves.bounceIn);
    currentPage.value++;
    scrollToCurrentIndex();
  }

  onPreviousPage() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    currentPage.value--;
    scrollToCurrentIndex();
  }

  onSelectTestIndex(int index) {
    _pageController.jumpToPage(index);
    currentPage.value = index;
    scrollToCurrentIndex();
  }

  bool checkAllAswerd(List<QuizModel> quizs) {
    for (var i = 0; i < quizs.length; i++) {
      if (quizs[i].isCorrect == null) {
        _pageController.jumpToPage(i);
        currentPage.value = i;
        scrollToCurrentIndex();
        return false;
      }
    }
    return true;
  }

  onChangeByHand(int index) {
    currentPage.value = index;
    scrollToCurrentIndex();
  }
}
