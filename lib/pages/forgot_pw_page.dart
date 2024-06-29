import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safe_sense/components/my_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  //text editing controllers
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try {
      await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            content: Text('Password Reset link sent! Check your email'),
          );
      });

    } on FirebaseAuthException catch(e){
      print(e);
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 43, 29, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(18, 43, 29, 1),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the back button color here
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 75),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Enter the email address associated with your account, and we will send you a link to reset your password.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15
              ),
              textAlign: TextAlign.center,
            ),
          ),
          
          const SizedBox(height: 15),

              // email textfield
          MyTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),

          const SizedBox(height: 20),

          MaterialButton(
            onPressed: passwordReset,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: const Text(
              'Reset Password',
              style: TextStyle(
                color: Color.fromRGBO(18, 43, 29, 1),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      );
  }
}