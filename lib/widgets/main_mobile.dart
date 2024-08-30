import 'package:flutter/material.dart';
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
    return Container(
      height: MediaQuery.sizeOf(context).height,
      constraints: const BoxConstraints(minHeight: 560.0),
      child: Column(
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
                'assets/flutter_branding.png',
                width: MediaQuery.sizeOf(context).width,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: TypeWriter(
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: MaterialButton(
              color: Colors.amber,
              onPressed: () {
                scrollToIndex(4);
              },
              height: 60,
              minWidth: 200,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              child: const Text('Get In Touch'),
            ),
          ),
        ],
      ),
    );
  }
}
