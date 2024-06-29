import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'FIRE SAFETY TIPS TO KEEP IN MIND',
                style: TextStyle(
                  color: const Color.fromRGBO(18, 43, 29, 1), // Changing title color
                  fontSize: 22, // Increasing title font size
                  fontWeight: FontWeight.bold, // Making title bold
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(
                      text: '1. Unplug all electrical devices that are not in use.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        color: Colors.black,
                        fontSize: 18.0
                      ),
                    ),
                    TextSpan(
                      text: ' \n'
                          'Did you know that things like your computer, TV, phone, and other electronic devices that are plugged in still consume electricity even when they’re turned off? '
                          'This phenomenon is called “vampire energy.” It means there’s an excessive current flowing through these unplugged, switched off devices. '
                          'So if you’re not paying attention to them, these devices can become a potential hazard for overheating and causing a fire.\n\n',
                    ),
                    TextSpan(
                      text: '2. Check all your electrical connections.',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18.0),
                    ),
                    TextSpan(
                      text: '\n '
                          'Inspect your electrical wiring to see if it hasn’t been torn or chewed up, or look for warning signs like sparkling switches, flickering lights, and a burning smell when appliances are plugged in. '
                          'Replace damaged sockets, defective cords, and frayed wires immediately to avoid causing a fire. '
                          'An electrical inspection may not be something you think about often, but it’s important to regularly have your systems checked. '
                          'Below are some of the benefits:\n'
                          '• Avoids malfunctions.\n'
                          '• Keeps your system efficient.\n'
                          '• Protects appliances and electronics from faulty wiring.\n\n',
                    ),
                    TextSpan(
                      text: '3. Avoid plugging several devices into an extension cord.',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18.0),
                    ),
                    TextSpan(
                      text: '\n'
                          'Plugging too many devices into an extension cord can overload the circuit. '
                          'Exceeding the rated load of the circuit wiring causes the circuit breaker to shut off the power to the entire circuit, which could melt the wire insulation and lead to a fire. '
                          'If you want to plug several devices into your extension cord, you must add up the wattage rating for all the appliances to make sure it will not become overloaded.\n\n',
                    ),
                    TextSpan(
                      text: '4. Never leave an open stove unattended. ',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18.0),
                    ),
                    TextSpan(
                      text: '\n'
                          'Turn off your stove (especially if it’s a gas stove) and take your pans off the burner if you are going to leave the kitchen, even if it’s for a short period of time. '
                          'It’s because the gas will continue to flow from the stove, and if there’s an open space like a window or door, the gas will escape into the environment and could lead to an explosion. '
                          'Also, be aware of the items around your stove. Kitchen towels and other pieces of cloth can easily catch fire if set near a hot stove.\n\n',
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
