part of 'pageview_bloc.dart';

class PageviewState extends Equatable {
  final Widget myCol;
  const PageviewState({this.myCol = const Text('aaaa')});

  PageviewState copyWith({
    Widget? myCol,
  }) {
    return PageviewState(myCol: myCol ?? this.myCol);
  }

  @override
  List<Object> get props => [myCol];
}
