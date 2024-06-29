import 'package:flutter/material.dart';
import 'package:safe_sense/pages/page3.dart';

class PageThreeCover extends StatelessWidget {
  const PageThreeCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://scontent.fmnl7-2.fna.fbcdn.net/v/t1.15752-9/448426050_447803357978932_883042719937012646_n.png?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeHp33LL9oB0OTgr3oNvaUoYYXPQQybGP8Fhc9BDJsY_wV6AFOtcf-Qhpp69dSjpJ0DkPbb99P5L17FjHX9ZbwCr&_nc_ohc=XiOoatF98SAQ7kNvgECaJMG&_nc_ht=scontent.fmnl7-2.fna&oh=03_Q7cD1QFcPXs8h0BTEvojGwk3EcnEbvjRNmvohAusoVsdYacY-Q&oe=669C11B9', // Replace with a direct link to your image file
              width: 300,
              height: 300,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Image failed to load'); // Handle image load failure
              },
            ),
            const SizedBox(height: 16.0), // Add some space between the image and the text
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Center(
                child: Text(
                  'What to do if there’s a Fire in your Home',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'If a fire breaks out in your home, call the nearest fire station immediately. However, since it  ....',
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
                    MaterialPageRoute(builder: (context) => Page3()),
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