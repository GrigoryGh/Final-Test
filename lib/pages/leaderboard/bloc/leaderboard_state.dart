part of 'leaderboard_bloc.dart';

abstract class LeaderboardState {
  const LeaderboardState();
}

class LeaderboardInitial extends LeaderboardState {}

class LeaderboardLoaded extends LeaderboardState {
  final List<LeaderBoardModel> leaderList;
  const LeaderboardLoaded(this.leaderList);
}
