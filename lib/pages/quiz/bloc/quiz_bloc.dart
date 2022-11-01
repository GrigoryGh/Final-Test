import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_test/models/quiz_model.dart';

import '../../../api/quiz/quiz_api.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    final QuizApi quizApi = QuizApi();

    on<GetQuizList>(((event, emit) async {
      
      final mList = await quizApi.getQuizData();
      emit(QuizLoaded(mList));
    }));
  }
}
