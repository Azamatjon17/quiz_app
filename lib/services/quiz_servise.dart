import 'package:quiz_app/models/quiz_model.dart';
import 'package:quiz_app/services/dio_client.dart';

class QuizService {
  final dioClient = DioClient();

  Future<List<QuizModel>> getQuizzes() async {
    try {
      final response = await dioClient.get('/quizzes.json');

      // Ma'lumotni qayta ishlash
      List<dynamic> data = response.data;

      // `QuizModel` ro'yxatini shakllantirish
      List<QuizModel> quizzes = data
          .where((element) =>
              element != null) // `null` qiymatlarni chiqarib tashlaymiz
          .map((quiz) => QuizModel.fromMap(quiz as Map<String, dynamic>))
          .toList();

      return quizzes;
    } catch (e) {
      rethrow;
    }
  }
}
