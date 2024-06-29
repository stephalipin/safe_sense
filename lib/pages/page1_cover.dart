import 'package:flutter/material.dart';
import 'package:safe_sense/pages/page1.dart';

class PageOneCover extends StatelessWidget {
  const PageOneCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://scontent.fmnl7-2.fna.fbcdn.net/v/t1.15752-9/448791844_792355576340748_4202563169741422859_n.png?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeF2lqT0DcNtpi8XFPUJXoYJegzywsGp-TN6DPLCwan5MylvmpHnx40nIpfKXtt_RwIEPxDZ5hDV6v1sxtlwj4v_&_nc_ohc=lWlxryl0C2oQ7kNvgHJpENv&_nc_ht=scontent.fmnl7-2.fna&oh=03_Q7cD1QH9lyROPgEpV27hKcMhofvK1KbAQDAqEJ_-OTseouPLfQ&oe=669B974D', // Replace with a direct link to your image file
              width: 300,
              height: 300,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Image failed to load'); // Handle image load failure
              },
            ),
            const SizedBox(height: 16.0), // Add some space between the image and the text
            const Text(
              'Fire safety tips to keep in mind',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Text(
                  'Did you know that things like your computer, TV, phone, and other electronic devices that are plugged in still consume electricity even when  ....',
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
                    MaterialPageRoute(builder: (context) => Page1()),
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