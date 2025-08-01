import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/friends/friends_page.dart';
import 'package:apple_invites/screens/groups/groups_page.dart';
import 'package:apple_invites/screens/home_page.dart';
import 'package:apple_invites/screens/provider/user_provider.dart';
import 'package:apple_invites/screens/setting/account_page.dart';
import 'package:apple_invites/screens/views/app_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});
  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  int _selectedIndex = 1;
  final List<Widget> _screens = [
    FriendsPage(),
    HomePage(),
    GroupsPage(),
    AccountPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: loadAssetImage(name: appBackground, fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: Container(color: Colors.black.withValues(alpha: 0.2)),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(child: _buildFancyEvent()),
          // /Color.fromRGBO(77, 47, 165, 0.7),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white.withValues(alpha: 0.4),
            shape: CircleBorder(),
            onPressed: () {
              Navigator.pushNamed(context, RouteName.createEventPage);
            },
            child: loadCircleIcon(
              icon: Icons.add_outlined,
              iconSize: 24,
              radius: 20,
              backgroundColor: Colors.white.withValues(alpha: 0.7),
              iconColor: Colors.orangeAccent,
            ),
          ),
          bottomNavigationBar: _buildBottomBar(),
        ),
      ],
    );
  }

  _buildFancyEvent() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: IndexedStack(index: _selectedIndex, children: _screens),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: Consumer<UserProvider>(
            builder: (context, provider, _) {
              return AppTopBar();
            },
          ),
        ),
      ],
    );
  }

  _buildBottomBar() {
    return BottomAppBar(
      color: Colors.white.withValues(alpha: 0.1),
      shape: const CircularNotchedRectangle(),
      notchMargin: 5.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNewTabItem(Icons.group_outlined, "Friends", 0),
          _buildNewTabItem(Icons.home_outlined, "Home", 1),
          SizedBox(width: 10),
          _buildNewTabItem(Icons.groups_outlined, "Groups", 2),
          _buildNewTabItem(Icons.settings_outlined, "Account", 3),
        ],
      ),
    );
  }

  _buildNewTabItem(IconData tabIcon, String label, int index) {
    final isSelected = _selectedIndex == index;
    final color =
        isSelected ? Colors.white : Colors.white.withValues(alpha: 0.5);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        loadCircleIcon(
          icon: tabIcon,
          iconColor: color,
          borderColor:
              isSelected
                  ? Colors.white.withValues(alpha: 0.7)
                  : Colors.white.withAlpha(40),
          iconSize: 22,
          radius: 18,
          onTap: () => _onItemTapped(index),
        ),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontFamily: fontRoboto,
            fontSize: 11,
            fontWeight: isSelected ? FontWeight.w900 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
/**
 * BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: backgroundColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          _onItemTapped(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Friends"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
      // _buildTabItem(IconData tabIcon, String label, int index) {
  //   final isSelected = _selectedIndex == index;
  //   final color =
  //       isSelected ? Colors.deepPurple : Colors.white.withValues(alpha: 0.7);
  //   return InkWell(
  //     highlightColor: Colors.transparent,
  //     splashColor: Colors.transparent,
  //     onTap: () => _onItemTapped(index),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Icon(tabIcon, color: color),
  //         Text(
  //           label,
  //           style: TextStyle(
  //             color: color,
  //             fontFamily: fontRoboto,
  //             fontSize: 12,
  //             fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

 */