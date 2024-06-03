import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dokan/core/constants/app_colors.dart';
import 'package:dokan/core/constants/app_size.dart';
import 'package:dokan/features/components/custom_dialogs.dart';
import 'package:dokan/features/components/custom_svg.dart';
import 'package:dokan/features/screens/home/view/home_screen.dart';
import 'package:dokan/features/screens/profile/view/profile_page.dart';
import 'package:dokan/generated/assets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key, this.index = 0}) : super(key: key);
  final int? index;

  @override
  State<DashboardScreen> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {
  var pageController = PageController();
  late int _selectedIndex;
  final List<Widget> _screen = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const ProfilePage(),
  ];
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.index!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          return _onBackPressed();
        } else {
          setState(() {
            _selectedIndex = 0;
          });
        }
        return false;
      },
      child: Scaffold(
        body: _screen[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: .5,
          backgroundColor: AppColors.kWhiteColor,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          unselectedItemColor: AppColors.kGrayColor500,
          unselectedLabelStyle: kLabelSmall,
          selectedItemColor: AppColors.kMeatBrown500,
          selectedLabelStyle:
              kLabelSmall.copyWith(color: AppColors.kGrayColor900),
          onTap: _onPageChanged,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: CustomSvg(
                icon: Assets.iconsHome,
                color: AppColors.kGrayColor500,
              ),
              activeIcon: CustomSvg(
                icon: Assets.iconsHomeFill,
                color: AppColors.kMeatBrown500,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: CustomSvg(
                icon: Assets.iconsShop,
                color: AppColors.kGrayColor500,
              ),
              activeIcon: CustomSvg(
                icon: Assets.iconsShopFill,
                color: AppColors.kMeatBrown500,
              ),
              label: "Shop",
            ),
            BottomNavigationBarItem(
              icon: CustomSvg(
                icon: Assets.iconsOrderOutline,
                color: AppColors.kGrayColor500,
              ),
              activeIcon: CustomSvg(
                icon: Assets.iconsOrderFill,
                color: AppColors.kMeatBrown500,
              ),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: CustomSvg(
                icon: Assets.iconsUser,
                color: AppColors.kGrayColor500,
              ),
              activeIcon: CustomSvg(
                icon: Assets.iconsUserFill,
                color: AppColors.kMeatBrown500,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showCustomDialog(
      context: context,
      title: 'Are you sure?',
      details: 'Do you want to exit an app!',
      onYes: () => SystemNavigator.pop(),
    ).show().then(
          (value) => value as bool,
        );
  }
}
