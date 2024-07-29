import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/services/favbook_service.dart';
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
  late int userId;
  bool saved = false;

  @override
  void initState() {
    _loadUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Story story = widget.story;
    storyId = story.storyId ?? -1;

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
            Center(
              child:
            ElevatedButton(
                   style: ElevatedButton.styleFrom(
                    backgroundColor: saved ? ColorConstants.activeOrange: ColorConstants.primaryText,
                    padding: EdgeInsets.all(10.sp), // Remove padding
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: (){
                    if (!saved) {
                      validationAndSubmit();
                    }
                  }, 
                child: Row (
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisSize: MainAxisSize.min,
                    children: [
                    saved ? IconsSVG.saveNormal : IconsSVG.saveBold,
                    10.horizontalSpace,
                    saved 
                    ? Text( 'Đã lưu', style: FontConstant.headline3White,)
                    : Text('Lưu vào thư viện', style: FontConstant.headline3,)
                ],),
                
            ),
            ),
            
            
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


  Future<void> _loadUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('userId') ?? -1;
    });
  }

   
   Future<void> validationAndSubmit() async {
    try {
      final response = await FavBookService().createFavStory(userId, storyId, null);
      if (response.statusCode == 200) {
        debugPrint('Review sent successfully: ${response.body}');
        setState(() {
          saved = true;
        });

      }
      
    } catch (e) {
      debugPrint('Error sending review: $e');
    }
    
  }
}
