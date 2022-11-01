import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_test/api/purchases/purchases_api.dart';
import 'package:final_test/models/purchases_model.dart';
import 'package:meta/meta.dart';

part 'purchases_event.dart';
part 'purchases_state.dart';

class PurchasesBloc extends Bloc<PurchasesEvent, PurchasesState> {
  PurchasesBloc() : super(PurchasesInitial()) {
    final PurchasesApi _purchasesApi = PurchasesApi();

    on<GetPurchasesList>(((event, emit) async {
      emit(PurchasesLoading());
      final mList = await _purchasesApi.getPurchasesData();
      emit(PurchasesLoaded(mList));
    }));
  }
}
