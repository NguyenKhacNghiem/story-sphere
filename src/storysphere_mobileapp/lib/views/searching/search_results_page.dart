import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/pagination_result.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';
import 'package:storysphere_mobileapp/services/searching_service.dart';
import 'package:storysphere_mobileapp/views/searching/widgets/bookresult_section.dart';
import 'package:storysphere_mobileapp/views/searching/widgets/searchingbar_widget.dart';
import 'package:storysphere_mobileapp/views/widgets/notfound_widget.dart';

@RoutePage()
class SearchingResultsPage extends StatefulWidget {
  final String data;
  const SearchingResultsPage({super.key, required this.data});

  @override
  State<SearchingResultsPage> createState() => _SearchingResultsPage();
}

class _SearchingResultsPage extends State<SearchingResultsPage> {
  String searchingData = '';
  late Widget filterList;
  int selectedFilter = 0;
  List<Story> displayStoryList = [];
  int currentPage = 1;
  int totalPages = 1;
  bool notFound = false;


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 1),
      body: SingleChildScrollView(
        child: 
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: 
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            40.verticalSpace,
            Text(Strings.searchResults, style: FontConstant.headline2Light,),
            2.verticalSpace,
            Text('"$searchingData"', style: FontConstant.resultTitleDisplay,),
            
            //SEARCHING BAR
            5.verticalSpace,
            SearchingBarWidget(),

            //FILTER BUTTON LIST
            10.verticalSpace,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:  filterList,),

            //RESULT LIST
            displayStoryList.isEmpty
            ? notFound 
              ? const NotFoundWidget()
              : const CircularProgressIndicator()
            : ListView.builder(
                scrollDirection: Axis.vertical,
                controller: ScrollController(),
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: displayStoryList.length,
                itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.transparent,
                    shadowColor: ColorConstants.transparent,
                    padding: EdgeInsets.zero, // Remove padding
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink wrap the button
                  ),
                    onPressed: () {
                      context.pushRoute(StoryDetailPage(story: displayStoryList.elementAt(index)));
                    },
                    child: BookResultSectionWidget(story: displayStoryList.elementAt(index)),
                  ),
                );
              },
            ),
          ])
        )),
    );
   }

  
  void initData() {
    // GET DATA
     if (displayStoryList.isEmpty && !notFound) {
      final result =  SearchingService().searchStories(widget.data, currentPage);
      result.whenComplete(() {
        result.then((value) {
          if (value != null && value is PaginationResult<Story> ) {
            setState(() {
              displayStoryList = value.result;
              currentPage = value.currentPage;
              totalPages = value.totalPages;
            });
          } 
           else {
            //content not found
            notFound = true;
          }
        });
      });
    }

    //DEFINE WIDGETS
    searchingData = widget.data;
    filterList = Row( 
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children:[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstants.darkGreenBackground,
            shadowColor: ColorConstants.transparent,
            padding: EdgeInsets.zero, // Remove padding
            minimumSize: Size.zero,   // Remove minimum size constraints
            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink wrap the button
          ),
        onPressed:  () {}, 
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorConstants.lightText,
              width: selectedFilter == 0 ? 0.sp : 1.sp,
            ),
            color: selectedFilter == 0 ? ColorConstants.buttonPastelGreen : ColorConstants.transparent,
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
            child: Wrap(
                direction: Axis.horizontal,
                children: [
                IconsSVG.arrowSort,
                5.horizontalSpace,
                Text(Strings.fitestResult, style: FontConstant.dropdownText,)
              ])),
        )
        ),

        10.horizontalSpace,
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstants.darkGreenBackground,
            shadowColor: ColorConstants.transparent,
            padding: EdgeInsets.zero, // Remove padding
            minimumSize: Size.zero,   // Remove minimum size constraints
            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink wrap the button
          ),
        onPressed:  () {}, 
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorConstants.lightText,
              width: selectedFilter == 1 ? 0.sp : 1.sp,
            ),
            color: selectedFilter == 1 ? ColorConstants.buttonPastelGreen : ColorConstants.transparent,
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
            child: Wrap(
                direction: Axis.horizontal,
                children: [
                IconsSVG.arrowSort,
                5.horizontalSpace,
                Text(Strings.newestResult, style: FontConstant.dropdownText,)
              ])),
        )
        ),

        10.horizontalSpace,
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstants.darkGreenBackground,
            shadowColor: ColorConstants.transparent,
            padding: EdgeInsets.zero, // Remove padding
            minimumSize: Size.zero,   // Remove minimum size constraints
            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink wrap the button
          ),
        onPressed:  () {}, 
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorConstants.lightText,
              width:  selectedFilter == 2 ? 0.sp : 1.sp,
            ),
            color: selectedFilter == 2 ? ColorConstants.buttonPastelGreen : ColorConstants.transparent,
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
            child: Wrap(
                direction: Axis.horizontal,
                children: [
                IconsSVG.arrowSort,
                5.horizontalSpace,
                Text(Strings.newestResult, style: FontConstant.dropdownText,)
              ])),
      )),
   
   
    ]);
  }
   
}
