import 'package:dio/dio.dart';
import 'package:final_test/models/leaderboard_model.dart';

class LeaderBoardApi {
  final Dio appDioClient = Dio();

  LeaderBoardApi();

  Future<List<LeaderBoardModel>> getLeaderBoardData() async {
    List<LeaderBoardModel> leaderBoard = [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/leaderboard',
    );

    if (result.data is List) {
      leaderBoard = result.data
          .map<LeaderBoardModel>(
            (e) => LeaderBoardModel.fromJson(e),
          )
          .toList();
    }

    return leaderBoard;
  }
}
