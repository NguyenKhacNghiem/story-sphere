import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/views/chapters/widgets/chapterlist_drawersection.dart';
import 'package:storysphere_mobileapp/views/chapters/widgets/likecmt_section.dart';
import 'package:storysphere_mobileapp/views/searching/widgets/story_data_widget.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

@RoutePage()
class ChapterPage extends StatefulWidget {
  final Chapter chapter;
  final String storyName;
  const ChapterPage({super.key, required this.chapter, required this.storyName});

  @override
  State<ChapterPage> createState() => _ChapterPage();
}

class _ChapterPage extends State<ChapterPage> {
  late Chapter chapter;
  ScrollController scrollController = ScrollController();
  bool isSettingsBarVisible = true;
  bool showTextSettingPallet = false;
  bool showChapterDrawer = false;
  TextStyle currentTextStyle = FontConstant.beVNProRead;
  Color backgroundColor = ColorConstants.darkGreenBackground;
  bool isLiked = false;
  double _currentSliderValue = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (isSettingsBarVisible) {
          setState(() {
            isSettingsBarVisible = false;
          });
        }
      } else if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (!isSettingsBarVisible) {
          setState(() {
            isSettingsBarVisible = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    chapter = widget.chapter;
    initData();
    debugPrint(currentTextStyle.fontFamily);


    return Scaffold(
      backgroundColor: backgroundColor,
      body: 
       GestureDetector(
        onTap: () {
          if (!isSettingsBarVisible) {
            setState(() {
              isSettingsBarVisible = true;
            });
          }

          if (showTextSettingPallet) {
            setState(() {
            showTextSettingPallet = false;
          });
          }

          if (showChapterDrawer) {
            setState(() {
              showChapterDrawer = false;
            });
          }
        },
        child: Stack(
          children: [
             ListView(
              controller: scrollController,
              children: [
              SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
              child: 
             
              Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                50.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                     image: const DecorationImage(
                      image: NetworkImage('https://i.pinimg.com/564x/fb/61/95/fb6195ed51a8ee4ea4fd8cdd1ceb5791.jpg'),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.circular(10.sp)
                  ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      15.verticalSpace,
                       Center(
                          child: Text(widget.storyName, style: FontConstant.storyNameChapterWhite,),
                        ),
                        2.verticalSpace,
                        Center(
                          child:SizedBox(
                          width: MediaQuery.of(context).size.width*0.8,
                          child: Text(chapter.chapterName ?? '', 
                            style: FontConstant.resultTitleDisplay,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,),
                        ),),

                        20.verticalSpace,
                        StoryDataWidget(viewCount: chapter.viewCount ?? 0, voteCount: chapter.voteCount ?? 0, commentCount: chapter.commentCount ?? 0,),
                        15.verticalSpace,
                      ])
                        ),
                
               
                10.verticalSpace,
                HtmlWidget(
                  chapter.chapterContent ?? '',
                  textStyle: currentTextStyle,
                ),

                30.verticalSpace,
                ChapterLikeCommentSection(chapter: chapter),

              ],
            )),
          ),
          ]),
          40.verticalSpace,
          if (isSettingsBarVisible) buildSettingsBar(),
          if (showTextSettingPallet) buildTextSettingDialog(),
          if (showChapterDrawer) buildChapterListDrawer(),
      ])
    ));
   }

  Widget buildSettingsBar() {
     return 
     Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.sp),
        child: Container(
          height: 55.sp,
          color: ColorConstants.bottomNavBackground,
          child:
          Row (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(direction: Axis.horizontal,
            children: 
            [
              20.horizontalSpace,
              InkWell(
                onTap: (){
                  context.pushRoute(const HSHomePage());
                },
                child: IconsSVG.homeBold,
              ),
              20.horizontalSpace,
              InkWell(
                onTap: (){
                   setState(() {
                    isSettingsBarVisible = true;
                    showTextSettingPallet = true;
                  });
                },
                child: IconsSVG.settingWhite,
              ),
            ],),

            Wrap(children: [
              InkWell(
                onTap: (){
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                child: isLiked ? IconsSVG.likeBoldBig : IconsSVG.likeNormalBig,
              ),
              20.horizontalSpace,
              InkWell(
                onTap: (){
                  context.pushRoute(AddCommentPage(chapterId: chapter.chapterId ?? -1));
                },
                child: IconsSVG.commentBig,
              ),
              20.horizontalSpace,
              InkWell(
                onTap: (){
                  setState(() {
                    showChapterDrawer = true;
                  });
                },
                child: IconsSVG.chapterListBig,
              ),

              20.horizontalSpace,
            ],),
            
        ],),
        
      )));
   }

   initData(){}

  Widget buildTextSettingDialog(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 280.sp,
        decoration: BoxDecoration(
          color: ColorConstants.primaryText,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15.sp), topRight: Radius.circular(15.sp)),
          boxShadow: [
                BoxShadow(
                  color: backgroundColor == ColorConstants.darkGreenBackground ? ColorConstants.darkText : ColorConstants.darkGreenBackground.withOpacity(0.3), // Shadow color
                  offset: const Offset(0, 0), // Shadow offset
                  blurRadius: 10, // Shadow blur radius
                  spreadRadius: 4, // Shadow spread radius
                ),
              ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Strings.readSetting, style: FontConstant.bookTitleItem.copyWith(
              color: ColorConstants.darkText,
              fontWeight: FontWeight.bold),),
            20.verticalSpace,

            //TEXT SIZE SLIDER
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text(Strings.aA, style: FontConstant.smallTextDisplayLabel,),
              10.horizontalSpace,

              SizedBox(
              width: MediaQuery.of(context).size.width * 0.6, // Adjust the width here
              child:
              Slider(
                value: _currentSliderValue,
                min: 0,
                max: 100,
                divisions: 5, 
                activeColor: ColorConstants.activeOrange, // Color of the active portion
                inactiveColor: ColorConstants.sliderGrey, // Color of the inactive portion
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                    switch (value/20.round()){
                      case 1: {
                                currentTextStyle = currentTextStyle.copyWith(
                                  fontSize: currentTextStyle.fontFamily!.contains('BeVietnam') ? 14.sp : 18.sp, 
                                );
                                break;
                              }
                      case 2: {
                                currentTextStyle = currentTextStyle.copyWith(
                                          fontSize: currentTextStyle.fontFamily!.contains('BeVietnam') ? 16.sp : 20.sp, 
                                        );
                                        break;
                              }
                      case 3: {
                                currentTextStyle = currentTextStyle.copyWith(
                                          fontSize: currentTextStyle.fontFamily!.contains('BeVietnam') ? 18.sp : 22.sp, 
                                        );
                                        break;
                              }
                      case 4: {
                                currentTextStyle = currentTextStyle.copyWith(
                                          fontSize: currentTextStyle.fontFamily!.contains('BeVietnam') ? 20.sp : 24.sp, 
                                        );
                                        break;
                              }
                      case 5: {
                                currentTextStyle = currentTextStyle.copyWith(
                                          fontSize: currentTextStyle.fontFamily!.contains('BeVietnam') ? 22.sp : 26.sp, 
                                        );
                                        break;
                              }
                      default: break;
                                
                    }
                  });
                },
              ),),

              10.horizontalSpace,
              Text(Strings.aA, style: FontConstant.bigTextDisplayLabel,),
            ],),
        
            //TEXT FONT PICKER
            Padding(padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                  ElevatedButton(
                   style: ElevatedButton.styleFrom(
                    backgroundColor: currentTextStyle.fontFamily!.contains('BeVietnamPro') ? ColorConstants.activeOrange : ColorConstants.primaryText,
                    padding: EdgeInsets.all(10.sp), // Remove padding
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: const CircleBorder(),
                  ),
                  onPressed: (){
                    setState(() {
                      currentTextStyle = FontConstant.beVNProRead.copyWith(
                        color: currentTextStyle.color,
                        fontSize: currentTextStyle.fontSize,
                      );
                    });
                  }, 
                child:
                    Text(Strings.aA, style: currentTextStyle.fontFamily!.contains('BeVietnamPro') ? FontConstant.beVNProLabel : FontConstant.beVNProLabel.copyWith(color:ColorConstants.darkText),)),
                    5.verticalSpace,
                    Text(Strings.beVietnamPro, style: FontConstant.beVNProRead.copyWith(color: ColorConstants.black),)
                  ],),
                

                15.horizontalSpace,
                 Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: currentTextStyle.fontFamily!.contains('CrimsonPro') ? ColorConstants.activeOrange : ColorConstants.primaryText,
                        padding: EdgeInsets.all(10.sp), // Remove padding
                        minimumSize: Size.zero,   // Remove minimum size constraints
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: const CircleBorder(),
                      ),
                      onPressed: (){
                        setState(() {
                          currentTextStyle = FontConstant.crimsonProRead.copyWith(
                            color: currentTextStyle.color,
                            fontSize: currentTextStyle.fontSize,
                          );
                        });  
                      }, 
                    child:
                        Text(Strings.aA, style: currentTextStyle.fontFamily!.contains('CrimsonPro') ? FontConstant.crimsonProLabel: FontConstant.crimsonProLabel.copyWith(color: ColorConstants.darkText),)
                        ),
                    5.verticalSpace,
                    Text(Strings.crimsonPro, style: FontConstant.crimsonProRead.copyWith(color: ColorConstants.black),)
                  ],),
              

                15.horizontalSpace,
                Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: currentTextStyle.fontFamily!.contains('Farsan') ? ColorConstants.activeOrange : ColorConstants.primaryText,
                        padding: EdgeInsets.all(10.sp), // Remove padding
                        minimumSize: Size.zero,   // Remove minimum size constraints
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: const CircleBorder(),
                      ),
                      onPressed: (){
                        setState(() {
                          currentTextStyle = FontConstant.farsanRead.copyWith(
                            color: currentTextStyle.color,
                            fontSize: currentTextStyle.fontSize,
                          );
                        });  
                      }, 
                    child:
                    Text(Strings.aA, style: currentTextStyle.fontFamily!.contains('Farsan') ? FontConstant.farsanLabel : FontConstant.farsanLabel.copyWith(color: ColorConstants.darkText),)
                    ),
                    5.verticalSpace,
                    Text(Strings.farsan, style: FontConstant.farsanRead.copyWith(color: ColorConstants.black),)
                  ],),
              ]),
            ),
            
            20.verticalSpace,
            //BACKGROUND COLOR PICKER
            Row(
              children: [
                //white
                ElevatedButton(
                   style: ElevatedButton.styleFrom(
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: const CircleBorder(),
                  ),
                  onPressed: (){
                    setState(() {
                      currentTextStyle = currentTextStyle.copyWith(color: ColorConstants.darkText);
                      backgroundColor = ColorConstants.bgWhite;
                    });
                  }, 
                child: Container(
                  width: 50.sp,
                  height: 50.sp,
                  decoration: BoxDecoration(
                    color: ColorConstants.bgWhite,
                    border: Border.all(
                      width: backgroundColor == ColorConstants.bgWhite ? 3.sp : 0,
                      color: ColorConstants.activeOrange,
                    ),
                    borderRadius: BorderRadius.circular(32.sp),
                  ),
                )),
                10.horizontalSpace,
                
                //dark green
                ElevatedButton(
                   style: ElevatedButton.styleFrom(
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: const CircleBorder(),
                  ),
                  onPressed: (){
                    setState(() {
                      currentTextStyle = currentTextStyle.copyWith(color: ColorConstants.primaryText);
                      backgroundColor = ColorConstants.darkGreenBackground;
                    });
                  }, 
                child: Container(
                  width: 50.sp,
                  height: 50.sp,
                  decoration: BoxDecoration(
                    color: ColorConstants.darkGreenBackground,
                    border: Border.all(
                      width: backgroundColor == ColorConstants.darkGreenBackground ? 3.sp : 0,
                      color: ColorConstants.activeOrange,
                    ),
                    borderRadius: BorderRadius.circular(32.sp)
                  ),
                  
                )),
              
                //old paper
                ElevatedButton(
                   style: ElevatedButton.styleFrom(
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: const CircleBorder(),
                  ),
                  onPressed: (){
                    setState(() {
                      currentTextStyle = currentTextStyle.copyWith(color: ColorConstants.darkText);
                      backgroundColor = ColorConstants.bgLightYellowPaper;
                    });
                  }, 
                child: Container(
                  width: 50.sp,
                  height: 50.sp,
                  decoration: BoxDecoration(
                    color: ColorConstants.bgLightYellowPaper,
                    border: Border.all(
                      width: backgroundColor == ColorConstants.bgLightYellowPaper ? 3.sp : 0,
                      color: ColorConstants.activeOrange,
                    ),
                    borderRadius: BorderRadius.circular(32.sp)
                  ),
                )),
              
                //pink
                ElevatedButton(
                   style: ElevatedButton.styleFrom(
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: const CircleBorder(),
                  ),
                  onPressed: (){
                    setState(() {
                      currentTextStyle = currentTextStyle.copyWith(color: ColorConstants.darkText);
                      backgroundColor = ColorConstants.bgPink;
                    });
                  }, 
                child: Container(
                  width: 50.sp,
                  height: 50.sp,
                  decoration: BoxDecoration(
                    color: ColorConstants.bgPink,
                    border: Border.all(
                      width: backgroundColor == ColorConstants.bgPink ? 3.sp : 0,
                      color: ColorConstants.activeOrange,
                    ),
                    borderRadius: BorderRadius.circular(32.sp),
                  ),
                )),
              ],
            )
             
        ],),

      ),

    );
  }

  Widget buildChapterListDrawer(){
    return Align(
      alignment: Alignment.bottomRight,
      child: ChapterListDrawerSection(storyId: chapter.fkStoryId ?? -1, chapterId: chapter.chapterId ?? -1, storyName: widget.storyName,));
  }
}
