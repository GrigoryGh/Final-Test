import 'dart:math';

import 'package:final_test/pages/leaderboard/bloc/leaderboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/leaderboard_model.dart';

class LeaderBoardPage extends StatelessWidget {
  const LeaderBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LeaderBoard'),
        backgroundColor: Colors.orange,
      ),
      body: BlocProvider(
        create: (context) => LeaderboardBloc()..add(GetLeaderboardData()),
        child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
          builder: (context, state) {
            if (state is LeaderboardLoaded) {
              return _buildBoard(context, state.leaderList);
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.orange,
              ));
            }
          },
        ),
      ),
    );
  }
}

Widget _buildBoard(BuildContext context, List<LeaderBoardModel> mList) {
  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: (() {}),
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Color.fromARGB(
                        255, Random().nextInt(255), Random().nextInt(255), 0),
                    child: Text(
                      mList[index].firstName![0].toString(),
                      style: const TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                ),
                Text(
                  mList[index].firstName.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
            leading: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                '${(index + 1).toString()}.',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            trailing: Text(
              mList[index].score.toString(),
              style: const TextStyle(fontSize: 20),
            ),
          ),
        );
      },
      itemCount: mList.length,
    ),
  );
}
