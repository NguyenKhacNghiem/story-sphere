import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/story.dart';
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
            
            GridView.builder(
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
}
