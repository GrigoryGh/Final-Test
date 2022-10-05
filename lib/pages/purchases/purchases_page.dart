import 'package:final_test/pages/purchases/purchases_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurchasesPage extends StatelessWidget {
  const PurchasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PurchasesProvider>(
      create: (context) => PurchasesProvider(),
      child: Scaffold(
        body: Consumer<PurchasesProvider>(
          builder: (context, value, child) {
            return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(value.purchases[index].price.toString()),
                    title: Text(value.purchases[index].title!),
                    onTap: () {},
                  );
                },
                itemCount: value.purchases.length);
          },
        ),
      ),
    );
  }
}
