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
  Colors.blue,
  Colors.red,
  Colors.yellow,
  Colors.purple,
  Colors.green,
];
Widget _buildCard(BuildContext context, List<PurchasesModel> modelList) {
  return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: Stack(alignment: Alignment.center, children: [
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: colorsList[index],
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  child: Column(
                    children: [
                      Text(
                        modelList[index].playsCount.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Text(
                        'Plays',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ))
            ]),
            trailing: Text(
              '\$${modelList[index].price.toString()}',
              style: TextStyle(color: colorsList[index], fontSize: 30),
            ),
            title: Text(
              modelList[index].title!,
              style: TextStyle(color: colorsList[index]),
            ),
            subtitle: Text(modelList[index].subTitle ?? ''),
            onTap: () {},
          ),
        );
      },
      itemCount: modelList.length);
}
