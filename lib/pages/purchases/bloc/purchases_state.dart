part of 'purchases_bloc.dart';

@immutable
abstract class PurchasesState extends Equatable {
  const PurchasesState();

  @override
  List<Object?> get props => [];
}

class PurchasesInitial extends PurchasesState {}

class PurchasesLoading extends PurchasesState {}

class PurchasesLoaded extends PurchasesState {
  final List<PurchasesModel> purchasesList;
  const PurchasesLoaded(this.purchasesList);
}
