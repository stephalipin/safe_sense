import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  late String registeredContact;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  @override
    void initState(){
      super.initState();
      _fetchUserData();
    }
  Future<void> _fetchUserData() async {
    // Get current user
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      // Fetch user document
      final userDoc = await FirebaseFirestore.instance.collection("Users").doc(currentUser.email).get();
      if (userDoc.exists) {
        // Retrieve registeredContact field from user document
        setState(() {
          registeredContact = userDoc.get('registeredContact');
        });
      } else {
        // Handle case where user document doesn't exist
        print('User document not found.');
      }
    } else {
      // Handle case where user is not authenticated
      print('User not authenticated.');
    }
  }

  final currentUser = FirebaseAuth.instance.currentUser!;
  final contactsCollection = FirebaseFirestore.instance.collection("Users");

  Future<void> addContact() async {
  final second_contact = _nameController.text.trim();
  final second_contact_number = _numberController.text.trim();

  if (second_contact.isNotEmpty && second_contact_number.isNotEmpty) {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!;
      final userDoc = await contactsCollection.doc(currentUser.email).get();
      if (userDoc.exists) {
        // Update the user's document with the new contact
        await contactsCollection.doc(currentUser.email).update({
          'second_contact': second_contact,
          'second_contact_number': second_contact_number,
        });
      } else {
        // Create a new document for the user and add the contact
        await contactsCollection.doc(currentUser.email).set({
          'email': currentUser.email,
          'second_contact': second_contact,
          'second_contact_number': second_contact_number,
        });
      }

      // Navigate back to the previous page
      Navigator.pop(context);
    } catch (e) {
      print('Error adding contact: $e');
      // Show error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to add contact. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  } else {
    // Show error message if second_contact or second_contact_number is empty
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter second_contact and second_contact_number.'),
        backgroundColor: Colors.red,
      ),
    );
  }
}


Future<void> addUserInfo() async {
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    try {
      final userDoc = await FirebaseFirestore.instance.collection("Users").doc(currentUser.email).get();
      if (userDoc.exists) {
        // Update user information in Firestore
        await FirebaseFirestore.instance.collection("Users").doc(currentUser.email).update({
          'email': currentUser.email
          // Add other fields to update as needed
        });
        print('User info updated successfully.');
      } else {
        print('User document not found.');
      }
    } catch (e) {
      print('Error updating user info: $e');
    }
  } else {
    print('User not authenticated.');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text(
          'Add Contact',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor:  Color.fromRGBO(18, 43, 29, 1),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the back button color here
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Enter name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact Number',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _numberController,
              decoration: const InputDecoration(
                hintText: 'Enter contact number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String contactValue = _numberController.text;
                const String message = "Second";
                final Uri url = Uri(
                  queryParameters: {'body' : message},
                  scheme: 'sms',
                  path: registeredContact,
                );
                if (await canLaunchUrl(url)){
                  await launchUrl(url);
                } else{
                  print('show dialog: cannot launch this url');
                }
                addContact();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(18, 43, 29, 1),
              ),
              child: const Text('Save Contact', style: TextStyle(color: Colors.white, fontSize: 15),),
            ),
          ],
        ),
      ),
    );
  }
}
