import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:safe_sense/components/button.dart';
import 'package:safe_sense/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_sense/pages/forgot_pw_page.dart';


class LoginPage extends StatefulWidget{
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {

    //show loading circle
    showDialog(
      context: context, 
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text,
      );
    // pop the loading circle
    } on FirebaseAuthException catch (e) {
      // show Error message
      showErrorMessage(e.code);
      
    }
  }

  void showErrorMessage(String message){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(112,140,105,1),
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            )
          ),
        );
      },
    );
  }




  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(64, 131, 93, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 75),
              Image.asset(
                'assets/images/splash/logo.png', // Path to the image file
                width: 200, // Optional: Set the width of the image
                height: 200, // Optional: Set the height of the image
              ),

          
              const SizedBox(height: 30),

              // const Text(
              //   'Login',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 28,
              //     fontFamily: 'Roboto',
              //     fontWeight: FontWeight.w700
              //     ),
              // ),

              const SizedBox(height: 15),
          
          
              // email textfield
          
            
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
          
              const SizedBox(height: 15),
          
              //password
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
          
              const SizedBox(height: 15),
              // forgot password
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context){
                        return ForgotPasswordPage();
                      },
                    ),
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color.fromARGB(244, 158, 208, 249),
                    fontWeight: FontWeight.bold)
                ),
              ),
          
              const SizedBox(height: 30),
          
              // Button
              Button(
                text: "Sign In",
                onTap: signUserIn,
              ),
          
              const SizedBox(height: 15),
              // Register
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member? ',
                    style: TextStyle(
                      color: Color.fromARGB(229, 254, 254, 254),
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Color.fromARGB(244, 158, 208, 249),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
          
          ]),
        ),
      ),
    );
  }
}