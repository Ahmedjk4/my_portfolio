import 'package:flutter/material.dart';

class SiteLogo extends StatefulWidget {
  const SiteLogo({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  State<SiteLogo> createState() => _SiteLogoState();
}

class _SiteLogoState extends State<SiteLogo> {
  String text = "Click On Me";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
        setState(() {
          text = "Ahmed Elessawy";
        });
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.amber,
        ),
      ),
    );
  }
}
