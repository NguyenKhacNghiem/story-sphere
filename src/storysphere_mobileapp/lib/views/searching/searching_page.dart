import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';

@RoutePage()
class SearchingPage extends StatefulWidget {
  const SearchingPage({super.key});

  @override
  State<SearchingPage> createState() => _SearchingPage();
}

class _SearchingPage extends State<SearchingPage> {
  TextEditingController _searchController = TextEditingController();
  String? selectedItem;
  String? selectedBookItem;
  bool isNovelExpanded = false;
  bool isBookExpanded = false;

  final List<String> dropdownNovelCategories = [
    'Bí ẩn','Kinh dị', 'Khoan học viễn tưởng', 'Lãng mạn', 'Cổ tích', 'Truyện thiếu nhi','Viễn tưởng'
  ];

  final List<String> dropdownBookCategories = [
    'Sách tâm lý', 'Sách kỹ năng', 'Sách y học', 'Sách lịch sử', 'Sách tài chính', 'Sách khoa học công nghệ', 'Sách tôn giáo - tâm linh'
  ];

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: 
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            40.verticalSpace,
            Text(Strings.findSomething, style: FontConstant.titleBigDisplayWhite,),
            
            //SEARCHING BAR
            5.verticalSpace,
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorConstants.buttonPastelGreen,
                  width: 1.sp,),
                borderRadius: BorderRadius.circular(5.sp),
              ),
            child: Row(
                children: [
                    10.horizontalSpace,
                    IconsSVG.searchingBarIcon,
                    10.horizontalSpace,
                    Container(
                      width: 1,
                      height: 23,
                      color: ColorConstants.buttonPastelGreen,
                    ),
                      Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(5.sp),
                        child: TextField(
                        controller: _searchController,
                        style:  FontConstant.searchingText,
                        decoration: const InputDecoration(
                          hintText: Strings.hintSearching,
                          fillColor: ColorConstants.transparent,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintStyle: TextStyle(color: ColorConstants.buttonPastelGreen),
                        ),
                        onChanged: (value) {
                          // Add your search logic here
                        },
                      ),
                    ),)
              ])),
            
            //DROP DOWN CATEGOR ITEMS
            25.verticalSpace,
            Text(Strings.categoryExplore, style: FontConstant.headline2White,),

            10.verticalSpace,
            //Text(Strings.novelCategories, style: FontConstant.dropdownText.copyWith(fontWeight: FontWeight.bold),),
            5.verticalSpace,
            GestureDetector(
            onTap: () {
              setState(() {
                isNovelExpanded = ! isNovelExpanded;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 5.sp),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: ColorConstants.lightText)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    selectedItem ?? Strings.novelCategories,
                    style: FontConstant.dropdownText.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    isNovelExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: ColorConstants.buttonPastelGreen,
                  ),
                ],
              ),
            ),
          ),
           AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.linearToEaseOut,
            child: isNovelExpanded
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.sp),
                    padding: EdgeInsets.only(top: 8.sp),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.transparent),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: dropdownNovelCategories.map((String item) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedItem = item;
                              isNovelExpanded = false;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
                            child: Text(item),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                : 0.verticalSpace,
          ),
            
          25.verticalSpace,
          GestureDetector(
            onTap: () {
              setState(() {
                isBookExpanded = ! isBookExpanded;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 5.sp),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: ColorConstants.lightText)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    selectedBookItem ?? Strings.bookCategories,
                    style: FontConstant.dropdownText.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    isBookExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: ColorConstants.buttonPastelGreen,
                  ),
                ],
              ),
            ),
          ),
           AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: isBookExpanded
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.sp),
                    padding: EdgeInsets.only(top: 8.sp),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.transparent),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: dropdownBookCategories.map((String item) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedBookItem = item;
                              isBookExpanded = false;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
                            child: Text(item),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                : 0.verticalSpace,
          ),
          

          ],
        )
      )),
    );
   }
}
