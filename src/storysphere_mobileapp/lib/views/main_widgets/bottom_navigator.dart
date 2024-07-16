import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';

class SPBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  const SPBottomNavigationBar({super.key, required this.selectedIndex});

  @override
  State<SPBottomNavigationBar> createState() =>
      _SPBottomNavigationBarState();
}

class _SPBottomNavigationBarState extends State<SPBottomNavigationBar> {
  int selectedIndex = 0;
  int currentUser = 0;

  Future<void> getCurrentUser() async {
    //var currUser = FirebaseAuth.instance.currentUser;
    //if (currUser != null) {
      currentUser = 0;
    //}
  }
  void _onItemTapped(int index) {
    setState(() {
      switch(index){
        case 0: 
              Navigator.pop(context);
              context.pushRoute(const HSHomePage(),);
              break;
        case 1:
              Navigator.pop(context);
              context.pushRoute(const SearchingPage());
              break;
        case 2:
              Navigator.pop(context);
              context.pushRoute(MyWorksPage(userId: currentUser ));
              break;
        case 3:
              Navigator.pop(context);
              context.pushRoute(LibraryPage(userId: currentUser));
              break;
        case 4:
              Navigator.pop(context);
              context.pushRoute(UserAccountPage(userId: currentUser ));
              break;
        default:
              Navigator.pop(context);
              context.pushRoute(const HSHomePage(),);
              break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    selectedIndex = widget.selectedIndex;
    getCurrentUser();

    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          selectedIndex == 0 ?
            BottomNavigationBarItem(
              icon: IconsSVG.homeBold,
              label: ''
            )
          : BottomNavigationBarItem(
            icon: IconsSVG.homeNormal,
            label: ''
          ),

          selectedIndex == 1
          ? BottomNavigationBarItem(
              icon: IconsSVG.searchBold,
              label: ''
            )
          : BottomNavigationBarItem(
              icon: IconsSVG.searchNormal,
              label: ''
            ),

          selectedIndex == 2
          ? BottomNavigationBarItem(
              icon: IconsSVG.editBold,
              label: ''
            )
          : BottomNavigationBarItem(
              icon: IconsSVG.editNormal,
              label: ''
            ),

          selectedIndex == 3
          ? BottomNavigationBarItem(
              icon: IconsSVG.saveBold,
              label: ''
            )
          : BottomNavigationBarItem(
              icon: IconsSVG.saveNormal,
              label: ''
            ),

          selectedIndex == 4
          ? BottomNavigationBarItem(
              icon: IconsSVG.userBold,
              label: ''
            )
          : BottomNavigationBarItem(
              icon: IconsSVG.userNormal,
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
