import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
@RoutePage()
class AddChapterPage extends StatefulWidget {
  final int userId;
  final int storyId;
  const AddChapterPage({super.key, required this.userId, required this.storyId});

  @override
  State<AddChapterPage> createState() => _AddChapterPage();
}

class _AddChapterPage extends State<AddChapterPage> {
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
            const Text('Add Chapter page')
          ],
        )
      ),
    );
   }
}
