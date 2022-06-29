import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lorakahnmovietips_app/main.dart';
import 'package:lorakahnmovietips_app/constants.dart';
import 'package:lorakahnmovietips_app/pages/auth/utils.dart';
import 'package:lorakahnmovietips_app/pages/forgotpassword/forgot_password_page.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Image.asset(
                  'assets/icons/logo.png',
                ),
                onPressed: () {},
              ),
              Text('lorakahn Movie Tips',
                  style: GoogleFonts.bebasNeue(fontSize: 30)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: emailController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'Enter e-mail'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  controller: passwordController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration:
                      const InputDecoration(labelText: 'Enter password'),
                  obscureText: true,
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 1, 215, 191),
                  minimumSize: const Size.fromHeight(50),
                ),
                icon: const Icon(
                  Icons.lock_open,
                  size: 32,
                ),
                label: const Text(
                  'Log in',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: signIn,
              ),
              GestureDetector(
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: kAppDrawerColor,
                      fontSize: 20),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ForgotPasswordpage(),
                )),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  text: "Don't you have an account?  ",
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignUp,
                      text: 'Sign Up',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: kAppDrawerColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
