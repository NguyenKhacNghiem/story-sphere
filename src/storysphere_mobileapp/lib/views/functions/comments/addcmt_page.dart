import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
@RoutePage()
class AddCommentPage extends StatefulWidget {
  final int storyId;
  const AddCommentPage({super.key, required this.storyId});

  @override
  State<AddCommentPage> createState() => _AddCommentPage();
}

class _AddCommentPage extends State<AddCommentPage> {
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
            const Text('My Works page')
          ],
        )
      ),
    );
   }
}
