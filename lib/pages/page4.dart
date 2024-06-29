import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(18, 43, 29, 1),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the back button color here
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'WHAT TO DO AFTER A FIRE',
                style: TextStyle(
                  color: const Color.fromRGBO(18, 43, 29, 1), // Changing title color
                  fontSize: 22, // Increasing title font size
                  fontWeight: FontWeight.bold, // Making title bold
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBulletPoint(
                      'Recovering from a house fire can be physically, mentally, and emotionally draining. Often, the hardest part is knowing where to begin and who to contact.',
                    ),
                    _buildBulletPoint(
                      'The following list will help you manage the situation:',
                    ),
                    _buildIndentedBulletPoint(
                      '• Listen to fire service advice. It’s part of their response to advise you on what to do next, in terms of recovering from the damage caused by the fire.',
                    ),
                    _buildIndentedBulletPoint(
                      '• Only re-enter your home once you’ve been advised to do so by authorized officials.',
                    ),
                    _buildIndentedBulletPoint(
                      '• Do not attempt to reconnect utilities yourself. Let the authorities check if the facilities are either safe to use or are better off being disconnected before they leave the site.',
                    ),
                    _buildBulletPoint(
                      'If there is any recovered food, make sure that it’s safe. Discard any food that may have been exposed to heat, smoke, or soot.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildIndentedBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
