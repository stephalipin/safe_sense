import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class EditPageSecond extends StatefulWidget {
  const EditPageSecond({Key? key}) : super(key: key);

  @override
  _EditPageSecondState createState() => _EditPageSecondState();
}

class _EditPageSecondState extends State<EditPageSecond> {
  final TextEditingController _second_contactController = TextEditingController();
  final TextEditingController _second_contact_numberController = TextEditingController();

  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection("Users");
  String registeredContact = '';
  String previousContactNumber = '';

  @override
  void initState() {
    super.initState();
    // Load user data
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userDoc = await usersCollection.doc(currentUser.email).get();
    if (userDoc.exists) {
      final userData = userDoc.data() as Map<String, dynamic>;
      setState(() {
        _second_contactController.text = userData['second_contact'];
        _second_contact_numberController.text = userData['second_contact_number'];
        registeredContact = userData['registeredContact'];
        previousContactNumber = userData['second_contact_number'];
      });
      final String gsm = userData['registeredContact'];
      final String contact = userData['contact'];
    }
    
  }

  Future<void> _updateUserData() async {
    final newUsername = _second_contactController.text.trim();
    final newContact = _second_contact_numberController.text.trim();
    try {
      await usersCollection.doc(currentUser.email).update({
        'username': newUsername,
        'contact': newContact,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User information updated successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print('Error updating user information: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update user information'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String registeredContactValue = registeredContact;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Contact',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor:  Color.fromRGBO(64, 131, 93, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Username',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _second_contactController,
              decoration: const InputDecoration(
                hintText: 'Enter username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _second_contact_numberController,
              decoration: const InputDecoration(
                hintText: 'Enter contact',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String newContactValue = _second_contact_numberController.text;
                if(newContactValue != previousContactNumber){

                  String contactValue = _second_contact_numberController.text;
                  final String message = "Second: \n$contactValue";
                  final Uri url = Uri(
                    queryParameters: {'body' : message},
                    scheme: 'sms',
                    path: registeredContactValue,
                  );
                  if (await canLaunchUrl(url)){
                    await launchUrl(url);
                  } else{
                    print('show dialog: cannot launch this url');
                  }
                  _updateUserData();
                } else{
                  _updateUserData();
                }
                  
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(64, 131, 93, 1),
              ),
              child: const Text('Save Changes', style: TextStyle(color: Colors.white, fontSize: 15),),
              
            ),
          ],
        ),
      ),
    );
  }
}
