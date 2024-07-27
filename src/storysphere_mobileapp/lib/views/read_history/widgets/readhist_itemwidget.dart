import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';
import 'package:storysphere_mobileapp/models/reading_history.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/services/chapter_services.dart';
import 'package:storysphere_mobileapp/services/story_service.dart';

class HistoryItemWidget extends StatefulWidget {
  final ReadingHistory readingHistory;
   const HistoryItemWidget({super.key, required this.readingHistory});

  @override
  State<HistoryItemWidget> createState() => _HistoryItemWidget();
}

class _HistoryItemWidget extends State<HistoryItemWidget> {
  Chapter? chapter;
  Story? story;
  late ReadingHistory readingHistory;
  String dateString = 'D';
  bool loadChapterDone = false;
  bool loadStoryDone = false;

  @override
  Widget build(BuildContext context) {
    readingHistory = widget.readingHistory;
    double itemWidth = (MediaQuery.of(context).size.width - 150.sp).sp;
    initData();
    
      if (!loadChapterDone && !loadStoryDone){
        return const Center(child: CircularProgressIndicator());
      } else {
        if (story == null) {
          return Center(child: Text(Strings.deletedContent, style: FontConstant.bookTitleItem,),);
        } else {
        return InkWell(
        onTap: () {
          context.pushRoute(StoryDetailPage(story: story!));},
        child: 
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorConstants.formStrokeColor),
            borderRadius: BorderRadius.circular(5.sp),
          ),
          child: 
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10.sp),
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              20.horizontalSpace,

              loadStoryDone && story != null
            ? SizedBox(
              width: 50.sp,
              height: 75.sp,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.sp),
                child: Image.network(story!.storyCover ?? Strings.defaultCover, fit: BoxFit.cover,)))
            : const Center(child: CircularProgressIndicator()),

              20.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //story name
                  loadStoryDone && story != null
                ? SizedBox(
                    width: itemWidth,
                    child: Text(
                      story?.storyName ?? '', 
                      style: FontConstant.buttonTextWhite,
                      overflow: TextOverflow.clip,
                      softWrap: true,),
                  )
                  : 0.verticalSpace,
                  10.verticalSpace,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Strings.lastVisited, style: FontConstant.historyLabel,),
                      10.horizontalSpace,
                      Text(dateString, style: FontConstant.hisStoryData,),
                    ],
                  ),
                  5.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Strings.lastReadChapter, style: FontConstant.historyLabel,),
                      10.horizontalSpace,
                      loadChapterDone
                      ? Text(chapter!.chapterName ?? '', style: FontConstant.hisStoryData,) : 0.verticalSpace,
                    ],
                  ),

                  10.verticalSpace,
                  Center(
                    child: Text(Strings.continuteToRead, style: FontConstant.purpleText,),
                  )

              ]),
          ],)
      )));
    }
   }
   
  }

  Future<void> initData() async {
    if (readingHistory.lastVisited != null) {
       dateString = "${readingHistory.lastVisited!.hour}:${readingHistory.lastVisited!.minute} ${readingHistory.lastVisited!.day}/${readingHistory.lastVisited!.month}/${readingHistory.lastVisited!.year}";
    }

    if (!loadChapterDone && !loadStoryDone) {
      final chapterResult = await fetchChapter();
      final storyResult = await fetchStory();

      setState(() {
        chapter = chapterResult;
        story = storyResult;
        loadChapterDone = true;
        loadStoryDone = true;
      });
    }
  }

  Future<Chapter?> fetchChapter() async{
     if (chapter == null && !loadChapterDone) {
      final result =  ChapterService().getChapterById(readingHistory.chapterId ?? -1);
      result.whenComplete(() {
        result.then((value) {
          if (value != null) {
            setState(() {
              loadChapterDone = true;
              chapter = value;
            });
          } else {
            loadChapterDone = true;
            chapter = Chapter(chapterId: -1, chapterName: '[Bạn chưa đọc chương nào]',);
          }
        });
      });
    }
     return null;
  }

  Future<Story?> fetchStory() async {
    if (story == null && !loadStoryDone) {
    final result =  StoryService().getStoryById(readingHistory.storyId ?? -1);
      result.whenComplete(() {
        result.then((value) {
          if (value != null) {
            setState(() {
              loadStoryDone = true;
              story = value;
            });
          } else {
            loadStoryDone = true;
          }
        });
      });
  }
    return null;

  }
  
}
