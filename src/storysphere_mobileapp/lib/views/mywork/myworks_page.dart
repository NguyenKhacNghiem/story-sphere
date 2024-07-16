import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';
@RoutePage()
class MyWorksPage extends StatefulWidget {
  final int userId;
  const MyWorksPage({super.key, required this.userId});

  @override
  State<MyWorksPage> createState() => _MyWorksPage();
}

class _MyWorksPage extends State<MyWorksPage> {
  late int storyId;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 2),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('My Works page')
          ],
        )
      ),
    );
   }
}
