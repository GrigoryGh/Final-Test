import 'package:dio/dio.dart';
import 'package:final_test/models/quiz_model.dart';

class QuizApi {
  final Dio appDioClient = Dio();

  QuizApi();

  Future<QuizModel> getQuizData() async {
    QuizModel quizData;

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/quiz',
    );

       var res = result.data as Map<String, dynamic>;
    quizData = QuizModel.fromJson(res);
    

    return quizData;
  }
}
