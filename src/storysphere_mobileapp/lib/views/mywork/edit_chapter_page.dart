import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:storysphere_mobileapp/models/chapter.dart';

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
  final quill.QuillController chapterController = quill.QuillController.basic();
  int wordcount = 0;
  final FocusNode focusNode = FocusNode();
  late bool isKeyboardVisible;


  @override
  void initState() {
    super.initState();
    chapterController.addListener(onFocusChanged);
  }

  @override
  void dispose() {
    chapterController.dispose();
    titleController.dispose();
    chapterController.removeListener(onFocusChanged);
    super.dispose();
  }

  void onFocusChanged() {
    String? plainText = chapterController.getPlainText();
    
    debugPrint(plainText);
    setState(() {
      if (plainText != "") {     
        wordcount = plainText.split(' ').length;
      } else {
        wordcount = 0;
      }
    });
     
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
            Text(Strings.addNewChapter, style: FontConstant.headline1White,),
            10.verticalSpace,

            //BUTTON LIST
            buttonList,

            20.verticalSpace,
            //CHAPTER TITLE
            chapterTilteField,
            
            //CHAPTER CONTENT EDITOR
            10.verticalSpace,
            Container(
              color: ColorConstants.grey,
              child: 
            QuillToolbar.simple(
              configurations: QuillSimpleToolbarConfigurations(
                controller: chapterController,
                color: ColorConstants.grey,
                toolbarIconAlignment: WrapAlignment.center,
                multiRowsDisplay: false,
                toolbarIconCrossAlignment: WrapCrossAlignment.center,
                showAlignmentButtons: false,
              ),
              
              
            )),
             Container(
                height: isKeyboardVisible ? 280.sp:  500.sp,
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.sp), bottomRight: Radius.circular(5.sp))
                ),
                child: quill.QuillEditor.basic(
                  configurations: QuillEditorConfigurations(
                      controller: chapterController,
                      autoFocus: false,
                    ),
                    focusNode: focusNode,
                    
                  
              ),
             
                
              
            ),
            5.verticalSpace,
            Align(
              alignment: Alignment.centerRight,
              child: Text(wordcount.toString() + Strings.words, style: FontConstant.authorNameDisplay,),
            ),

           
          ],
        )),
      ),
    );
   }

  initData(){
    chapter = widget.chapter;
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
                hintStyle: TextStyle(color: ColorConstants.textColorGrey),
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
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConstants.grey,
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
}
