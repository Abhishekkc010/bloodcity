import 'package:applicationtwo/Profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
import 'View.dart';
import 'requestblood.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final auth = FirebaseAuth.instance;

  signOut() async {
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFC66868),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.book,
                    size: 40,
                    color: Colors.white,
                  ),
                  Text(
                    'Application',
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.add_circle_outlined,
                color: Colors.black,
              ),
              title: const Text(
                'Request Blood',
              ),
              onTap: () {
                Navigator.pushNamed(context, AddProduct.id);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.add_circle_outlined,
                color: Colors.black,
              ),
              title: const Text(
                'View Blood Request',
              ),
              onTap: () {
                Navigator.pushNamed(context, View.id);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: const Text(
                'Profile',
              ),
              onTap: () async {
                await signOut();
                if (auth.currentUser == null) {
                  Navigator.pushNamed(context, ProfileApp.id);
                }
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: const Text(
                'Logout',
              ),
              onTap: () async {
                await signOut();
                if (auth.currentUser == null) {
                  Navigator.pushNamed(context, Login.id);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
