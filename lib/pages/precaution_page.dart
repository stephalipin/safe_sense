import 'package:flutter/material.dart';
import 'package:safe_sense/pages/page1_cover.dart';
import 'package:safe_sense/pages/page2_cover.dart';
import 'package:safe_sense/pages/page3_cover.dart';
import 'package:safe_sense/pages/page4_cover.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PrecautionPage extends StatefulWidget {
  const PrecautionPage({super.key});

  @override
  State<PrecautionPage> createState() => _PrecautionPageState();
}

class _PrecautionPageState extends State<PrecautionPage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Safety Precaution',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(18, 43, 29, 1),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the back button color here
        ),
        elevation: 0,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // page view
          SizedBox(
            height: 500,
            child: PageView(
              controller: _controller,
              children: const[
                PageOneCover(),
                PageTwoCover(),
                PageThreeCover(),
                PageFourCover(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _controller, 
            count: 4,
            effect: const ExpandingDotsEffect(
              activeDotColor: Color.fromRGBO(18, 43, 29, 1),
              dotColor: Color.fromRGBO(59, 104, 78, 1),
              dotHeight: 10,
              dotWidth: 10,
            ),
          )
        ],
      ),
      
    );
  }
}