import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/services/story_service.dart';

// ignore: must_be_immutable
class BookEditSectionWidget extends StatefulWidget {
  final Story story;
  BookEditSectionWidget({super.key, required this.story});

  @override
  State<BookEditSectionWidget> createState() => _BookEditSectionWidget();
}

class _BookEditSectionWidget extends State<BookEditSectionWidget> {
  late Widget buttonList;
  late Story story;
  bool showDeleteIcon = false;
  bool deleted = false;

  @override
  Widget build(BuildContext context) {
    if (deleted) {
      return 0.verticalSpace;
    }
    initData(context);

    return 
    InkWell(
        onLongPress: () {
           setState(() {
            showDeleteIcon = true;
          });
        },
        child:  Stack(
        children: [
          //Main Content
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
      
          InkWell(
            onTap: (){
              context.pushRoute(StoryDetailPage(story: story));
            },
            child: 
          
          SizedBox(
              width: 100.sp,
              height: 155.sp,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.sp),
                child: Image.network(story.storyCover ?? Strings.defaultCover, fit: BoxFit.cover,)))
        ),
          20.horizontalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SizedBox(
                width: 200.sp,
                child: 
                Text(story.storyName ?? '', 
                      style: FontConstant.bookTitleItem, 
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.start,)),
                

              Text(story.bookAuthorName == null ? 'Vô danh' : story.bookAuthorName!, style: FontConstant.authorNameDisplay,),
              5.verticalSpace,
                SizedBox(
                  width: 200.sp,
                  child: 
              Text(story.storyContentOutline == null ? '' : story.storyContentOutline!, 
                    style: FontConstant.contentOutLine,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,)),

              10.verticalSpace,
              buttonList,
            ],
          )
        ]),

         if (showDeleteIcon)
            Positioned(
              bottom: 10,
              left: 20,
              child: Container(
                width: 50.sp,
                height: 50.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.sp),
                  color: ColorConstants.bgWhite,
                ),
                
                child: Padding(padding: EdgeInsets.all(5.sp),
                child: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),                
                onPressed: onDeletePressed,
              ),)
              )
              
             
            ),

    ]));
  }

  initData(BuildContext context){
    story = widget.story;
    buttonList = Row(
      children: [
        ElevatedButton(
           style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.transparent,
                    shadowColor: ColorConstants.transparent,
                    padding: EdgeInsets.zero, // Remove padding
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink wrap the button
                  ),
          onPressed: () {
            context.pushRoute(EditStoryPage(story: story));
          },
          child: Container(
            decoration: BoxDecoration(
              color: ColorConstants.secondaryText,
              borderRadius: BorderRadius.circular(5.sp),
            ),
            
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
            child: Text(Strings.edit, style: FontConstant.buttonTextWhite,),),
          )
          ),
        5.horizontalSpace,

        ElevatedButton(
           style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.transparent,
                    shadowColor: ColorConstants.transparent,
                    padding: EdgeInsets.zero, // Remove padding
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink wrap the button
                  ),
          onPressed: () {
            Navigator.pop(context);
            context.pushRoute(AddChapterPage(story: story));
          },
          child: Container(
            decoration: BoxDecoration(
              color: ColorConstants.buttonLightGreen,
              borderRadius: BorderRadius.circular(5.sp),
            ),
            
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
            child: 
              Wrap(
                children: [
                  IconsSVG.add,
                  5.horizontalSpace,
                   Text(Strings.newChapter, style: FontConstant.buttonTextWhite,),
                ],))
           
          )
          ),
      ],
    );

  }
  
  Future<void> handleDeleteStory() async {
    try {
      final response = await StoryService().deleteStoryById(story.storyId ?? -1);
      if (response.statusCode == 200) {
        debugPrint('Review sent successfully: ${response.body}');
        final responseData = json.decode(response.body);
         if (responseData['code'] == 0 || responseData['code'] == 100) {
          setState(() {
            deleted = true;
          });
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(Strings.error),
                content: Text(responseData['message']),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
        
      }
      
    } catch (e) {
      debugPrint('Error sending review: $e');
    }
  }


  void onDeletePressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(Strings.deleteStory),
          content: const Text(Strings.deleteStoryAlert),
          actions: [
            TextButton(
              child: const Text(Strings.cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(Strings.delete),
              onPressed: () {
                // Thêm logic xóa ở đây
                handleDeleteStory();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
