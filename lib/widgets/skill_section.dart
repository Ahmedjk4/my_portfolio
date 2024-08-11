import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/shoruh_colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: AppColors.secondaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'What Can I Do',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          constraints.maxWidth >= kMedDesktopWidth
              ? const SkillsDesktop()
              : const SkillsMobile(),
        ],
      ),
    );
  }
}
