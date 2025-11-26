import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/nav_bar_items.dart';
import 'package:my_portfolio/constants/size.dart';
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
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    setState(() {
      _selectedIndex = index;
    });

    final context = navBarKeys[index].currentContext;

    if (context != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
          alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth
              ? null
              : MobileDrawer(
                  onTap: (index) {
                    Navigator.of(context).pop();
                    _scrollToSection(index);
                  },
                  scaffoldKey: scaffoldKey,
                  selectedIndex: _selectedIndex,
                ),
          backgroundColor: AppColors.primaryColor,
          drawerEnableOpenDragGesture: false,
          endDrawerEnableOpenDragGesture: true,
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: AppColors.primaryColor,
                elevation: 0,
                automaticallyImplyLeading: false,
                toolbarHeight: 97,
                titleSpacing: 0,
                actions: const [SizedBox.shrink()],
                title: CustomAppBar(
                  scaffoldKey: scaffoldKey,
                  onTap: (index) async {
                    _scrollToSection(index);
                  },
                ),
              ),
              // Content sections with staggered animations
              SliverToBoxAdapter(
                child: AnimationLimiter(
                  child: Column(
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 500),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: -50.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                      children: [
                        MainSection(
                          key: navBarKeys[0],
                          constraints: constraints,
                        ),
                        SkillSection(
                          key: navBarKeys[1],
                          constraints: constraints,
                        ),
                        ProjectSection(
                          key: navBarKeys[2],
                        ),
                        JobsSection(
                          key: navBarKeys[3],
                        ),
                        ContactSection(
                          key: navBarKeys[4],
                        ),
                        CrossFooter(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
