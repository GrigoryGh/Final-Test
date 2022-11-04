import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/quiz_bloc.dart';

PageController controll = PageController();

final List<Widget> myList = [
  Container(
    color: Colors.orange,
    child: const Center(
      child: Text(
        'Get Ready',
        style: TextStyle(fontSize: 80, color: Colors.white),
      ),
    ),
  ),
  Container(
    color: Colors.blue,
    child: const Center(
      child: Text(
        '5',
        style: TextStyle(fontSize: 80, color: Colors.white),
      ),
    ),
  ),
  Container(
    color: const Color.fromARGB(255, 255, 230, 0),
    child: const Center(
      child: Text(
        '4',
        style: TextStyle(fontSize: 80, color: Colors.white),
      ),
    ),
  ),
  Container(
    color: const Color.fromARGB(255, 24, 201, 29),
    child: const Center(
      child: Text(
        '3',
        style: TextStyle(fontSize: 80, color: Colors.white),
      ),
    ),
  ),
  Container(
    color: Colors.orange,
    child: const Center(
      child: Text(
        '2',
        style: TextStyle(fontSize: 80, color: Colors.white),
      ),
    ),
  ),
  Container(
    color: Colors.purple,
    child: const Center(
      child: Text(
        '1',
        style: TextStyle(fontSize: 80, color: Colors.white),
      ),
    ),
  ),
  Container(
    color: const Color.fromARGB(255, 12, 195, 18),
    child: const Center(
      child: Text(
        'GO!',
        style: TextStyle(fontSize: 80, color: Colors.white),
      ),
    ),
  ),
  quizQuestions(),
];

Widget quizQuestions() {
  return Scaffold(
    body: BlocProvider<QuizBloc>(
      create: (context) => QuizBloc()..add(GetQuizList()),
      child: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizLoaded) {
            return Center(
                child: PageView.builder(
              controller: controll,
              itemCount: state.quizList.questions!.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.orange,
                  ),
                  body: Column(
                    children: [
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
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              itemCount: state
                                  .quizList.questions![index].answers!.length,
                              itemBuilder: (BuildContext context, int ind) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      tileColor: Colors.orange,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 8),
                                      onTap: () {
                                        if (index ==
                                            state.quizList.questions!.length -
                                                1) {
                                          Navigator.of(context).pop();
                                        } else {
                                          controll.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 10),
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
                              }))
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
