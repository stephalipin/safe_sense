import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
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
                'WHAT TO DO IF THERE’S A FIRE IN YOUR HOME',
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
                      'If a fire breaks out in your home, call the nearest fire station immediately. However, since it will take some time for them to get to your location, you shouldn’t rely solely on the experts.',
                    ),
                    _buildBulletPoint(
                      'Some important fire safety tips on which you must act immediately until help arrives include:',
                    ),
                    _buildIndentedBulletPoint(
                      'First of all, stay calm and don’t panic.',
                    ),
                    _buildIndentedBulletPoint(
                      'Don’t waste time saving your valuables.',
                    ),
                    _buildIndentedBulletPoint(
                      'Don’t shout “FIRE” when you try to wake anyone in your house who may be asleep.',
                    ),
                    _buildIndentedBulletPoint(
                      'Check closed doors for heat before you open them. If the door is hot, DO NOT open it. This means that the door is holding the fire back and opening it would allow the fire to spread.',
                    ),
                    _buildIndentedBulletPoint(
                      'Use any available fire extinguisher. Aim the extinguisher at the base of the fire. Firefighters are trained to use fire extinguishers, but if that’s the only way to save everyone in your house, here’s your quick guide:',
                    ),
                    _buildIndentedBoldBulletPoint(
                      'P – PULL safety pin from the handle',
                    ),
                    _buildIndentedBoldBulletPoint(
                      'A – AIM (nozzle, cone, horn) at the base of the fire',
                    ),
                    _buildIndentedBoldBulletPoint(
                      'S – SQUEEZE the trigger handle',
                    ),
                    _buildIndentedBoldBulletPoint(
                      'S – SWEEP from side to side (watch for reflash)',
                    ),
                    _buildBulletPoint(
                      'If trapped in a room',
                    ),
                    _buildIndentedBulletPoint(
                      'Stay low in case of smoke or fumes. If you’re in bed, roll off your bed and crawl to the door.',
                    ),
                    _buildIndentedBulletPoint(
                      'Put a wet cloth under closed doors to help prevent the spread of smoke.',
                    ),
                    _buildIndentedBulletPoint(
                      'If you need to break a window to crawl out, use a chair or a drawer, or a similar hard object. Throw a pillow or blanket over the windowsill to protect yourself from broken glass while crawling out.',
                    ),
                    _buildBulletPoint(
                      'If caught in smoke or fumes',
                    ),
                    _buildIndentedBulletPoint(
                      'If your clothing catches fire, stop where you are. Immediately drop to the ground and cover your mouth and face with your hands to protect them from flames. Roll over to smother the fire.',
                    ),
                    _buildIndentedBulletPoint(
                      'Keep your head down and close your eyes as often as possible. Hold your breath as much as possible to avoid being suffocated.',
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

  Widget _buildIndentedBoldBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 16, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: text.substring(0, text.indexOf('–') + 1),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: text.substring(text.indexOf('–') + 1),
            ),
          ],
        ),
      ),
    );
  }
}
