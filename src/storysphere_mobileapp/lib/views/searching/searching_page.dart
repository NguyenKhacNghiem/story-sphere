import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/category.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/services/category_service.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';
import 'package:storysphere_mobileapp/views/searching/widgets/searchingbar_widget.dart';

@RoutePage()
class SearchingPage extends StatefulWidget {
  const SearchingPage({super.key});

  @override
  State<SearchingPage> createState() => _SearchingPage();
}

class _SearchingPage extends State<SearchingPage> {
  String? selectedItem;
  String? selectedBookItem;
  bool isNovelExpanded = false;
  bool isBookExpanded = false;
  List<Category> categories = [];

  Category sampleCategory = Category(
    categoryId: 100000, categoryName: 'Khoa học kỹ thuật', categoryUrl: false,
    categoryDescription: 'Những câu chuyện giúp bạn không bao giờ cô đơn vì luôn cảm thấy bên cạnh mình luôn có người',
    isCategory: true
  );

  List<Category> dropdownNovelCategories = [];
  //   'Bí ẩn','Kinh dị', 'Khoan học viễn tưởng', 'Lãng mạn', 'Cổ tích', 'Truyện thiếu nhi','Viễn tưởng'
  // ];

  List<Category> dropdownBookCategories = [];
  //   'Sách tâm lý', 'Sách kỹ năng', 'Sách y học', 'Sách lịch sử', 'Sách tài chính', 'Sách khoa học công nghệ', 'Sách tôn giáo - tâm linh'
  // ];

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
            SearchingBarWidget(),

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
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            child: isNovelExpanded
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.sp),
                    padding: EdgeInsets.only(top: 8.sp),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.transparent),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: dropdownNovelCategories.map((Category item) {
                        return InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            context.pushRoute(FilterByCategoryPage(category: sampleCategory));
                            setState(() {
                              isNovelExpanded = false;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
                            child: Text(item.categoryName ?? ''),
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
            duration: const Duration(milliseconds: 400),
            child: isBookExpanded
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.sp),
                    padding: EdgeInsets.only(top: 8.sp),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.transparent),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: dropdownBookCategories.map((Category item) {
                        return InkWell(
                          onTap: () {
                              Navigator.pop(context);
                              context.pushRoute(FilterByCategoryPage(category: sampleCategory));
                            setState(() {
                              isBookExpanded = false;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
                            child: Text(item.categoryName?? ''),
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

   void initData() {
    // GET DATA
     if (categories.isEmpty) {
      final result =  CategoryService().getAllCategory();
      result.whenComplete(() {
        result.then((value) {
          if (value != null) {
            setState(() {
              categories = value;
              //WIDGET PREPARE
              dropdownNovelCategories = categories.where((category) => 
                  category.categoryUrl== true && category.isCategory == true).toList();

              dropdownBookCategories = categories.where((category) => 
                  category.categoryUrl == false && category.isCategory == true).toList();
            });
          }
        });
      });
    }
  }
}
