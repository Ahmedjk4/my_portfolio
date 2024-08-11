import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key, required this.constraints});
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return constraints.maxWidth >= kMinDesktopWidth
        ? const MainDesktop()
        : const MainMobile();
  }
}
