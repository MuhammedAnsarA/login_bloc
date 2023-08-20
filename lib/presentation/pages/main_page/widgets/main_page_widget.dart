import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orbyx/presentation/pages/home/home_page.dart';
import 'package:orbyx/presentation/pages/profile/profile.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Course"),
    ),
    const Center(
      child: Text("Chat"),
    ),
    const ProfilePage(),
  ];

  return _widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 18.h,
      width: 18.w,
      child: Image.asset("assets/icons/home.png"),
    ),
    label: "Home",
    activeIcon: SizedBox(
      height: 18.h,
      width: 18.w,
      child: Image.asset(
        "assets/icons/home.png",
        color: Colors.green,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 18.h,
      width: 18.w,
      child: Image.asset("assets/icons/search2.png"),
    ),
    label: "Search",
    activeIcon: SizedBox(
      height: 18.h,
      width: 18.w,
      child: Image.asset(
        "assets/icons/search2.png",
        color: Colors.green,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 18.h,
      width: 18.w,
      child: Image.asset("assets/icons/add.png"),
    ),
    label: "Add",
    activeIcon: SizedBox(
      height: 18.h,
      width: 18.w,
      child: Image.asset(
        "assets/icons/add.png",
        color: Colors.green,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 18.h,
      width: 18.w,
      child: Image.asset("assets/icons/message-circle.png"),
    ),
    label: "Chat",
    activeIcon: SizedBox(
      height: 18.h,
      width: 18.w,
      child: Image.asset(
        "assets/icons/message-circle.png",
        color: Colors.green,
      ),
    ),
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      height: 18.h,
      width: 18.w,
      child: Image.asset("assets/icons/person2.png"),
    ),
    label: "Profile",
    activeIcon: SizedBox(
      height: 18.h,
      width: 18.w,
      child: Image.asset(
        "assets/icons/person2.png",
        color: Colors.green,
      ),
    ),
  ),
];
