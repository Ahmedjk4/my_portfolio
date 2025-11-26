import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/shoruh_colors.dart';

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
  String text = "Ahmed Elessawy";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(
              "pfp.jpg",
            ),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              color: CustomColor.whitePrimary,
            ),
          ),
        ],
      ),
    );
  }
}
