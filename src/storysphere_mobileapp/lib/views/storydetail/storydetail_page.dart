import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';
import 'package:storysphere_mobileapp/views/storydetail/widgets/storychapters_section.dart';
import 'package:storysphere_mobileapp/views/storydetail/widgets/storycontentoutline_section.dart';
import 'package:storysphere_mobileapp/views/storydetail/widgets/storycover_section.dart';
import 'package:storysphere_mobileapp/views/storydetail/widgets/storyreview_widget.dart';

@RoutePage()
class StoryDetailPage extends StatefulWidget {
  final Story story;
  const StoryDetailPage({super.key, required this.story});

  @override
  State<StoryDetailPage> createState() => _StoryDetailPage();
}

class _StoryDetailPage extends State<StoryDetailPage> {
  late int storyId;

  @override
  Widget build(BuildContext context) {
    Story story = widget.story;

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
            StoryChapterListWidget(story: story),

            20.verticalSpace,
            StoryReviewWidget(story: story,)

          ],
        )
      ),
    );
   }
}
