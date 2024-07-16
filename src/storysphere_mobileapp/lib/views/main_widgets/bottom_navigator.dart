import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';

class BottomNavigationBarExample extends StatefulWidget {
  final int selectedIndex;
  final int userId;
  const BottomNavigationBarExample({super.key, required this.selectedIndex, required this.userId});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int selectedIndex = 0;
  int userId = 0;
  void _onItemTapped(int index) {
    setState(() {
      switch(index){
        case 0: 
              context.pushRoute(const HSHomePage(),);
              break;
        case 1:
              context.pushRoute(const SearchingPage());
              break;
        case 2:
              context.pushRoute(MyWorksPage(userId: userId ));
              break;
        case 3:
              context.pushRoute(LibraryPage(userId: userId));
              break;
        case 4:
              context.pushRoute(UserAccountPage(userId:userId ));
              break;
        default: 
              context.pushRoute(const HSHomePage(),);
              break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    selectedIndex = widget.selectedIndex;
    userId = widget.userId;

    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          selectedIndex == 0 ?
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home-bold.svg'),
              label: ''
            )
          : BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home-normal.svg'),
            label: ''
          ),

          selectedIndex == 1
          ? BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/search-bold.svg'),
              label: ''
            )
          : BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/search-normal.svg'),
              label: ''
            ),

          selectedIndex == 2
          ? BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/edit-bold.svg'),
              label: ''
            )
          : BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/edit-normal.svg'),
              label: ''
            ),

          selectedIndex == 3
          ? BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/save-bold.svg'),
              label: ''
            )
          : BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/save-normal.svg'),
              label: ''
            ),

          selectedIndex == 4
          ? BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/user-bold.svg'),
              label: ''
            )
          : BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/user-normal.svg'),
              label: ''
            ),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      );
  }
}
