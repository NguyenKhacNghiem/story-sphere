import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/services/favbook_service.dart';

class BookDisplayWidget extends StatefulWidget {
  final Story story;
  final bool? fromLib;
  final int? favBookId;

  const BookDisplayWidget({super.key, required this.story, this.fromLib, this.favBookId});

  @override
  State<BookDisplayWidget> createState() => _BookDisplayWidget();
}

class _BookDisplayWidget extends State<BookDisplayWidget> {
  late  Story story;
  bool showDeleteIcon = false;
  bool deleted = false;

  @override
  Widget build(BuildContext context) {
    story = widget.story;
    if (deleted) {
      return 0.verticalSpace;
    }
    return InkWell(
        onTap: () => context.pushRoute(
          StoryDetailPage(
            story: story,
          ),
        ),
        onLongPress: () {
          if (widget.fromLib == true){
            onDeletePressed();
          }
        },
        child:
        //Main content
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 105.sp,
                height: 160.sp,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.sp),
                  child: 
                  story.storyCover != null && story.storyCover! != "???"
                  ? Image.network(story.storyCover ?? '', fit: BoxFit.cover,)
                  : Image.network(Strings.defaultCover))),
              5.verticalSpace,
              SizedBox(
                width: 105.sp,
                child:Text (story.storyName ?? 'Null', style: FontConstant.subTitleText, overflow: TextOverflow.ellipsis,))
              
            ],),
        ),
      
         
    );
  }
  
  Future<void> handleDeleteFavStory() async {
    try {
      final response = await FavBookService().deleteStoryById(widget.favBookId ?? -1);
      if (response.statusCode == 200) {
        debugPrint('Review sent successfully: ${response.body}');
        final responseData = json.decode(response.body);
         if (responseData['code'] == 0 || responseData['code'] == 100) {   
          setState(() {deleted = true;});     
           
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


  onDeletePressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(Strings.removeFromLib),
          content: const Text(Strings.removeLibContent),
          actions: [
            TextButton(
              child: Text(Strings.cancel, style: FontConstant.buttonTextWhite,),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(Strings.delete, style: FontConstant.buttonTextWhite.copyWith(color: ColorConstants.activeOrange),),
              onPressed: () {
                // Thêm logic xóa ở đây
                handleDeleteFavStory();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  
}
