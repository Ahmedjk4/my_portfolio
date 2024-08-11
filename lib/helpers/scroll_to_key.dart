import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/nav_bar_items.dart';
import 'package:url_launcher/url_launcher.dart';
part 'scroll_to_index.dart';

void scrollToKey(int index) {
  Scrollable.ensureVisible(
    navBarKeys[index].currentContext!,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
  );
}
