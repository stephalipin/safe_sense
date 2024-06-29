import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' '),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the back button color here
        ),
        backgroundColor: const Color.fromRGBO(18, 43, 29, 1),
      ),
      body: const SingleChildScrollView(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              'TERMS AND CONDITIONS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '1. Acceptance of Terms',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'By downloading or using IBHS (IoT-Based Home Safety), you agree to comply with and be bound by these terms and conditions.',
            ),
            SizedBox(height: 20),
            Text(
              '2. User Account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Registration:\nYou must register for an account to use certain features of the app. You agree to provide accurate information during registration.',
            ),
            SizedBox(height: 10),
            Text(
              'Security:\nYou are responsible for maintaining the confidentiality of your account credentials.',
            ),
            SizedBox(height: 20),
            Text(
              '3. Use of the App',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Permitted Use:\nThe app is provided for your personal, non-commercial use. You agree not to misuse the app in any way.',
            ),
            SizedBox(height: 10),
            Text(
              'Prohibited Activities:\nYou must not attempt to interfere with the proper functioning of the app or use it for any unlawful activities.',
            ),
            SizedBox(height: 20),
            Text(
              '4. Data Privacy',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Collection:\nThe app collects data such as video footage and smoke detection alerts to provide the service.',
            ),
            SizedBox(height: 10),
            Text(
              'Usage:\nYour data will be used to enhance app functionality and improve home safety.',
            ),
            SizedBox(height: 10),
            Text(
              'Sharing:\nYour data will not be shared with third parties without your consent, except as required by law.',
            ),
            SizedBox(height: 20),
            Text(
              '5. Intellectual Property',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Ownership:\nThe app and all related intellectual property rights are owned by the developers.',
            ),
            SizedBox(height: 10),
            Text(
              'Restrictions:\nYou may not copy, modify, distribute, or reverse engineer any part of the app without prior written consent.',
            ),
            SizedBox(height: 20),
            Text(
              '6. Disclaimers and Limitations of Liability',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'No Warranties:\nThe app is provided "as is" without warranties of any kind.',
            ),
            SizedBox(height: 10),
            Text(
              'Liability:\nThe developers are not liable for any direct, indirect, incidental, or consequential damages arising from the use or inability to use the app.',
            ),
            SizedBox(height: 20),
            Text(
              '7. Updates and Modifications',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Changes:\nThe developers may update or modify the app and these terms at any time. Continued use of the app constitutes acceptance of these changes.',
            ),
            SizedBox(height: 10),
            Text(
              'Notifications:\nSignificant changes will be communicated through the app.',
            ),
            SizedBox(height: 20),
            Text(
              '8. Termination',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Right to Terminate:\nThe developers reserve the right to terminate or suspend access to the app for any user who violates these terms.',
            ),
            SizedBox(height: 10),
            Text(
              'Effect of Termination:\nUpon termination, your right to use the app will cease immediately.',
            ),
            SizedBox(height: 20),
            Text(
              '9. Governing Law',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'These terms and conditions are governed by and construed in accordance with the laws of the jurisdiction in which the developers are based.',
            ),
            SizedBox(height: 20),
            Text(
              '10. Contact Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'For any questions or concerns regarding these terms, please contact our support team via the app\'s support section.',
            ),
          ],
        ),
      ),
    );
  }
}
