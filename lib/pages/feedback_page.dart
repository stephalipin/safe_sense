import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackPage> {
  int _selectedEmotion = 3;
  String? _selectedTopic;
  bool _shareSettings = false;
  TextEditingController _explanationController = TextEditingController();

  Future<void> _saveFeedback() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null || user.email == null) {
      // Handle the case where the user is not logged in or doesn't have an email
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You must be logged in with an email to submit feedback.')),
      );
      return;
    }

    final feedbackData = {
      'latestFeedback': {
        'emotion': _selectedEmotion,
        'topic': _selectedTopic ?? 'No Selected Concern',
        'explanation': _explanationController.text,
        'timestamp': FieldValue.serverTimestamp(),
      },
      'email': user.email, // Adding email to ensure it's always up to date
    };

    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.email)
          .set(feedbackData, SetOptions(merge: true));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Feedback submitted successfully!')),
      );

      // Clear the form
      setState(() {
        _selectedEmotion = 3;
        _selectedTopic = null;
        _explanationController.clear();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error submitting feedback. Please try again.')),
      );
      print('Error saving feedback: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feedback',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(18, 43, 29, 1),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the back button color here
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50),
                _buildFeedbackIcons(),
                const SizedBox(height: 20),
                const Text(
                  'Share Your Feedback',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Please select a topic below and let us know about your concern',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                _buildEmotionSelector(),
                const SizedBox(height: 30),
                const Text(
                  'Select your concern',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                _buildTopicDropdown(),
                const SizedBox(height: 20),
                _buildExplanationField(),
                const SizedBox(height: 90),
                ElevatedButton(
                  child: const Text('Submit', style: TextStyle(color: Colors.white, fontSize: 18.0)),
                  onPressed: _saveFeedback,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(18, 43, 29, 1),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeedbackIcons() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.chat_bubble, color: Colors.blue),
        Icon(Icons.mood, color: Colors.yellow),
        Icon(Icons.favorite, color: Colors.red),
        Icon(Icons.star, color: Colors.blue),
      ],
    );
  }

  Widget _buildExplanationField() {
    return TextField(
      controller: _explanationController,
      maxLines: 3,
      decoration: const InputDecoration(
        hintText: 'Please provide more details about your concern...',
        border: OutlineInputBorder(),
        labelText: 'Explanation',
      ),
    );
  }

  @override
  void dispose() {
    _explanationController.dispose();
    super.dispose();
  }

  Widget _buildEmotionSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () => setState(() => _selectedEmotion = index),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _selectedEmotion == index ? const Color.fromARGB(255, 255, 230, 0) : Colors.grey[300],
            ),
            child: Icon(
              index == 0 ? Icons.sentiment_very_dissatisfied :
              index == 1 ? Icons.sentiment_dissatisfied :
              index == 2 ? Icons.sentiment_neutral :
              index == 3 ? Icons.sentiment_satisfied :
              Icons.sentiment_very_satisfied,
              color: _selectedEmotion == index ? Colors.white : Colors.grey[600],
              size: 40,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTopicDropdown() {
    return DropdownButton<String>(
      isExpanded: true,
      value: _selectedTopic,
      hint: const Text('Select a concern'),
      onChanged: (String? newValue) {
        setState(() {
          _selectedTopic = newValue;
        });
      },
      items: <String>[
        'Something is wrong with this App',
        'Something is wrong with Camera',
        'Something is wrong with Smoke Detector',
        'Other Concern',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
