import 'package:flutter/widgets.dart';
import 'package:safe_sense/components/button.dart';
import 'package:safe_sense/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sms/flutter_sms.dart';


class RegisterPage extends StatefulWidget{
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final contactNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final urlController =  TextEditingController();
  final registeredContactController = TextEditingController();

  // sign user up method
  void signUserUp() async {

    //show loading circle
    showDialog(
      context: context, 
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try creating the user
    try {
      UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
     );
      // Save additional user information to Firestore
      await FirebaseFirestore.instance.collection('Users').doc(userCredential.user!.email).set({
        'username': usernameController.text,
        'email': emailController.text,
        'contact': contactNumberController.text,
        'url': urlController.text,
        'registeredContact': registeredContactController.text,
      });
      // //send sms
      // String message = "This is a test message!";
      // List<String> recipents = [contactNumberController.toString()];
      // _sendSMS(message, recipents);

    
    } on FirebaseException catch (e) {
        // pop the loading circle
      Navigator.pop(context);

      // show Error message
      showErrorMessage(e.code);
      
    }
  }

  // void _sendSMS(String message, List<String> recipents) async {
  //   String _result = await sendSMS(message: message, recipients: recipents)
  //           .catchError((onError) {
  //         print(onError);
  //       });
  //   print(_result);
  // }

  void showErrorMessage(String message){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: const Color.fromRGBO(112,140,105,1.000),
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
          
          
              const Text(
                'Create Acount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700
                  ),
              ),
          
              const SizedBox(height: 35),
        
              // username textfield
        
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),
          
              const SizedBox(height: 10),
          
          
              // email textfield
            
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
          
              const SizedBox(height: 10),

              //password
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),
        
              // contact number
        
              MyTextField(
                controller: contactNumberController,
                hintText: 'Contact Number',
                obscureText: false,
              ),

              const SizedBox(height: 10),
        
              // contact number
        
              MyTextField(
                controller: registeredContactController,
                hintText: 'Registered Number',
                obscureText: false,
              ),
      

              const SizedBox(height: 10),
          
              // registered link
              MyTextField(
                controller: urlController,
                hintText: 'Registered URL',
                obscureText: false,
              ),
          
              const SizedBox(height: 35),
          
              // Button
              Button(
                onTap: signUserUp,
                text: "Sign Up",
              ),
          
              const SizedBox(height: 15),
              // Register
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color.fromARGB(229, 254, 254, 254),
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                        color: Color.fromARGB(255, 123, 189, 243),
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