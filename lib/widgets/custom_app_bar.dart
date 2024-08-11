import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.scaffoldKey,
    required this.onTap,
  });
  final Function(int) onTap;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= kMinDesktopWidth) {
          return HeaderDesktop(
            onTap: onTap,
          );
        } else if (constraints.maxWidth < 216) {
          return Container();
        } else {
          return HeaderMobile(
            scaffoldKey: scaffoldKey,
          );
        }
      },
    );
  }
}
