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
  //   Story(
  //     storyId: 0,
  //     storyName: 'Vi Sinh Vật Vi Tính',
  //     storyCover: 'https://drive.google.com/uc?export=view&id=1jLZbGHPzOEz-E9To-i8xj4_V-fHeKiM6',
  //     bookAuthorName: 'Jue Hur',
  //     ratingPoint: 5.0,
  //     commentCount: 2,
  //     viewCount: 200,
  //     voteCount: 94,
  //     storyContentOutline: 'Blockchain là chủ đề đang vô cùng nóng trên toàn cầu hiện nay. Nó cùng với Bitcoin và tiền kỹ thuật số trở thành đề tài bàn luận trên rất nhiều mặt báo và trong những cuộc trò chuyện của mọi người. Tuy nhiên, khi nói về blockchain vẫn còn nhiều tranh cãi. Có người lo lắng rằng Bitcoin có thể chỉ là bong bóng, nhiều người cho rằng công nghệ phía sau nó là một sự đột phá, và công nghệ ấy sẽ tiếp tục con đường của mình cho đến khi được chấp nhận và tích hợp với Internet.Thậm chí, Jamie Dimon, CEO của JP Morgan, người đã gay gắt phản đối Bitcoin và gây ra nhiều lo lắng cho cộng đồng tiền kỹ thuật số cũng đã đồng ý rằng, công nghệ DLT (công nghệ sổ cái phân tán – distributed ledger technology) có tiềm năng rất lớn để thay đổi ngành tài chính và các ngành khác. Hơn nữa, JP Morgan cùng với nhiều ngân hàng đã tiến hành kiểm tra blockchain cho những trường hợp sử dụng khác nhau trong thực tế.Vậy thì Blockchain thực chất là gì? Nó có thể ứng dụng vào những lĩnh vực nào trong cuộc sống và tại sao nó lại được quan tâm như vậy?'),
  //   Story(
  //     storyId: 0,
  //     storyName: 'Teen truyen sieu dai de test UI',
  //     storyCover: 'https://drive.google.com/uc?export=view&id=1jLZbGHPzOEz-E9To-i8xj4_V-fHeKiM6',
  //     bookAuthorName: 'Jue Hur',
  //     ratingPoint: 5.0,
  //     commentCount: 2,
  //     viewCount: 200,
  //     voteCount: 94,
  //     storyContentOutline: 'Blockchain là chủ đề đang vô cùng nóng trên toàn cầu hiện nay. Nó cùng với Bitcoin và tiền kỹ thuật số trở thành đề tài bàn luận trên rất nhiều mặt báo và trong những cuộc trò chuyện của mọi người. Tuy nhiên, khi nói về blockchain vẫn còn nhiều tranh cãi. Có người lo lắng rằng Bitcoin có thể chỉ là bong bóng, nhiều người cho rằng công nghệ phía sau nó là một sự đột phá, và công nghệ ấy sẽ tiếp tục con đường của mình cho đến khi được chấp nhận và tích hợp với Internet.Thậm chí, Jamie Dimon, CEO của JP Morgan, người đã gay gắt phản đối Bitcoin và gây ra nhiều lo lắng cho cộng đồng tiền kỹ thuật số cũng đã đồng ý rằng, công nghệ DLT (công nghệ sổ cái phân tán – distributed ledger technology) có tiềm năng rất lớn để thay đổi ngành tài chính và các ngành khác. Hơn nữa, JP Morgan cùng với nhiều ngân hàng đã tiến hành kiểm tra blockchain cho những trường hợp sử dụng khác nhau trong thực tế.Vậy thì Blockchain thực chất là gì? Nó có thể ứng dụng vào những lĩnh vực nào trong cuộc sống và tại sao nó lại được quan tâm như vậy?'),
   
  // ];


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
