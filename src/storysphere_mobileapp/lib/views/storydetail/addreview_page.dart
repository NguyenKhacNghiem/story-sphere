import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

@RoutePage()
class AddReviewPage extends StatefulWidget {
  final Story story;
  const AddReviewPage({super.key, required this.story});

  @override
  State<AddReviewPage> createState() => _AddReviewPage();
}

class _AddReviewPage extends State<AddReviewPage> {
  late Widget fromStory;
  int ratePoint = 0;
  final quill.QuillController reviewContentController = quill.QuillController.basic();
  int wordcount = 0;
  final FocusNode focusNode = FocusNode();
  late bool isKeyboardVisible;

  
  @override
  void initState() {
    super.initState();
    reviewContentController.addListener(onFocusChanged);
  }

  @override
  void dispose() {
    reviewContentController.dispose();
    reviewContentController.removeListener(onFocusChanged);
    super.dispose();
  }

  void onFocusChanged() {
    String? plainText = reviewContentController.getPlainText();
    
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screnHeight = MediaQuery.of(context).size.height;
    isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 1),
      body:  Stack(
          fit: StackFit.expand,
          children: [
          // Background image
          Positioned(
            top: 0,
            left: 0,
            child: 
              Container(
                height: 444.sp,
                width: screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.story.storyCover ?? Strings.defaultCover),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
              )),

          // Darker effect
          Container(
            height: screnHeight,
            decoration: BoxDecoration(
              color: ColorConstants.black.withOpacity(0.7), 
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child:
          Container(
          width: screenWidth,
          height: screnHeight*0.7,
          decoration: const BoxDecoration(
            gradient:  LinearGradient(
              colors: [ColorConstants.transparent, ColorConstants.darkGreenBackground],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          )),

            // Main content
            Center(
              child:
              Padding(padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    20.verticalSpace,
                    Text(Strings.writeReview, style: FontConstant.titleBigDisplayWhite,),
                    2.verticalSpace,
                    fromStory,
                    20.verticalSpace,

                    //RATING POINT
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              ratePoint = 1;
                            });
                          },
                          child: ratePoint >= 1.0 ? IconsSVG.starYellowBig : IconsSVG.starTagBig,
                        ),
                        5.horizontalSpace,
                         InkWell(
                          onTap: (){
                            setState(() {
                              ratePoint = 2;
                            });
                          },
                          child: ratePoint >= 2.0 ? IconsSVG.starYellowBig : IconsSVG.starTagBig,
                        ),
                        5.horizontalSpace,
                        InkWell(
                          onTap: (){
                            setState(() {
                              ratePoint = 3;
                            });
                          },
                          child: ratePoint >= 3.0 ? IconsSVG.starYellowBig : IconsSVG.starTagBig,
                        ),
                        5.horizontalSpace,
                        InkWell(
                          onTap: (){
                            setState(() {
                              ratePoint = 4;
                            });
                          },
                          child: ratePoint >= 4.0 ? IconsSVG.starYellowBig : IconsSVG.starTagBig,
                        ),
                        5.horizontalSpace,
                        InkWell(
                          onTap: (){
                            setState(() {
                              ratePoint = 5;
                            });
                          },
                          child: ratePoint >= 5 ? IconsSVG.starYellowBig : IconsSVG.starTagBig,
                        ),
                    ],),

                    20.verticalSpace,

                    //REVIEW CONTENT
                    Container(
                      color: ColorConstants.secondaryText,
                      child: 
                      QuillToolbar.simple(
                        configurations: QuillSimpleToolbarConfigurations(
                          controller: reviewContentController,
                          color: ColorConstants.secondaryText,
                          toolbarIconAlignment: WrapAlignment.center,
                          multiRowsDisplay: false,
                          toolbarIconCrossAlignment: WrapCrossAlignment.center,
                          showAlignmentButtons: false,
                        ),
                    )),
                    Container(
                      height: isKeyboardVisible ? 280.sp:  450.sp,
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorConstants.formStrokeColor),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.sp), bottomRight: Radius.circular(5.sp))
                      ),
                      child: quill.QuillEditor.basic(
                        configurations: QuillEditorConfigurations(
                            controller: reviewContentController,
                            autoFocus: false,
                          ),
                          focusNode: focusNode, 
                      ),
                    ),
                    
                    //SUBMIT BUTTON
                    20.verticalSpace,
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
                            IconsSVG.writeReview,
                            5.horizontalSpace,
                            Text(Strings.rate, style: FontConstant.buttonTextWhite,),
                          ],))
                    
                    )
                    ),
                  ],
                )
              ),
            )),
          ],
        ),
      );
      
      
      
      
    
   }

  initData(){
    fromStory = Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${Strings.forStory} ',
                style: FontConstant.fromStoryLabel,
              ),
              TextSpan(
                text: widget.story.storyName!,
                style:FontConstant.fromStorystoryName
              ),
            ],
          ),
          style: FontConstant.authorNameDisplay,
        ),
      );
   }
}
