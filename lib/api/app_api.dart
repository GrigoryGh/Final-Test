import 'package:dio/dio.dart';
import 'package:final_test/api/leaderboard/leaderboard_api.dart';
import 'package:final_test/api/purchases/purchases_api.dart';
import 'package:final_test/api/quiz/quiz_api.dart';

class TestAPI {
  static TestAPI? _singleton;
  late PurchasesApi purchases;
  late LeaderBoardApi leaderBoard;
  late QuizApi quiz;
  Dio appDioClient = Dio();

  factory TestAPI() {
    _singleton ??= TestAPI._internal();
    return _singleton!;
  }

  TestAPI._internal() {
    purchases = PurchasesApi(appDioClient);
    leaderBoard = LeaderBoardApi(appDioClient);
    quiz = QuizApi(appDioClient);
  }
}
