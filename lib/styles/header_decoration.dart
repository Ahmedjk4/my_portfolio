import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/shoruh_colors.dart';

BoxDecoration kHeaderDecoration = const BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Colors.transparent,
      CustomColor.bgLight1,
    ],
  ),
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10), topRight: Radius.circular(10)),
);
