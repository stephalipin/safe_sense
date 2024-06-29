import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_sense/components/drawer.dart';
import 'package:safe_sense/components/web_view_container.dart';
import 'package:safe_sense/pages/emergency_hotlines.dart';
import 'package:safe_sense/pages/feedback_page.dart';
import 'package:safe_sense/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:safe_sense/pages/precaution_page.dart';
import 'package:safe_sense/pages/profile_page.dart';
import 'package:safe_sense/pages/contact_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;


  // sign user out method
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  void goToProfilePage(){
    // pop menu drawer
    Navigator.pop(context);

    // go to profile page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:(context) => const ContactPage(),
      ),
    );
  }

  void goToEmergencyPage(){
    // pop menu drawer
    Navigator.pop(context);

    // go to profile page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:(context) => const EmergencyHotlines(),
      ),
    );
  }

  void goToFeedbackPage(){
    // pop menu drawer
    Navigator.pop(context);

    // go to profile page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:(context) => FeedbackPage(),
      ),
    );
  }

void goToPrecautionPage(){
    // pop menu drawer
    Navigator.pop(context);

    // go to profile page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:(context) => const PrecautionPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor:  Color.fromRGBO(18, 43, 29, 1),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),

      drawer: MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut: signUserOut,
        onEmergency: goToEmergencyPage,
        onFeedback: goToFeedbackPage,
        onPrecaution: goToPrecautionPage,
      ),

      body: const WebViewContainer()
    );
  }
}