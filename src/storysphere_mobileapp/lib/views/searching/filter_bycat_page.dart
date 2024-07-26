import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/category.dart';
import 'package:storysphere_mobileapp/models/pagination_result.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';
import 'package:storysphere_mobileapp/views/searching/services/searching_service.dart';
import 'package:storysphere_mobileapp/views/searching/widgets/bookresult_section.dart';
import 'package:storysphere_mobileapp/views/searching/widgets/searchingbar_widget.dart';

@RoutePage()
class FilterByCategoryPage extends StatefulWidget {
  final Category category;
  const FilterByCategoryPage({super.key, required this.category});

  @override
  State<FilterByCategoryPage> createState() => _FilterByCategoryPage();
}

class _FilterByCategoryPage extends State<FilterByCategoryPage> {
  String searchingCategory = '';
  late Widget filterList;
  int selectedFilter = 0;
  List<Story> displayStoryList = [];
  int currentPage = 1;
  int totalPages = 1;

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
            45.verticalSpace,
            Text(searchingCategory, style: FontConstant.resultTitleDisplay,),
            10.verticalSpace,
            SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: 
              Text(widget.category.categoryDescription ?? '', 
                 style: FontConstant.categoryDescrip,
                 overflow: TextOverflow.clip,)),
            
            //SEARCHING BAR
            15.verticalSpace,
            SearchingBarWidget(),

            //FILTER BUTTON LIST
            10.verticalSpace,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:  filterList,),

            //RESULT LIST
            displayStoryList.isEmpty
            ? const CircularProgressIndicator()
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

            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageButtons(),
            ),
          ])
        )),
    );
   }

  
  Future<void> initData() async {
    if (displayStoryList.isEmpty) {
      final result =  SearchingService().getStoriesByCategory(widget.category.categoryId ?? -1, currentPage);
      result.whenComplete(() {
        result.then((value) {
          if (value != null && value is PaginationResult<Story> ) {
            setState(() {
              displayStoryList = value.result;
              currentPage = value.currentPage;
              totalPages = value.totalPages;
            });
          }
        });
      });
    }
    searchingCategory = widget.category.categoryName ?? '';
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
                Text(Strings.mostReadResult, style: FontConstant.dropdownText,)
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
              width:  selectedFilter == 1 ? 0.sp : 1.sp,
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
      )),
   
   
    ]);
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
          backgroundColor: currentPage == pageNumber ? Colors.blue : Colors.grey,
        ),
        child: Text(label, style: FontConstant.buttonTextWhite,),
      ),
    );
  }
}
