import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/category.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';
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
  List<Story> displayStoryList = [
    Story(
      storyId: 0,
      storyName: 'Vi Sinh Vật Vi Tính',
      storyCover: 'https://drive.google.com/uc?export=view&id=1jLZbGHPzOEz-E9To-i8xj4_V-fHeKiM6',
      bookAuthorName: 'Jue Hur',
      ratingPoint: 5.0,
      commentCount: 2,
      viewCount: 200,
      voteCount: 94,
      storyContentOutline: 'Blockchain là chủ đề đang vô cùng nóng trên toàn cầu hiện nay. Nó cùng với Bitcoin và tiền kỹ thuật số trở thành đề tài bàn luận trên rất nhiều mặt báo và trong những cuộc trò chuyện của mọi người. Tuy nhiên, khi nói về blockchain vẫn còn nhiều tranh cãi. Có người lo lắng rằng Bitcoin có thể chỉ là bong bóng, nhiều người cho rằng công nghệ phía sau nó là một sự đột phá, và công nghệ ấy sẽ tiếp tục con đường của mình cho đến khi được chấp nhận và tích hợp với Internet.Thậm chí, Jamie Dimon, CEO của JP Morgan, người đã gay gắt phản đối Bitcoin và gây ra nhiều lo lắng cho cộng đồng tiền kỹ thuật số cũng đã đồng ý rằng, công nghệ DLT (công nghệ sổ cái phân tán – distributed ledger technology) có tiềm năng rất lớn để thay đổi ngành tài chính và các ngành khác. Hơn nữa, JP Morgan cùng với nhiều ngân hàng đã tiến hành kiểm tra blockchain cho những trường hợp sử dụng khác nhau trong thực tế.Vậy thì Blockchain thực chất là gì? Nó có thể ứng dụng vào những lĩnh vực nào trong cuộc sống và tại sao nó lại được quan tâm như vậy?'),
    Story(
      storyId: 0,
      storyName: 'Teen truyen sieu dai de test UI',
      storyCover: 'https://drive.google.com/uc?export=view&id=1jLZbGHPzOEz-E9To-i8xj4_V-fHeKiM6',
      bookAuthorName: 'Jue Hur',
      ratingPoint: 5.0,
      commentCount: 2,
      viewCount: 200,
      voteCount: 94,
      storyContentOutline: 'Blockchain là chủ đề đang vô cùng nóng trên toàn cầu hiện nay. Nó cùng với Bitcoin và tiền kỹ thuật số trở thành đề tài bàn luận trên rất nhiều mặt báo và trong những cuộc trò chuyện của mọi người. Tuy nhiên, khi nói về blockchain vẫn còn nhiều tranh cãi. Có người lo lắng rằng Bitcoin có thể chỉ là bong bóng, nhiều người cho rằng công nghệ phía sau nó là một sự đột phá, và công nghệ ấy sẽ tiếp tục con đường của mình cho đến khi được chấp nhận và tích hợp với Internet.Thậm chí, Jamie Dimon, CEO của JP Morgan, người đã gay gắt phản đối Bitcoin và gây ra nhiều lo lắng cho cộng đồng tiền kỹ thuật số cũng đã đồng ý rằng, công nghệ DLT (công nghệ sổ cái phân tán – distributed ledger technology) có tiềm năng rất lớn để thay đổi ngành tài chính và các ngành khác. Hơn nữa, JP Morgan cùng với nhiều ngân hàng đã tiến hành kiểm tra blockchain cho những trường hợp sử dụng khác nhau trong thực tế.Vậy thì Blockchain thực chất là gì? Nó có thể ứng dụng vào những lĩnh vực nào trong cuộc sống và tại sao nó lại được quan tâm như vậy?'),
    Story(
      storyId: 0,
      storyName: 'Lightfall',
      storyCover: 'https://drive.google.com/uc?export=view&id=1jLZbGHPzOEz-E9To-i8xj4_V-fHeKiM6',
      bookAuthorName: 'Jue Hur',
      ratingPoint: 5.0,
      commentCount: 2,
      viewCount: 200,
      voteCount: 94,
      storyContentOutline: 'Blockchain là chủ đề đang vô cùng nóng trên toàn cầu hiện nay. Nó cùng với Bitcoin và tiền kỹ thuật số trở thành đề tài bàn luận trên rất nhiều mặt báo và trong những cuộc trò chuyện của mọi người. Tuy nhiên, khi nói về blockchain vẫn còn nhiều tranh cãi. Có người lo lắng rằng Bitcoin có thể chỉ là bong bóng, nhiều người cho rằng công nghệ phía sau nó là một sự đột phá, và công nghệ ấy sẽ tiếp tục con đường của mình cho đến khi được chấp nhận và tích hợp với Internet.Thậm chí, Jamie Dimon, CEO của JP Morgan, người đã gay gắt phản đối Bitcoin và gây ra nhiều lo lắng cho cộng đồng tiền kỹ thuật số cũng đã đồng ý rằng, công nghệ DLT (công nghệ sổ cái phân tán – distributed ledger technology) có tiềm năng rất lớn để thay đổi ngành tài chính và các ngành khác. Hơn nữa, JP Morgan cùng với nhiều ngân hàng đã tiến hành kiểm tra blockchain cho những trường hợp sử dụng khác nhau trong thực tế.Vậy thì Blockchain thực chất là gì? Nó có thể ứng dụng vào những lĩnh vực nào trong cuộc sống và tại sao nó lại được quan tâm như vậy?'),
    Story(
      storyId: 0,
      storyName: 'Vi Sinh Vật Vi Tính',
      storyCover: 'https://drive.google.com/uc?export=view&id=1jLZbGHPzOEz-E9To-i8xj4_V-fHeKiM6',
      bookAuthorName: 'Jue Hur',
      ratingPoint: 5.0,
      commentCount: 2,
      viewCount: 200,
      voteCount: 94,
      storyContentOutline: 'Blockchain là chủ đề đang vô cùng nóng trên toàn cầu hiện nay. Nó cùng với Bitcoin và tiền kỹ thuật số trở thành đề tài bàn luận trên rất nhiều mặt báo và trong những cuộc trò chuyện của mọi người. Tuy nhiên, khi nói về blockchain vẫn còn nhiều tranh cãi. Có người lo lắng rằng Bitcoin có thể chỉ là bong bóng, nhiều người cho rằng công nghệ phía sau nó là một sự đột phá, và công nghệ ấy sẽ tiếp tục con đường của mình cho đến khi được chấp nhận và tích hợp với Internet.Thậm chí, Jamie Dimon, CEO của JP Morgan, người đã gay gắt phản đối Bitcoin và gây ra nhiều lo lắng cho cộng đồng tiền kỹ thuật số cũng đã đồng ý rằng, công nghệ DLT (công nghệ sổ cái phân tán – distributed ledger technology) có tiềm năng rất lớn để thay đổi ngành tài chính và các ngành khác. Hơn nữa, JP Morgan cùng với nhiều ngân hàng đã tiến hành kiểm tra blockchain cho những trường hợp sử dụng khác nhau trong thực tế.Vậy thì Blockchain thực chất là gì? Nó có thể ứng dụng vào những lĩnh vực nào trong cuộc sống và tại sao nó lại được quan tâm như vậy?'),
  
  ];


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
             ListView.builder(
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
                    onPressed: () {},
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
    // Code ở đây sẽ chỉ chạy một lần khi state được khởi tạo
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
   
}
