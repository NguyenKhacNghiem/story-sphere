import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
@RoutePage()
class AddReviewPage extends StatefulWidget {
  final int storyId;
  const AddReviewPage({super.key, required this.storyId});

  @override
  State<AddReviewPage> createState() => _AddReviewPage();
}

class _AddReviewPage extends State<AddReviewPage> {
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
