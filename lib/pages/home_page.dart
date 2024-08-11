import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/nav_bar_items.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/helpers/scroll_to_key.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/custom_app_bar.dart';
import 'package:my_portfolio/widgets/main_section.dart';
import 'package:my_portfolio/widgets/mobile_drawer.dart';
import 'package:my_portfolio/widgets/project_section.dart';
import 'package:my_portfolio/widgets/skill_section.dart';
import '../widgets/footer.dart';
import '../widgets/jobs_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth
              ? null
              : MobileDrawer(
                  onTap: (index) async {
                    scaffoldKey.currentState!.closeEndDrawer();
                    scrollToKey(index);
                  },
                ),
          backgroundColor: AppColors.primaryColor,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: AnimationLimiter(
              child: Column(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 500),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    // Header
                    CustomAppBar(
                      scaffoldKey: scaffoldKey,
                      onTap: (index) async {
                        scrollToIndex(index);
                      },
                    ),
                    // Main
                    Column(
                      children: [
                        // Main Section
                        MainSection(
                          key: navBarKeys[0],
                          constraints: constraints,
                        ),

                        // Skills
                        SkillSection(
                          key: navBarKeys[1],
                          constraints: constraints,
                        ),

                        // Projects
                        ProjectSection(
                          key: navBarKeys[2],
                        ),

                        // Jobs
                        JobsSection(
                          key: navBarKeys[3],
                        ),

                        // Contact
                        ContactSection(
                          key: navBarKeys[4],
                        ),

                        const Footer(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
