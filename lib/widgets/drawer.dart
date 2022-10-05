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
              ListTile(
                title: const Text('Scores'),
                leading: const Icon(
                  Icons.score,
                  color: Colors.red,
                  size: 40,
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Prize Payout'),
                leading: const Icon(
                  Icons.card_membership,
                  color: Colors.red,
                  size: 40,
                ),
                onTap: () {},
              ),
              ListTile(
                  title: const Text('Rules'),
                  leading: const Icon(
                    Icons.document_scanner,
                    color: Colors.red,
                    size: 40,
                  ),
                  onTap: () {}),
              ListTile(
                title: const Text('Support'),
                leading: const Icon(
                  Icons.phone_missed_sharp,
                  color: Colors.red,
                  size: 40,
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text('About'),
                leading: const Icon(
                  Icons.warning,
                  color: Colors.red,
                  size: 40,
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Buy Our Book'),
                leading: const Icon(
                  Icons.book,
                  color: Colors.red,
                  size: 40,
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Sign Out'),
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 40,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
