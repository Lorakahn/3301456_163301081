import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/pages/home/home_page.dart';
import 'package:lorakahnmovietips_app/constants.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Image.asset(
                    "assets/icons/logo.png",
                  ),
                ),
                padding: const EdgeInsets.all(20),
              ),
              Text(
                "lorakahn Movie Tips",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 50,
              ),
              const Text("Signed in as:", style: TextStyle(fontSize: 20)),
              SizedBox(
                height: 8,
              ),
              Text(
                user.email!,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
