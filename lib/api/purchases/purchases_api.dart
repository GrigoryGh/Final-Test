import 'package:dio/dio.dart';
import 'package:final_test/models/purchases_model.dart';

class PurchasesApi {
  final Dio appDioClient = Dio();

  Future<List<PurchasesModel>> getPurchasesData() async {
    List<PurchasesModel> purchases = [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/Purchases',
    );

    if (result.data is List) {
      purchases = result.data.first
          .map<PurchasesModel>(
            (e) => PurchasesModel.fromJson(e),
          )
          .toList();
    }

    return purchases;
  }
}
