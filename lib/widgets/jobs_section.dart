import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/shoruh_colors.dart';
import 'package:my_portfolio/utils/jobs_timeline.dart';
import 'package:my_portfolio/widgets/custom_time_line_tile.dart';

class JobsSection extends StatelessWidget {
  const JobsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: AppColors.secondaryColor,
      child: Column(children: [
        const SizedBox(height: 15),
        const Text(
          "Career",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: CustomColor.whitePrimary,
          ),
        ),
        for (var i = 0; i < kJobsTimeline.length; i++)
          CustomTimelineTile(
            order: getOrder(i),
            isActive: i == kJobsTimeline.length - 1,
            title: kJobsTimeline[i].title,
            subtitle: kJobsTimeline[i].subtitle,
            date: kJobsTimeline[i].date,
          ),
      ]),
    );
  }

  TimelineOrder? getOrder(int i) {
    return i == 0
        ? TimelineOrder.first
        : i == kJobsTimeline.length - 1
            ? TimelineOrder.last
            : null;
  }
}
