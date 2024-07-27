import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/favbook.dart';
import 'package:storysphere_mobileapp/models/pagination_result.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/services/favbook_service.dart';
import 'package:storysphere_mobileapp/services/story_service.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';
import 'package:storysphere_mobileapp/views/widgets/book_display_widget.dart';

@RoutePage()
class LibraryPage extends StatefulWidget {
  final int userId;
  const LibraryPage({super.key, required this.userId});

  @override
  State<LibraryPage> createState() => _LibraryPage();
}

class _LibraryPage extends State<LibraryPage> {
  late int storyId;
  int selectedFilter = 0;
  List<Story> displayStoryList = [];
  List<FavBook> favBookList = [];
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
      bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 3,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.sp),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            60.verticalSpace,
            Text(Strings.myLibrary, style: FontConstant.resultTitleDisplay,),
            2.verticalSpace,
            Text(Strings.yourLibNote, style: FontConstant.categoryDescrip,),
            
            displayStoryList.isEmpty
            ? const CircularProgressIndicator()
            : GridView.builder(
            scrollDirection: Axis.vertical,
            controller: ScrollController(),
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of items per row
              childAspectRatio: 1 / 1.8, // Width / Height ratio
            ),
            itemCount: displayStoryList.length, // Number of items
            itemBuilder: (context, index) {
                return BookDisplayWidget(
                    fromLib: true,
                    story: displayStoryList[index],
                  );

              })
      ]))),
    );
   }

   void initData() async{
     // GET DATA
     if (favBookList.isEmpty && !notFound) {
      final result =  FavBookService().getFavBookByUserId(widget.userId, currentPage);
      result.whenComplete(() {
        result.then((value) async {
          if (value != null && value is PaginationResult<FavBook>) {
            List<Future<void>> futures = [];
            List<Story> tempList = [];

            favBookList = value.result;
            for (FavBook favBook in favBookList) {
              futures.add(
                StoryService().getStoryById(favBook.storyId ?? -1).then((value1) {
                  if (value1 != null) {
                    tempList.add(value1);
                  }
                }),
              );
            }

            await Future.wait(futures);

            setState(() {
              favBookList = value.result;
              displayStoryList = tempList;});
          } else {
            //content not found
            notFound = true;
          }
        });
            });
     }
   }
}
