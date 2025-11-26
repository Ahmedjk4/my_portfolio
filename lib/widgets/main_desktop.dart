import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/helpers/scroll_to_key.dart';
import 'package:my_portfolio/pages/about_page.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class MainDesktop extends StatefulWidget {
  const MainDesktop({
    super.key,
  });

  @override
  State<MainDesktop> createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop> {
  final controller = TypeWriterController(
    text: 'Hello,\nI\'m Ahmed Mohamed Elessawy\nFlutter Developer',
    duration: const Duration(milliseconds: 50),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.2,
      width: double.maxFinite,
      constraints: const BoxConstraints(minHeight: 350),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TypeWriter(
                    controller: controller,
                    builder: (context, value) => Text(
                      value.text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    color: Colors.amber,
                    onPressed: () {
                      // Navigator.of(context)
                      //     .push(MaterialPageRoute(builder: (context) {
                      //   return const AboutPage();
                      // }));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Under Development'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    height: 60,
                    minWidth: 200,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: const Text('See about me'),
                  ),
                ],
              ),
              WidgetAnimator(
                atRestEffect: WidgetRestingEffects.wave(),
                child: Image.asset(
                  'assets/icons/flutter_branding.png',
                  width: MediaQuery.of(context).size.width / 2,
                  fit: BoxFit.scaleDown,
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
