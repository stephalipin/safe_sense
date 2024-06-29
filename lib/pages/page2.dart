import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
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
      body: const  Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'OTHER SAFETY TIPS TO CONSIDER',
                style: TextStyle(
                  color: const Color.fromRGBO(18, 43, 29, 1), // Changing title color
                  fontSize: 22, // Increasing title font size
                  fontWeight: FontWeight.bold, // Making title bold
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '• Talk to children about the dangers of fire and keep lighters and matches out of their reach.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '• DROP and ROLL in case your clothing catches fire.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '• Crush cigarette butts thoroughly before discarding them.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '• Keep lighted candles and oil or gas lamps away from curtains and other objects that can easily catch fire.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '• Kerosene and gas stoves should be checked for leakage and regularly cleaned. It’s best to invest in a quality LPG tank.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '• Extinguish all live charcoal and embers after cooking in the kitchen. Make sure to have a thorough inspection before resting the night.',
                        style: TextStyle(fontSize: 16),
                      ),
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
}
