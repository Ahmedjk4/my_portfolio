import 'package:my_portfolio/helpers/play_audio.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/styles/header_decoration.dart';
import 'package:my_portfolio/constants/nav_bar_items.dart';
import 'package:my_portfolio/constants/shoruh_colors.dart';
import 'package:my_portfolio/widgets/site_logo.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop({super.key, required this.onTap});
  final Function(int) onTap;

  @override
  State<HeaderDesktop> createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  bool isPlayingAudio = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 96,
      width: double.maxFinite,
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: () async {
            if (isPlayingAudio == false) {
              isPlayingAudio = true;
              playAudio();
            }
          }),
          const Spacer(),
          for (var i = 0; i < kNavBarItems.length; i++)
            TextButton(
              onPressed: () {
                widget.onTap(i);
              },
              child: Text(
                kNavBarItems[i],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
