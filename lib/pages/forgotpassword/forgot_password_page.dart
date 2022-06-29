import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/constants.dart';
import 'package:lorakahnmovietips_app/pages/auth/utils.dart';

class ForgotPasswordpage extends StatefulWidget {
  const ForgotPasswordpage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordpage> createState() => _ForgotPasswordpageState();
}

class _ForgotPasswordpageState extends State<ForgotPasswordpage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text(
          'Reset Password',
          style: TextStyle(color: kSecondaryColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Recieve an email to reset your password.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: 'E-mail'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid e-mail'
                        : null,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 1, 215, 191),
                  minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(Icons.email_outlined),
                label: Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  resetPassword();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Utils.showSnackBar('Password reset e-mail sent!');
      Navigator.of(context).popUntil((route) => route.isActive);
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}
