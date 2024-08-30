import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/scroll_to_key.dart';
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
    text: 'Hello,\nI\'m Ahmed Elessawy\nFlutter Developer',
    duration: const Duration(milliseconds: 50),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.2,
      width: double.maxFinite,
      constraints: const BoxConstraints(minHeight: 350),
      child: Row(
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
                  scrollToIndex(4);
                },
                height: 60,
                minWidth: 200,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: const Text('Get In Touch'),
              ),
            ],
          ),
          WidgetAnimator(
            atRestEffect: WidgetRestingEffects.wave(),
            child: Image.asset(
              'assets/flutter_branding.png',
              width: MediaQuery.of(context).size.width / 2,
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
    );
  }
}
