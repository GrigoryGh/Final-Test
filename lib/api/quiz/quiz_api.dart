import 'package:dio/dio.dart';
import 'package:final_test/models/quiz_model.dart';

class QuizApi {
  final Dio appDioClient;

  QuizApi(
    this.appDioClient,
  );

  Future<List<QuizModel>> getPurchasesData() async {
    List<QuizModel> quiz= [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/Purchases',
    );

    if (result.data is List) {
      quiz= result.data.first
          .map<QuizModel>(
            (e) => QuizModel.fromJson(e),
          )
          .toList();
    }

    return quiz;
  }
}