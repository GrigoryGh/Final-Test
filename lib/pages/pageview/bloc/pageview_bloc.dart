import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../pageview.dart';

part 'pageview_event.dart';
part 'pageview_state.dart';

Widget col() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SmoothPageIndicator(
            controller: controller,
            count: 4,
            effect: SwapEffect(),
            onDotClicked: ((index) {
              
                controller.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear);
              
            }),
          ),
        ),
      )
    ],
  );
}

class PageviewBloc extends Bloc<PageviewEvent, PageviewState> {
  PageviewBloc() : super(PageviewState()) {
    on<ShowDots>((event, emit) {
      emit(state.copyWith(myCol: event.i == 3 ? SizedBox() : col()));
    });
  }
}
