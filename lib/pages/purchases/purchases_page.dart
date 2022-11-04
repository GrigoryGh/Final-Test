import 'package:final_test/models/purchases_model.dart';
import 'package:final_test/pages/purchases/bloc/purchases_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchasesPage extends StatelessWidget {
  const PurchasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.green),
        backgroundColor: Colors.white,
        title: const Text(
          'Purchases',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: BlocProvider(
        create: (context) => PurchasesBloc()..add(GetPurchasesList()),
        child: BlocBuilder<PurchasesBloc, PurchasesState>(
          builder: (context, state) {
            if (state is PurchasesLoaded) {
              return _buildCard(context, state.purchasesList);
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.green,
              ));
            }
          },
        ),
      ),
    );
  }
}

List colorsList = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.purple,
  Colors.yellow
];
Widget _buildCard(BuildContext context, List<PurchasesModel> modelList) {
  return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: colorsList[index],
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  modelList[index].playsCount.toString(),
                  style: const TextStyle(color: Colors.white),
                )),
            trailing: Text(
              '\$${modelList[index].price.toString()}',
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 64, 117), fontSize: 30),
            ),
            title: Text(
              modelList[index].title!,
              style: const TextStyle(color: Color.fromARGB(255, 0, 64, 117)),
            ),
            subtitle: Text(modelList[index].subTitle ?? ''),
            onTap: () {},
          ),
        );
      },
      itemCount: modelList.length);
}
