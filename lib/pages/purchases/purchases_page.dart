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
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.green),
          backgroundColor: Colors.white,
          title: Text(
            'Purchases',
            style: TextStyle(color: Colors.green),
          ),
        ),
        body: Consumer<PurchasesProvider>(
          builder: (context, value, child) {
            return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      leading: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            value.purchases[index].playsCount.toString(),
                            style: const TextStyle(color: Colors.white),
                          )),
                      trailing: Text(
                        '\$${value.purchases[index].price.toString()}',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 64, 117),
                            fontSize: 30),
                      ),
                      title: Text(
                        value.purchases[index].title!,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 64, 117)),
                      ),
                      subtitle: Text(value.purchases[index].subTitle ?? ''),
                      onTap: () {},
                    ),
                  );
                },
                itemCount: value.purchases.length);
          },
        ),
      ),
    );
  }
}
