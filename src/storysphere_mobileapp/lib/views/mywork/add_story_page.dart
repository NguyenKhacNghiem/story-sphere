import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
@RoutePage()
class AddStoryPage extends StatefulWidget {
  final int userId;
  const AddStoryPage({super.key, required this.userId});

  @override
  State<AddStoryPage> createState() => _AddStoryPage();
}

class _AddStoryPage extends State<AddStoryPage> {
  late int storyId;

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Add Story page')
          ],
        )
      ),
    );
   }
}
