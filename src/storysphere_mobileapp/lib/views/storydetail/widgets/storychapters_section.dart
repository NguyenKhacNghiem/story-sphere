import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';
import 'package:storysphere_mobileapp/models/pagination_result.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/services/chapter_services.dart';
import 'package:storysphere_mobileapp/views/storydetail/widgets/chapterName_widget.dart';

class StoryChapterListWidget extends StatefulWidget {
  final Story story;
  const StoryChapterListWidget({super.key, required this.story});

  @override
  State<StoryChapterListWidget> createState() => _StoryChapterListWidget();
}

class _StoryChapterListWidget extends State<StoryChapterListWidget> {
  late Story story;
  List<Chapter> chapterList = [];
  bool notFound = false;
  late Widget showMoreButton;
  bool isExpanded = false;


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //get chapters from story id
    initData();
    return 
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.sp),
          child: 
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(Strings.chapterList, style: FontConstant.headline2White,),
            10.verticalSpace,
            
            chapterList.isNotEmpty
            ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${chapterList.length} ${Strings.chapter}', style: FontConstant.chapterDisplay,),
                GestureDetector(
                  onTap: () {
                    context.pushRoute(ChapterListPage(chapters: chapterList, story: widget.story));
                  },
                  child: Text(
                    Strings.showAll,
                    style: FontConstant.purpleText,
                  ),
                ),
              ],)
            : const CircularProgressIndicator(),

            10.verticalSpace,
            Container(
              height: 230.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.sp),
                border: Border.all(color: ColorConstants.primaryText, width: 1.sp)
              ),
              child: 
              Padding(padding: EdgeInsets.all(5.sp),
              child: 
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  controller: ScrollController(),
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: chapterList.length < 5 ? chapterList.length : 5,
                  itemBuilder: (context, index) {
                    if (chapterList.length > 5 && index == 4 ) {
                      return Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: Text('...', style: FontConstant.dataDisplay,),
                      );
                    }
                    else {
                      return Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: InkWell(
                        onTap: () {
                          context.pushRoute(ChapterPage(chapter: chapterList.elementAt(index), storyName: story.storyName ?? '' ));
                        },
                        child: ChapterNameWidget(chapter: chapterList.elementAt(index),)
                      ),
                      );
                    }
                    })
              ), 
            )
            
            
            
          ])
        
    );
   }

  
  void initData() {
    story = widget.story;
    // GET DATA
     if (chapterList.isEmpty && !notFound) {
      final result =  ChapterService().getChaptesrByStoryId(story.storyId ?? -1, 1);
      result.whenComplete(() {
        result.then((value) {
          if (value != null && value is PaginationResult<Chapter> ) {
            setState(() {
              chapterList = value.result;
            });
          }
        });
      });
    }
    

  }
   
}
