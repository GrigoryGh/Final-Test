import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../pageview_dots.dart';
part 'pageview_event.dart';
part 'pageview_state.dart';



class PageviewBloc extends Bloc<PageviewEvent, PageviewState> {
  PageviewBloc() : super(const PageviewState()) {
    on<ShowDots>((event, emit) {
      emit(state.copyWith(myCol: event.i == 3 ? const SizedBox() : col()));
    });
  }
}
