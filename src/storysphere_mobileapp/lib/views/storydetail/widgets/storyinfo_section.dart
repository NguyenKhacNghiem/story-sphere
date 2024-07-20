import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/views/searching/widgets/story_data_widget.dart';
import 'package:storysphere_mobileapp/views/storydetail/widgets/storyrate_section.dart';

class StoryInfoSection extends StatelessWidget {
  final Story story;
  const StoryInfoSection({super.key, required this.story});

  @override
  Widget build(BuildContext context) {

    return 
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //book Title
        Container(
          width:  (MediaQuery.of(context).size.width*0.8).sp,
          child:  Text(
            story.storyName!,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            style: FontConstant.bookTitleDisplay,),
        ),
        5.verticalSpace,

        //author name
        Text(story.bookAuthorName == null ? 'Vô danh' : story.bookAuthorName!, style: FontConstant.authorNameDisplay,),
        3.verticalSpace,
        //Text(story.storyContentOutline == null ? '' : story.storyContentOutline!, style: FontConstant.contentOutLine,),

        StoryRatingSectionWidget(ratePoint: story.ratingPoint ?? 3),
        8.verticalSpace,
        StoryDataWidget(viewCount: story.viewCount ?? 0, voteCount: story.voteCount ?? 0, chapterCount: story.chapterCount ?? 1,),
        
         

      ],
    );
  }
  
}
