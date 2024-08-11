import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/shoruh_colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimelineTile extends StatelessWidget {
  const CustomTimelineTile(
      {super.key,
      this.order,
      this.isActive = false,
      this.title,
      this.subtitle,
      this.date});
  final bool? isActive;
  final TimelineOrder? order;
  final String? title;
  final String? subtitle;
  final String? date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        height: 200,
        child: TimelineTile(
          isFirst: order == TimelineOrder.first ? true : false,
          isLast: order == TimelineOrder.last ? true : false,
          beforeLineStyle: LineStyle(
            color: Theme.of(context).primaryColor,
          ),
          endChild: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            color: AppColors.tertiaryColor,
            child: ListTile(
                title: Text(
                  "$title",
                  style: const TextStyle(
                    color: CustomColor.whitePrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  "$subtitle ($date)",
                  style: const TextStyle(
                    color: CustomColor.whiteSecondary,
                    fontSize: 14,
                  ),
                )),
          ),
          indicatorStyle: IndicatorStyle(
              color: isActive! ? Colors.green : CustomColor.whiteSecondary,
              iconStyle: IconStyle(
                iconData: isActive! ? Icons.check : Icons.remove,
                fontSize: 16,
              )),
        ),
      ),
    );
  }
}

enum TimelineOrder { first, last }
