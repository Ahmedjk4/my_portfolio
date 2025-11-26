import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/helpers/scroll_to_key.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({
    super.key,
  });

  @override
  State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile> {
  final controller = TypeWriterController(
    text: 'Hello,\nI\'m Ahmed Elessawy\nFlutter Developer',
    duration: const Duration(milliseconds: 50),
  );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    // Adjust height based on screen size
    final containerHeight =
        screenWidth < 360 ? screenHeight * 0.85 : screenHeight * 0.95;

    return Container(
      height: containerHeight,
      constraints: BoxConstraints(
        minHeight: screenWidth < 360 ? 500.0 : 560.0,
        maxHeight: screenHeight,
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.9),
                      Colors.white.withOpacity(0.7),
                      Colors.white.withOpacity(0.7),
                      Colors.white.withOpacity(0.9),
                    ],
                  ).createShader(bounds);
                },
                child: WidgetAnimator(
                  atRestEffect: WidgetRestingEffects.wave(),
                  child: Image.asset(
                    'assets/icons/flutter_branding.png',
                    width: screenWidth,
                    height: screenWidth < 360 ? 200 : null,
                    fit: screenWidth < 360 ? BoxFit.contain : null,
                  ),
                ),
              ),
              SizedBox(
                height: screenWidth < 360 ? 20 : 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TypeWriter(
                  controller: controller,
                  builder: (context, value) => Text(
                    value.text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth < 360 ? 24 : 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenWidth < 360 ? 16 : 20),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: MaterialButton(
                  color: Colors.amber,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Under Development'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  height: screenWidth < 360 ? 50 : 60,
                  minWidth: screenWidth < 360 ? 180 : 200,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Text(
                    'See about me',
                    style: TextStyle(fontSize: screenWidth < 360 ? 14 : 16),
                  ),
                ),
              ),
            ],
          ),
          // Lottie at bottom center
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Lottie.asset(
                'assets/lottie/scroll.json',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
