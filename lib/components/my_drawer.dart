import 'package:app_chat_fighting/pages/favourite_page.dart';
import 'package:app_chat_fighting/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../service/service/auth/auth_service.dart';

class MyDarwer extends StatelessWidget {
  const MyDarwer({super.key});
  void logout() {
    final authService = AuthService();
    try {
      authService.logout();
    } catch (e) {
      throw "is log out";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //logo
          DrawerHeader(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide.none),
            ),
            child: Center(
              child: Lottie.asset(
                "assets/drawer_animate.json",
              ),
            ),
          ),
          // const SizedBox(height: 8),
          //home
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: const Text("H O M E"),
              leading: const Icon(Icons.home),
              onTap: () {
                //pop the drawer
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: const Text("F A V O U R I T E"),
              leading: const Icon(Icons.favorite),
              onTap: () {
                //pop the drawer
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FavouritePage(),
                ));
              },
            ),
          ),
          //setting list title
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: const Text("S E T T I N G S"),
              leading: const Icon(Icons.settings),
              onTap: () {
                //pop the drawer
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingPage(),
                  ),
                );
              },
            ),
          ),
          //logout lisst title
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 25),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
