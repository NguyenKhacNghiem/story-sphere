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
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';
import 'package:storysphere_mobileapp/views/mywork/widgets/bookedit_section.dart';
@RoutePage()
class MyWorksPage extends StatefulWidget {
  final int userId;
  const MyWorksPage({super.key, required this.userId});

  @override
  State<MyWorksPage> createState() => _MyWorksPage();
}

class _MyWorksPage extends State<MyWorksPage> {
  late int storyId;
  List<Story> displayStoryList = [];
  int currentPage = 1;
  int totalPages = 1;
  bool notFound = false;


  @override
  Widget build(BuildContext context) {
    initData();
  
    return Scaffold(
      bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 2),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            40.verticalSpace,
            Text(Strings.myWorks, style: FontConstant.resultTitleDisplay,),
            2.verticalSpace,
            
            ListView.builder(
                scrollDirection: Axis.vertical,
                controller: ScrollController(),
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: displayStoryList.length,
                itemBuilder: (context, index) {
                return
                 Padding(
                  padding: EdgeInsets.all(8.sp), 
                  child: 
                    BookEditSectionWidget(story: displayStoryList.elementAt(index)));
            }),

            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageButtons(),),

            5.verticalSpace,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.transparent,
                        shadowColor: ColorConstants.transparent,
                        padding: EdgeInsets.all(10.sp), // Remove padding
                        minimumSize: Size.zero,   // Remove minimum size constraints
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink wrap the button
                      ),
              onPressed: () {
                context.pushRoute(AddStoryPage(userId: widget.userId));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.sp),
                  border: Border.all(
                    width: 1.sp,
                    color: ColorConstants.formStrokeColor)
                ),
                
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 15.sp),
                child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconsSVG.addBigGrey,
                    10.horizontalSpace,
                    Text(Strings.addNewStory, style: FontConstant.buttonTextGrey,)
                  ],
                )
               ,),
              )
              ),
          ],
        )
      ),)
    );
   }

   
  Future<void> initData() async {
    if (displayStoryList.isEmpty && !notFound) {
      final result =  StoryService().getStoriesByUserId(widget.userId, currentPage);
      result.whenComplete(() {
        result.then((value) {
          if (value != null ) {
            setState(() {
              displayStoryList = value.result;
              currentPage = value.currentPage;
              totalPages = value.totalPages;
            });
          } else {
            //content not found
            notFound = true;
          }
        });
      });
    }
  }

  
  List<Widget> _buildPageButtons() {
    List<Widget> buttons = [];

    // Add previous button if not on the first page
    if (currentPage > 1) {
      buttons.add(
        _buildPageButton(currentPage - 1, 'Previous'),
      );
    }

    // Add page number buttons
    for (int i = 1; i <= totalPages; i++) {
      buttons.add(
        _buildPageButton(i, i.toString()),
      );
    }

    // Add next button if not on the last page
    if (currentPage < totalPages) {
      buttons.add(
        _buildPageButton(currentPage + 1, 'Next'),
      );
    }

    return buttons;
  }

  Widget _buildPageButton(int pageNumber, String label) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            currentPage = pageNumber;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: currentPage == pageNumber ? ColorConstants.buttonPastelGreen : ColorConstants.formStrokeColor,
        ),
        child: Text(label, style: FontConstant.buttonTextWhite,),
      ),
    );
  }



}
