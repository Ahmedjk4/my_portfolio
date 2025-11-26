import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/shoruh_colors.dart';
import 'package:my_portfolio/models/project_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.projectModel,
  });
  final ProjectModel projectModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 310,
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.bgLight2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            projectModel.image,
            height: 140,
            width: 260,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              projectModel.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              projectModel.subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ),
          const Spacer(),
          Container(
            color: CustomColor.bgLight1,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Row(
              children: [
                const Text(
                  "Available on:",
                  style: TextStyle(
                    color: CustomColor.yellowSecondary,
                    fontSize: 10,
                  ),
                ),
                const Spacer(),
                if (projectModel.androidLink != null)
                  InkWell(
                    onTap: () async {
                      try {
                        await launchUrl(Uri.parse(projectModel.androidLink!));
                      } catch (_) {}
                    },
                    child: Image.asset(
                      "assets/icons/android_icon.png",
                      width: 17,
                    ),
                  ),
                if (projectModel.iosLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: InkWell(
                      onTap: () async {
                        try {
                          await launchUrl(Uri.parse(projectModel.iosLink!));
                        } catch (_) {}
                      },
                      child: Image.asset(
                        "assets/icons/ios_icon.png",
                        width: 19,
                      ),
                    ),
                  ),
                if (projectModel.webLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: InkWell(
                      onTap: () async {
                        try {
                          await launchUrl(Uri.parse(projectModel.webLink!));
                        } catch (_) {}
                      },
                      child: Image.asset(
                        "assets/icons/web_icon.png",
                        width: 17,
                      ),
                    ),
                  ),
                if (projectModel.githubLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: InkWell(
                      onTap: () async {
                        try {
                          await launchUrl(Uri.parse(projectModel.githubLink!));
                        } catch (_) {}
                      },
                      child: Image.asset(
                        "assets/icons/github.png",
                        width: 17,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
