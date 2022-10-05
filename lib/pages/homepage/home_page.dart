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
        iconTheme: IconThemeData(color: Colors.red),
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
      child: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(30),
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        crossAxisCount: 2,
        children: [
          HomeButton(
            color: Colors.purple,
            topRight: 20,
            bottomLeft: 20,
            icon: Icons.play_arrow,
            title: 'Play Now',
          ),
          HomeButton(
            color: Colors.green,
            topLeft: 20,
            bottomRight: 20,
            icon: Icons.store,
            title: 'Purchases',
          ),
          HomeButton(
            color: Colors.orange,
            topLeft: 20,
            bottomRight: 20,
            icon: Icons.format_list_numbered,
            title: 'Leaderboard',
          ),
          HomeButton(
            color: Colors.blue,
            topRight: 20,
            bottomLeft: 20,
            icon: Icons.man,
            title: 'Profile',
          ),
        ],
      ),
    );
  }
}
