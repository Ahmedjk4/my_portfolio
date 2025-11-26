import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_colors.dart';

class CrossFooter extends StatelessWidget {
  const CrossFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.maxFinite,
      color: Colors.black38,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              "Made By Ahmed Elessawy",
            ),
          )
        ],
      ),
    );
  }
}
