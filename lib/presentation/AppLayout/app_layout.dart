// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:work_shop_project/presentation/screens/home/home_screen.dart';
import 'package:work_shop_project/presentation/screens/news_screen/news_screen.dart';
import 'package:work_shop_project/presentation/screens/setting/settings_screen.dart';
import 'package:work_shop_project/presentation/styles/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  var _selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const NewsScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavyBarItem(
            icon: SvgPicture.asset("assets/icons/home.svg"),
            title: const Text('Home'),
            activeColor: AppColor.PrimaryColor,
            inactiveColor: AppColor.black,
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset("assets/icons/event.svg"),
            title: const Text('News'),
            activeColor: AppColor.PrimaryColor,
            inactiveColor: AppColor.black,
          ),
          BottomNavyBarItem(
            icon: SvgPicture.asset("assets/icons/settings.svg"),
            title: const Text('Settings'),
            activeColor: AppColor.PrimaryColor,
            inactiveColor: AppColor.black,
          ),
        ],
      ),
    );
  }
}
