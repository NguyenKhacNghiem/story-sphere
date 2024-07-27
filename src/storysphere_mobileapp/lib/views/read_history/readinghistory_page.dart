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

              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageButtons(),
              ),
              
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
