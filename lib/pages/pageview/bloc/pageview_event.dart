part of 'pageview_bloc.dart';

abstract class PageviewEvent extends Equatable {
  const PageviewEvent();

  @override
  List<Object> get props => [];
}

class ShowDots extends PageviewEvent {
   int i;
  ShowDots(this.i);
}
