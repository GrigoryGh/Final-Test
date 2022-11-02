import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_test/api/leaderboard/leaderboard_api.dart';
import 'package:final_test/models/leaderboard_model.dart';

part 'leaderboard_event.dart';
part 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  LeaderboardBloc() : super(LeaderboardInitial()) {
    final LeaderBoardApi leaderboardAPI = LeaderBoardApi();

    on<GetLeaderboardData>((event, emit) async {
      final leaderBoardList = await leaderboardAPI.getLeaderBoardData();
      emit(LeaderboardLoaded(leaderBoardList));
    });
  }
}
