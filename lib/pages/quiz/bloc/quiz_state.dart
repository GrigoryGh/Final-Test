part of 'quiz_bloc.dart';

abstract class QuizState {
  const QuizState();
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final QuizModel quizList;
  const QuizLoaded(this.quizList);
}
