import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/play_audio.dart';
import 'package:my_portfolio/styles/header_decoration.dart';
import 'package:my_portfolio/constants/shoruh_colors.dart';

import 'site_logo.dart';

class HeaderMobile extends StatefulWidget {
  const HeaderMobile({
    super.key,
    required this.scaffoldKey,
  });
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<HeaderMobile> createState() => _HeaderMobileState();
}

class _HeaderMobileState extends State<HeaderMobile> {
  bool isPlayingAudio = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      height: 65,
      width: double.maxFinite,
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(
            onTap: () async {
              if (isPlayingAudio == false) {
                isPlayingAudio = true;
                playAudio();
              }
            },
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              widget.scaffoldKey.currentState?.openEndDrawer();
            },
            icon: const Icon(Icons.menu),
            color: CustomColor.whitePrimary,
          ),
        ],
      ),
    );
  }
}
