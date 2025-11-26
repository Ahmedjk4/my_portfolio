import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/nav_bar_items.dart';

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({
    super.key,
    required this.onTap,
    required this.scaffoldKey,
    this.selectedIndex = 0,
  });

  final Function(int) onTap;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final int selectedIndex;
  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryColor,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
              ],
            ),
          ),
          for (var i = 0; i < kNavBarItems.length; i++)
            ListTile(
              selected: widget.selectedIndex == i,
              selectedTileColor: Colors.transparent,
              selectedColor: AppColors.quaternaryColor,
              onTap: () {
                widget.onTap(i);
              },
              leading: Icon(kNavBarIcons[i]),
              title: Text(kNavBarItems[i]),
            )
        ],
      ),
    );
  }
}
