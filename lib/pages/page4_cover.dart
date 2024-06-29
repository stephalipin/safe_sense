import 'package:flutter/material.dart';
import 'package:safe_sense/pages/page4.dart';

class PageFourCover extends StatelessWidget {
  const PageFourCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://scontent.fmnl7-2.fna.fbcdn.net/v/t1.15752-9/448464884_1291458641812169_3766261856802830746_n.png?_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHG98dfltoJFiUIpvBLxtCtIVrLmXTgePshWsuZdOB4-2X6U5aZjf4tCHqmv-eJoO7MDQ45d8-agCi_TyBxISCZ&_nc_ohc=hoKso-GFAMsQ7kNvgFsBmO7&_nc_ht=scontent.fmnl7-2.fna&oh=03_Q7cD1QH_ANaxTRx-anS5HcvMyQCGQ3abVlufJi4dPb4Dd6XzQA&oe=669C441E', // Replace with a direct link to your image file
              width: 300,
              height: 300,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Image failed to load'); // Handle image load failure
              },
            ),
            const SizedBox(height: 16.0), // Add some space between the image and the text
            const Text(
              'What to do After a Fire',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Recovering from a house fire can be physically, mentally, and emotionally draining. Often, the hardest part is knowing where to begin and who to ....',
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 16.0), // Add some space between the text and the button
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                   const Color.fromRGBO(18, 43, 29, 1), // Background color
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(fontSize: 18),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0), // Rounded corners
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Page4()),
                  );
                },
                child: const Center(
                  child: Text(
                    'Learn More',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}