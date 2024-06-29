import 'package:flutter/material.dart';
import 'package:safe_sense/pages/page2.dart';

class PageTwoCover extends StatelessWidget {
  const PageTwoCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://scontent.fmnl7-1.fna.fbcdn.net/v/t1.15752-9/448396568_1030590148423397_7763576404097349751_n.png?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFlJIOCBpquX4PwigFVjDasczvJ-XWJr3JzO8n5dYmvclMWOKsxWkFUVkhILJTAjxdDrwalur1Il8I1VHkvymjP&_nc_ohc=Ij14EKZl3awQ7kNvgH4gKKD&_nc_ht=scontent.fmnl7-1.fna&oh=03_Q7cD1QEAsG43_mKZngPxVnEoJA3eb1tLzy19bejcM-HytnoDXw&oe=669C147D', // Replace with a direct link to your image file
              width: 300,
              height: 300,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Image failed to load'); // Handle image load failure
              },
            ),
            const SizedBox(height: 16.0), // Add some space between the image and the text
            const Text(
              'Other Safety Tips to Consider',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Talk to children about the dangers of fire and keep lighters and matches out of their reach.  DROP and ROLL in case your clothing catches ....',
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
                    MaterialPageRoute(builder: (context) => Page2()),
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