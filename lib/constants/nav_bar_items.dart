import 'package:flutter/material.dart';

const kNavBarItems = [
  "Home",
  "Skills",
  "Projects",
  "Career",
  "Contact",
  "Blog",
];

const kNavBarIcons = [
  Icons.home,
  Icons.handyman_outlined,
  Icons.apps,
  Icons.book,
  Icons.quick_contacts_mail,
  Icons.web,
];

final List<GlobalKey<NavigatorState>> navBarKeys =
    List.generate(5, (index) => GlobalKey<NavigatorState>());
