import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationBarExample extends StatefulWidget {
  final int selectedIndex;
  const BottomNavigationBarExample({super.key, required this.selectedIndex});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    selectedIndex = widget.selectedIndex;

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
