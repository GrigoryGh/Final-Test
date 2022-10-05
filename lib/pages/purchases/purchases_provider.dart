import 'package:final_test/api/app_api.dart';
import 'package:final_test/models/purchases_model.dart';
import 'package:flutter/material.dart';

class PurchasesProvider extends ChangeNotifier {
  bool isLoading = true;
  bool isGrid = true;
  List<PurchasesModel> purchases = [];

  PurchasesProvider() {
    getData();
  }

  void getData() async {
    purchases = await TestAPI().purchases.getPurchasesData();
    notifyListeners();
  }
}
