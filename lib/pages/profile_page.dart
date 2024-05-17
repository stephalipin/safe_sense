import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safe_sense/components/text_box.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  // user
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  // edit field
  Future<void> editField(String field)async{

    String newValue = "";
    await showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromRGBO(112,140,105,1.000),
        title: Text(
          "Edit $field",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "enter new $field",
            hintStyle: TextStyle(color: Colors.white),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),

        actions: [
          //cancell button
          TextButton(
            child: Text('Cancel', style: TextStyle(color: Colors.white),),
            onPressed: () => Navigator.pop(context),
          ),

          //save button
          TextButton(
            child: Text('Save', style: TextStyle(color: Colors.white),),
            onPressed: () => Navigator.of(context).pop(context),
          ),
        ],
      ),
    );

    //update in firestore
    if(newValue.trim().length > 0) {
      //only update if there is something in the textfield
      await usersCollection.doc(currentUser.email).update({field: newValue});

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor:  Color.fromRGBO(64, 131, 93, 1),
        elevation: 0,
      ),

      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser.email)
        .snapshots(),
        builder: (context, snapshot) {
          //get user data
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
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

                SizedBox(height: 50), 

                // user details
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'My Details',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),


                // username
                MyTextBox(
                  text: userData['username'], 
                  sectionName: 'Username',
                  onPressed:() => editField('username'),
                ),

                //contact number
                MyTextBox(
                  text: userData['contact'], 
                  sectionName: 'Contact',
                  onPressed:() => editField('contact'),
                ),

                // registered link
                MyTextBox(
                  text: userData['url'], 
                  sectionName: 'Registered Link',
                  onPressed:() => editField('url'),
                ),

              ],
            );
          } else if (snapshot.hasError){
              return Center(
                child: Text('Error${snapshot.error}'),
              );
          } 

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )

    );
  }
}