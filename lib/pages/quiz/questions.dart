import 'dart:async';
import 'package:final_test/base/routes.dart';
import 'package:final_test/pages/homepage/home_page.dart';
import 'package:final_test/pages/purchases/purchases_page.dart';
import 'package:final_test/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/quiz_bloc.dart';

PageController controll = PageController();

Timer? timer;
int score = 0;

Widget quizQuestions() {
  return Scaffold(
    body: BlocProvider<QuizBloc>(
      create: (context) => QuizBloc(), //..add(GetQuizList()),
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          BlocProvider.of<QuizBloc>(context).add(GetQuizList());
          if (state is QuizLoaded) {
            return Center(
                child: PageView.builder(
              controller: controll,
              itemCount: state.quizList.questions!.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                int seconds = state.quizList.questions![index].questionSeconds!;
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: colorsList[index],
                  ),
                  body: index == state.quizList.questions!.length
                      ? Text('$score')
                      : Column(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Container(
                                  height: 89,
                                  width: 89,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(83.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TweenAnimationBuilder(
                                      tween: Tween(begin: 0.0, end: 1.0),
                                      duration: Duration(seconds: seconds),
                                      builder: (context, value, _) {
                                        return Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: SizedBox(
                                                height: 89,
                                                width: 89,
                                                child:
                                                    CircularProgressIndicator(
                                                  value: value,
                                                  color: Colors.white,
                                                  backgroundColor:
                                                      colorsList[index],
                                                  strokeWidth: 8,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: TweenAnimationBuilder(
                                                tween: Tween(
                                                    begin: seconds.toDouble(),
                                                    end: 0.0),
                                                duration:
                                                    Duration(seconds: seconds),
                                                builder: (context, valueT, _) {
                                                  var timer = valueT;

                                                  return Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        timer
                                                            .toStringAsFixed(0),
                                                        style: TextStyle(
                                                            fontSize: 24,
                                                            fontFamily:
                                                                'AmericanTypeWriter',
                                                            color: colorsList[
                                                                index]),
                                                      ),
                                                      Text(
                                                        timer
                                                                    .toString()
                                                                    .length <
                                                                5
                                                            ? '.00'
                                                            : '.${timer.toString().substring(3, 5)}',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily:
                                                                'AmericanTypeWriter',
                                                            color: colorsList[
                                                                index]),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      onEnd: () {
                                        controll.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.linear);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                state.quizList.questions![index].questionText
                                    .toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(
                                height: 330,
                                child: ListView.builder(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    itemCount: state.quizList.questions![index]
                                        .answers!.length,
                                    itemBuilder:
                                        (BuildContext context, int ind) {
                                      return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListTile(
                                            tileColor: colorsList[index],
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 8),
                                            onTap: () {
                                              if (index ==
                                                  state.quizList.questions!
                                                          .length -
                                                      1) {
                                                score += seconds;
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ScorePageWidget()),
                                                );
                                              } else if (state
                                                      .quizList
                                                      .questions![index]
                                                      .answers![ind]
                                                      .correctAnswer ==
                                                  true) {
                                                score += seconds;
                                                controll.nextPage(
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.easeIn);
                                              } else {
                                                controll.nextPage(
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.easeIn);
                                              }
                                            },
                                            title: Text(
                                              state.quizList.questions![index]
                                                  .answers![ind].answerText
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                            ),
                                          ));
                                    })),
                            Text('$score')
                          ],
                        ),
                );
              },
            ));
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          }
        },
      ),
    ),
  );
}

class ScorePageWidget extends StatelessWidget {
  const ScorePageWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.green,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('score',
                  style: TextStyle(fontSize: 50, color: Colors.white)),
              Text(
                '$score',
                style: const TextStyle(fontSize: 50, color: Colors.white),
              ),
              const SizedBox(
                height: 100,
              ),
              HomeButton(
                routName: AppRoutes.homepage,
                title: 'Go to HomePage',
                color: Colors.white,
                topRight: 10,
                bottomLeft: 10,
                textColor: Colors.black,
              )
            ],
          ))),
    );
  }
}
