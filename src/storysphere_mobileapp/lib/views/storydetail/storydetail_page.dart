import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';
import 'package:storysphere_mobileapp/views/storydetail/widgets/storychapters_section.dart';
import 'package:storysphere_mobileapp/views/storydetail/widgets/storycontentoutline_section.dart';
import 'package:storysphere_mobileapp/views/storydetail/widgets/storycover_section.dart';

@RoutePage()
class StoryDetailPage extends StatefulWidget {
  final int storyId;
  const StoryDetailPage({super.key, required this.storyId});

  @override
  State<StoryDetailPage> createState() => _StoryDetailPage();
}

class _StoryDetailPage extends State<StoryDetailPage> {
  late int storyId;

  @override
  Widget build(BuildContext context) {
    Story story = Story(
        storyId: 1, 
        storyCover: 'https://drive.google.com/uc?export=view&id=1jLZbGHPzOEz-E9To-i8xj4_V-fHeKiM6', 
        storyName: 'LÂU ĐÀI ĐỎ',
        bookAuthorName: 'Jue Hur',
      );

    return Scaffold(
      bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StoryCoverSectionWidget(story: story ),
            
            20.verticalSpace,
            StoryContentOutlineWidget(data: story.storyContentOutline ?? ''),

            20.verticalSpace,
            StoryChapterListWidget(storyId: story.storyId!),

          ],
        )
      ),
    );
   }
}
