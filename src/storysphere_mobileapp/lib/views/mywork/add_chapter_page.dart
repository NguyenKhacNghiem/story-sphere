import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/constants/utils/responsive.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/services/chapter_services.dart';
import 'package:storysphere_mobileapp/views/main_widgets/hs_enhanced_html_editor.dart';

@RoutePage()
class AddChapterPage extends StatefulWidget {
  final Story story;
  const AddChapterPage({super.key, required this.story});

  @override
  State<AddChapterPage> createState() => _AddChapterPage();
}

class _AddChapterPage extends State<AddChapterPage> {
  late int storyId;
  final TextEditingController titleController = TextEditingController();
  late Widget chapterTilteField;
  late Widget buttonList;
  final HtmlEditorController chapterController = HtmlEditorController();
  late HSEnhancedHtmlEditor contentEditor;
  late bool isKeyboardVisible;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    initData();
  
    return Scaffold(
      body: SingleChildScrollView(
        padding: Responsive.isMobile(context) ? EdgeInsets.all(0.sp) : EdgeInsets.symmetric(horizontal: 50.sp),
        child: 
        Padding(
          padding: EdgeInsets.all(20.sp),
          child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            40.verticalSpace,
            Row(children: [
              InkWell(
                onTap: () {
                  context.pushRoute(EditStoryPage(story: widget.story));
                },
                child: const Icon(
                  Icons.arrow_back, 
                  color: ColorConstants.primaryText,
                  size: 25,),
              ),
              10.horizontalSpace,
              Text(Strings.addNewChapter, style: FontConstant.headline1White,),
            ],),
           
            
            10.verticalSpace,
            //BUTTON LIST
            buttonList,

            20.verticalSpace,
            //CHAPTER TITLE
            chapterTilteField,
            
            //CHAPTER CONTENT EDITOR
            10.verticalSpace,
            contentEditor,

          ],
        )),
      ),
    );
   }

  initData(){
    storyId = widget.story.storyId?? - 1;
    contentEditor = HSEnhancedHtmlEditor(
      controller: chapterController,
      initialValue: '',
      initialHeight:  isKeyboardVisible ? 280.sp:  450.sp,
    );

    chapterTilteField = Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorConstants.formStrokeColor,
            width: 1.sp,),
          borderRadius: BorderRadius.circular(5.sp),
        ),
        child:Padding(
            padding: EdgeInsets.all(5.sp),
            child: TextField(
              controller: titleController,
              style:  FontConstant.buttonTextGrey,
              decoration: const InputDecoration(
                hintText: Strings.chapterTitle,
                fillColor: ColorConstants.transparent,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintStyle: TextStyle(color: ColorConstants.secondaryText),
              ),
            
          ),
      ),);
   
    buttonList = Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    validationAndSubmit(0);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConstants.secondaryText,
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                    child:  Wrap(
                        children: [
                          IconsSVG.draft,
                          5.horizontalSpace,
                          Text(Strings.saveDraft, style: FontConstant.buttonTextWhite,),
                        ],)),
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
                   validationAndSubmit(2);
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
                          IconsSVG.publish,
                          5.horizontalSpace,
                          Text(Strings.publish, style: FontConstant.buttonTextWhite,),
                        ],))
                  
                  )
                  ),
              ],
            );
   }

   
  Future<void> validationAndSubmit(int status) async {
    Chapter newChapter = Chapter();
     var temptstoryContentString = chapterController.getText();
    temptstoryContentString.whenComplete(() => temptstoryContentString.then((value) async {
      newChapter.chapterContent = value;
      newChapter.fkStoryId = widget.story.storyId;
      newChapter.chapterName = titleController.text;
      newChapter.chapterUrlKey = DateTime.now().toIso8601String();
      newChapter.chapterOrder = widget.story.chapterCount;
      newChapter.chapterStatus = status;
      newChapter.matureContent = false;
      newChapter.wordsCount =  value.split(' ').length;
      newChapter.commercialActivated = false;
      newChapter.chapterSellPrice = 0.0;

    try {
      final response = await ChapterService().createChapter(newChapter);
      debugPrint('Chapter sent successfully: ${response.body}');
      if (status == 2) {
          final Map<String, dynamic> temp = jsonDecode(response.body);
          // Truy cập trường result
          final result = temp['result'];
          Chapter data = Chapter.fromJson(result);
          context.pushRoute(ChapterPage(chapter: data, storyName: widget.story.storyName ?? ''));
      } else {
        context.pushRoute(EditStoryPage(story: widget.story));
      }
    } catch (e) {
      debugPrint('Error sending Chapter: $e');
    }
    }));
  }
}
