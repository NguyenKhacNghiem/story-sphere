import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';

@RoutePage()
class LibraryPage extends StatefulWidget {
  final int userId;
  const LibraryPage({super.key, required this.userId});

  @override
  State<LibraryPage> createState() => _LibraryPage();
}

class _LibraryPage extends State<LibraryPage> {
  late int storyId;

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 3,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Library')
          ],
        )
      ),
    );
   }
}
