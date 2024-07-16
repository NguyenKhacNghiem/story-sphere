import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';

@RoutePage()
class UserAccountPage extends StatefulWidget {
  final int userId;
  const UserAccountPage({super.key, required this.userId});

  @override
  State<UserAccountPage> createState() => _UserAccountPage();
}

class _UserAccountPage extends State<UserAccountPage> {
  late int storyId;

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 4),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('User Account')
          ],
        )
      ),
    );
   }
}
