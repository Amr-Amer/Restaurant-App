import 'package:flutter/material.dart';
import 'package:new_restaurant_app/components/my_drawer_tile.dart';
import 'package:new_restaurant_app/pages/login_page.dart';
import 'package:new_restaurant_app/pages/settings_page.dart';
import 'package:new_restaurant_app/services/auth/auth_service.dart';

import '../themes/strings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          MyDrawerTile(
              text: Strings.instance.home,
              icon: Icons.home,
              onTap: () {
                Navigator.pop(context);
              }),

          MyDrawerTile(
              text: Strings.instance.setting,
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ));
              }),

          const Spacer(),

          MyDrawerTile(
              text: Strings.instance.logOut,
              icon: Icons.logout,
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(
                        onTap: () {},
                      ),
                    ));
              }),

          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
