import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lorakahnmovietips_app/constants.dart';
import 'package:lorakahnmovietips_app/pages/about/about_page.dart';
import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/pages/profile/profile_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kAppDrawerColor,
      child: Column(
        children: <Widget>[
          DrawerHeader(
              child: Column(
            children: [
              Image.asset(
                'assets/images/su_vector.png',
                height: 100,
                width: 100,
              ),
            ],
          )),
          Card(
            color: kPrimaryColor,
            child: ListTile(
              leading: Icon(
                Icons.account_box_outlined,
                color: Color.fromARGB(255, 219, 196, 196),
              ),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => (ProfilePage())),
                );
              },
            ),
          ),
          Card(
            color: kPrimaryColor,
            child: ListTile(
              leading: Icon(
                Icons.info,
                color: Color.fromARGB(255, 219, 196, 196),
              ),
              title: Text(
                'About',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => (AboutPage())),
                );
              },
            ),
          ),
          Card(
            color: kPrimaryColor,
            child: ListTile(
              leading: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 219, 196, 196),
              ),
              title: Text(
                'Sing Out',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => FirebaseAuth.instance.signOut(),
            ),
          ),
          Card(
            color: kPrimaryColor,
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Color.fromARGB(255, 219, 196, 196),
              ),
              title: Text(
                'Exit',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                exit(0);
              },
            ),
          ),
        ],
      ),
    );
  }
}
