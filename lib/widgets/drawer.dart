import 'package:flutter/material.dart';

class NavigatorDrawer extends StatelessWidget {
  const NavigatorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              drawerTile(
                'Score',
                Icons.score,
              ),
              drawerTile(
                'Prize Payout',
                Icons.card_membership,
              ),
              drawerTile(
                'Rules',
                Icons.document_scanner,
              ),
              drawerTile(
                'Support',
                Icons.phone_missed_sharp,
              ),
              drawerTile(
                'About',
                Icons.warning,
              ),
              drawerTile(
                'Buy Our Book',
                Icons.book,
              ),
              drawerTile(
                'Sign Out',
                Icons.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget drawerTile(text, icon) {
  return ListTile(
    title: Text(text),
    leading: Icon(
      icon,
      color: Colors.red,
      size: 40,
    ),
    onTap: () {},
  );
}
