import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/services/chapter_services.dart';


class ChapterListWriteItemWidget extends StatefulWidget {
  final Chapter chapter;
  const ChapterListWriteItemWidget({super.key, required this.chapter});
  
  @override
  State<ChapterListWriteItemWidget> createState() => _ChapterListWriteItemWidget();
}

class _ChapterListWriteItemWidget extends State<ChapterListWriteItemWidget> {
  late Chapter chapter;
  bool showDeleteIcon = false;
  bool deleted = false;

  @override
  Widget build(BuildContext context) {
    chapter = widget.chapter;
    
    double itemWidth =(MediaQuery.of(context).size.width - 100.sp).sp;
    Widget chapterData = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 5.sp),
        child: IconsSVG.documentDraft,
        ),
         
         10.horizontalSpace,
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: itemWidth,
              child:  
              Text(chapter.chapterName ?? '', 
                style: FontConstant.headline3White.copyWith(height: 1.5.sp), 
                overflow: TextOverflow.clip,
              ),
            ),
           
            3.verticalSpace,
            Text(chapter.wordsCount.toString() + Strings.words, style: FontConstant.chapterData,),
            3.verticalSpace,
            Text(chapter.chapterStatus! == 2 ? Strings.published : Strings.drarf, style: FontConstant.chapterData,),
          ],
         ),
      ],);

    if (deleted) {
      return 0.verticalSpace;
    } else {
      return 
      InkWell(
        onTap: (){
           context.pushRoute(EditChapterPage(chapter: chapter));
        },
        onLongPress: () {
          //handle when API delete ready
           setState(() {
            //showDeleteIcon = true;
          });
        },
        child:  Stack(
        children: [
          //Main Content
          chapterData,

          if (showDeleteIcon)
            Positioned(
              bottom: 10,
              right: 20,
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
        ])
      );
    }
  }

  
  Future<void> handleDeleteStory() async {
    debugPrint('EEE');
      final response = await ChapterService().deleteChapterById(chapter.chapterId ?? -1);
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
            barrierDismissible: false, // Ngăn người dùng tương tác với phần còn lại của màn hình
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
   
  }

  void onDeletePressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(Strings.deleteChapter),
          content: const Text(Strings.deleteChapterAlert),
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
                debugPrint('Deleting...');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  
}
