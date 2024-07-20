import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';
import 'package:storysphere_mobileapp/views/storydetail/widgets/chapterlistitem_widget.dart';

@RoutePage()
class ChapterListPage extends StatefulWidget {
  final List<Chapter> chapters;
  final Story story;
  const ChapterListPage({super.key, required this.chapters, required this.story});

  @override
  State<ChapterListPage> createState() => _ChapterListPage();
}

class _ChapterListPage extends State<ChapterListPage> {
  late List<Chapter> chapterList;
  late Widget fromStory;

  @override
  Widget build(BuildContext context) {
    initData();
    double screenWidth = MediaQuery.of(context).size.width;
    double screnHeight = MediaQuery.of(context).size.height;

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
                      image: NetworkImage(widget.story.storyCover!),
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
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    40.verticalSpace,
                    Text(Strings.chapterListDisplay, style: FontConstant.titleBigDisplayWhite,),
                    2.verticalSpace,
                    fromStory,

                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      controller: ScrollController(),
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: chapterList.length,
                      itemBuilder: (context, index) {
                        return 
                        InkWell(
                          onTap: (){
                            context.pushRoute(ChapterPage(chapter: chapterList.elementAt(index), storyName: widget.story.storyName ?? ''));
                          },
                          child: ChapterListItemWidget(chapter: chapterList.elementAt(index)),

                        );

                          ;
                      }),
                    
                  ],
                )
              ),
            ),
          ],
        ),
      );
      
      
      
      
    
   }

  initData(){
      chapterList = widget.chapters;
      fromStory = Center(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${Strings.fromStory} ',
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
