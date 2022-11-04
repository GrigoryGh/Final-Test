import 'dart:async';

import 'package:final_test/base/routes.dart';
import 'package:final_test/widgets/button_widget.dart';
import 'package:final_test/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const NavigatorDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.red),
        flexibleSpace: SizedBox(
            width: 120,
            height: 120,
            child: Image.asset('assets/images/login.png')),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 400,
            child: GridView(
              primary: false,
              padding: const EdgeInsets.all(30),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              children: [
                HomeButton(
                  routName: AppRoutes.quizPage,
                  color: Colors.purple,
                  topRight: 20,
                  bottomLeft: 20,
                  icon: Icons.play_arrow,
                  title: 'Play Now',
                ),
                HomeButton(
                  routName: AppRoutes.purchasesPage,
                  color: Colors.green,
                  topLeft: 20,
                  bottomRight: 20,
                  icon: Icons.store,
                  title: 'Purchases',
                ),
                HomeButton(
                  routName: AppRoutes.leaderBoardPage,
                  color: Colors.orange,
                  topLeft: 20,
                  bottomRight: 20,
                  icon: Icons.format_list_numbered,
                  title: 'LeaderBoard',
                ),
                HomeButton(
                  routName: AppRoutes.purchasesPage,
                  color: Colors.blue,
                  topRight: 20,
                  bottomLeft: 20,
                  icon: Icons.man,
                  title: 'Profile',
                ),
              ],
            ),
          ),
          SizedBox(
              height: 200, child: Image.asset('assets/images/bunnyTurtle.png'))
        ],
      ),
    );
  }
}

// class HomePageWidget extends StatefulWidget {
//   const HomePageWidget({super.key});

//   @override
//   State<HomePageWidget> createState() => _HomePageWidgetState();
// }

// class _HomePageWidgetState extends State<HomePageWidget> {
//   static const maxSecond = 20;
//   int seconds = maxSecond;
//   Timer? timer;

//   void startTimer() {
//     timer = Timer.periodic(const Duration(seconds: 1), (_) {
//       setState(() => seconds--);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Center(child: Text('$seconds')),
//           ElevatedButton(
//               onPressed: () {
//                 startTimer();
//               },
//               child: Text('Start'))
//         ],
//       ),
//     );
//   }
// }
