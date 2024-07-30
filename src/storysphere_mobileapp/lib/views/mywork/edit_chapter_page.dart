import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';
import 'package:storysphere_mobileapp/services/chapter_services.dart';
import 'package:storysphere_mobileapp/views/main_widgets/hs_enhanced_html_editor.dart';

@RoutePage()
class EditChapterPage extends StatefulWidget {
  final Chapter chapter;
  const EditChapterPage({super.key, required this.chapter});

  @override
  State<EditChapterPage> createState() => _EditChapterPage();
}

class _EditChapterPage extends State<EditChapterPage> {
  late Chapter chapter;
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
    initData();
    isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
  
    return Scaffold(
      body: SingleChildScrollView(
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
            Text(Strings.editChapter, style: FontConstant.headline1White,),
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
    chapter = widget.chapter;
    titleController.text = chapter.chapterName ?? '';

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
     contentEditor = HSEnhancedHtmlEditor(
        controller: chapterController,
        initialValue: '',
        initialHeight:  isKeyboardVisible ? 280.sp:  450.sp,
      );
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
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConstants.formStrokeColor,
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
    Chapter newchapter = Chapter();
    String chapterTitle = titleController.text;
    newchapter.chapterName = chapterTitle;
    newchapter.chapterStatus = status;

    var temptstoryContentString = chapterController.getText();
    temptstoryContentString.whenComplete(() => temptstoryContentString.then((value) async {
      newchapter.chapterContent = value;
      newchapter.wordsCount =  value.split(' ').length;
      
      try {
        final response = await ChapterService().updateChapter(newchapter, widget.chapter.chapterId ?? -1);
        debugPrint('Review sent successfully: ${response.body}');

      } catch (e) {
        debugPrint('Error sending review: $e');
      }

    }));

  }
}
