part of 'purchases_bloc.dart';

@immutable
abstract class PurchasesEvent extends Equatable {
  const PurchasesEvent();
  @override
  List<Object> get props => [];
}

class GetPurchasesList extends PurchasesEvent {}
