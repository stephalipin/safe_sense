import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safe_sense/pages/edit_page.dart';
import 'package:safe_sense/pages/add_contact_page.dart';
import 'package:safe_sense/pages/edit_page_second.dart';
import 'package:safe_sense/components/text_box.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  // user
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  // edit field
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color.fromRGBO(112, 140, 105, 1.000),
        title: Text(
          "Edit $field",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "enter new $field",
            hintStyle: const TextStyle(color: Colors.white),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          //cancel button
          TextButton(
            child: const Text('Cancel', style: TextStyle(color: Colors.white)),
            onPressed: () => Navigator.pop(context),
          ),
          //save button
          TextButton(
            child: const Text('Save', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop();
              // Update the value in Firestore
              if (newValue.trim().length > 0) {
                usersCollection.doc(currentUser.email).update({field: newValue});
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' Contacts ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(18, 43, 29, 1),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the back button color here
        ),
        elevation: 0,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("Users").doc(currentUser.email).snapshots(),
        builder: (context, snapshot) {
          //get user data
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            final hasSecondContact = userData.containsKey('second_contact');
            return ListView(
              children: [
                const SizedBox(height: 50), 

                // profile pic
                const Icon(
                  Icons.person,
                  size: 100,
                ),

                const SizedBox(height: 10), 

                //user email
                Text(
                  currentUser.email!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[700]
                  ),
                ),

                const SizedBox(height: 50), 

                // user details
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'My Details',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18.0),
                  ),
                ),


                // username
                MyTextBox(
                  text: userData['username'], 
                  sectionName: 'Name',
                ),

                MyTextBox(
                  text: userData['address'], 
                  sectionName: 'Adress',
                ),

                //contact number
                MyTextBox(
                  text: userData['contact'], 
                  sectionName: 'Contact Number',
                ),
                const SizedBox(height: 50), 
                // User details
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Contacts',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // FIRST CONTACT
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          userData['username'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: IconButton(
                          icon:const Icon(Icons.edit),
                          onPressed: () {
                            // Navigate to EditPage when the edit icon is pressed
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EditPage()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                // SECOND CONTACT
                if (userData.containsKey('second_contact'))
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person,
                          size: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            userData['second_contact'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0),
                          child: IconButton(
                            icon:const Icon(Icons.edit),
                            onPressed: () {
                              // Navigate to EditPage when the edit icon is pressed
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EditPageSecond()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 10),

                if (!userData.containsKey('second_contact'))
                  Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                   child: ElevatedButton(
                     onPressed: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => const AddContactPage()),
                       );
                     },
                       style: ElevatedButton.styleFrom(
                       backgroundColor: const Color.fromRGBO(18, 43, 29, 1.000), // Set background color here
                    ),
                     child: 
                       const Text(
                         'Add',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 15.0,
                         ),
                       ),
                   ),
                 )
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
