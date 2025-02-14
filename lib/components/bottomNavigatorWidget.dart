// ignore: file_names
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_mobile_app/view/home/home_view.dart';
import 'package:my_mobile_app/view/home/print_view.dart';
import 'package:my_mobile_app/view/home/profile_view.dart';
import 'package:my_mobile_app/view/home/search_view.dart';

class BottomNavigatorWidget extends StatefulWidget {
  const BottomNavigatorWidget({super.key});

  @override
  State<BottomNavigatorWidget> createState() => _BottomNavigatorWidgetState();
}

class _BottomNavigatorWidgetState extends State<BottomNavigatorWidget> {
  List<IconData> iconList = [
    Icons.home_work,
    Icons.search_outlined,
    Icons.print_outlined,
    Icons.person,
  ];
  final List<Widget> _childern = [
    // ການເພີ່ມໜ້າໃໝ່ ເວລາກົດ Icon ທີ່ຢູ່ສ່ວນຕີນ
    HomeView(), // ໜ້າ Home
    SearchView(), // ໜ້າ search
    PrintView(), // ໜ້າ print
    ProfileView() // ໜ້າ profile
  ];
  int _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _childern[_bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Center(
          child: Icon(
            Icons.qr_code_scanner,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.red.shade400,
        icons: iconList,
        iconSize: 30, // ປັບຂະໜາດ Icon
        activeColor: Colors.white,
        inactiveColor: Colors.brown,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
