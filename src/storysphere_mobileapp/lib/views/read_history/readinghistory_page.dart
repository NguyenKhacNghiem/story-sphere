import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/reading_history.dart';
import 'package:storysphere_mobileapp/services/reading_history_service.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';
import 'package:storysphere_mobileapp/views/read_history/widgets/readhist_itemwidget.dart';

@RoutePage()
class ReadingHistoryPage extends StatefulWidget {
  final int userId;
  const ReadingHistoryPage({super.key, required this.userId});

  @override
  State<ReadingHistoryPage> createState() => _ChapterListPage();
}

class _ChapterListPage extends State<ReadingHistoryPage> {
  List<ReadingHistory> readingHistoryList = [];
  int currentPage = 1;
  int totalPages = 1;
  bool noHistory = false;

  @override
  Widget build(BuildContext context) {
    initData();

    return Scaffold(
      bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 1),
      body:  SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
          controller: ScrollController(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              40.verticalSpace,
              Text(Strings.readHistory, style: FontConstant.titleBigDisplayWhite,),

            readingHistoryList.isEmpty
            ? noHistory ? 0.verticalSpace : const CircularProgressIndicator()
            :  ListView.builder(
                scrollDirection: Axis.vertical,
                controller: ScrollController(),
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: readingHistoryList.length,
                itemBuilder: (context, index) {
                  return Padding(padding: EdgeInsets.symmetric(vertical: 10.sp),
                  child: 
                    HistoryItemWidget(readingHistory: readingHistoryList.elementAt(index))); 
                }),
              
            ],
          )
        ),
      );
   }

  initData(){
    //get data
    if (readingHistoryList.isEmpty) {
      final result =  ReadingHistoryService().getHistoryByUserId(widget.userId, currentPage);
      result.whenComplete(() {
        result.then((value) {
          if (value != null) {
            setState(() {
              readingHistoryList = value.result;
              currentPage = value.currentPage;
              totalPages = value.totalPages;
            });
          } else {
            noHistory = true;
          }
        });
      });
    }

  }
}
