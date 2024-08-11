import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_colors.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.maxFinite,
      color: AppColors.primaryColor,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              "Ahmed Elessawy, All Rights Reserved, Thanks To Shohruh AK For This Theme",
            ),
          )
        ],
      ),
    );
  }
}
