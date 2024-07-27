import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';
import 'package:storysphere_mobileapp/models/reading_history.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';

class HistoryItemWidget extends StatefulWidget {
  final ReadingHistory readingHistory;
   const HistoryItemWidget({super.key, required this.readingHistory});

  @override
  State<HistoryItemWidget> createState() => _HistoryItemWidget();
}

class _HistoryItemWidget extends State<HistoryItemWidget> {
  late Chapter chapter;
  late Story story;
  late ReadingHistory readingHistory;
  String dateString = 'D';

  @override
  Widget build(BuildContext context) {
    readingHistory = widget.readingHistory;
    double itemWidth = (MediaQuery.of(context).size.width - 150.sp).sp;
    initData();

    return InkWell(
      onTap: () {
        context.pushRoute(StoryDetailPage(story: story));},
      child: 
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorConstants.formStrokeColor),
          borderRadius: BorderRadius.circular(5.sp),
        ),
        child: 
    Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      child:
         Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            20.horizontalSpace,

            SizedBox(
            width: 50.sp,
            height: 75.sp,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.sp),
              child: Image.network(story.storyCover ?? Strings.defaultCover, fit: BoxFit.cover,))),
            
            20.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //story name
                SizedBox(
                  width: itemWidth,
                  child: Text(
                    story.storyName ?? '', 
                    style: FontConstant.buttonTextWhite,
                    overflow: TextOverflow.clip,
                    softWrap: true,),
                ),
                10.verticalSpace,

                Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Strings.lastVisited, style: FontConstant.historyLabel,),
                    10.horizontalSpace,
                    Text(dateString, style: FontConstant.hisStoryData,),
                  ],
                ),
                5.verticalSpace,
                Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Strings.lastReadChapter, style: FontConstant.historyLabel,),
                    10.horizontalSpace,
                    Text(chapter.chapterName ?? '', style: FontConstant.hisStoryData,),
                  ],
                ),

                10.verticalSpace,
                Center(
                  child: Text(Strings.continuteToRead, style: FontConstant.purpleText,),
                )

            ]),
        ],)
    )));
   
  }

  void initData(){
    if (readingHistory.lastVisited != null) {
       dateString = "${readingHistory.lastVisited!.hour}:${readingHistory.lastVisited!.minute} ${readingHistory.lastVisited!.day}/${readingHistory.lastVisited!.month}/${readingHistory.lastVisited!.year}";
    }

   story =   Story(
      storyId: 0,
      storyName: 'Vi Sinh Vật Vi Tính',
      storyCover: 'https://drive.google.com/uc?export=view&id=1jLZbGHPzOEz-E9To-i8xj4_V-fHeKiM6',
      bookAuthorName: 'Jue Hur',
      ratingPoint: 5.0,
      commentCount: 2,
      viewCount: 200,
      voteCount: 94,
      storyContentOutline: 'Blockchain là chủ đề đang vô cùng nóng trên toàn cầu hiện nay. Nó cùng với Bitcoin và tiền kỹ thuật số trở thành đề tài bàn luận trên rất nhiều mặt báo và trong những cuộc trò chuyện của mọi người. Tuy nhiên, khi nói về blockchain vẫn còn nhiều tranh cãi. Có người lo lắng rằng Bitcoin có thể chỉ là bong bóng, nhiều người cho rằng công nghệ phía sau nó là một sự đột phá, và công nghệ ấy sẽ tiếp tục con đường của mình cho đến khi được chấp nhận và tích hợp với Internet.Thậm chí, Jamie Dimon, CEO của JP Morgan, người đã gay gắt phản đối Bitcoin và gây ra nhiều lo lắng cho cộng đồng tiền kỹ thuật số cũng đã đồng ý rằng, công nghệ DLT (công nghệ sổ cái phân tán – distributed ledger technology) có tiềm năng rất lớn để thay đổi ngành tài chính và các ngành khác. Hơn nữa, JP Morgan cùng với nhiều ngân hàng đã tiến hành kiểm tra blockchain cho những trường hợp sử dụng khác nhau trong thực tế.Vậy thì Blockchain thực chất là gì? Nó có thể ứng dụng vào những lĩnh vực nào trong cuộc sống và tại sao nó lại được quan tâm như vậy?');

    chapter =  Chapter(chapterId: 1, chapterName: 'Cuộc gọi bí ẩn', chapterOrder: 1, chapterStatus: 1, viewCount: 1203, voteCount: 241, commentCount: 17, createdDate: DateTime(2023, 12, 20, 15, 30), fkStoryId: 1,
            chapterContent: 'Trong căn phòng nhỏ, ánh đèn bàn mờ nhạt chiếu xuống những trang sách cũ kỹ. Minh Anh ngồi bên cửa lặng lẽ ngắm nhìn những chiếc lá rơi ngoài sân. Đêm nay, như mọi đêm khác, cô cảm thấy một nỗi buồn vô định xâm chiếm lòng mình. Bỗng, tiếng chuông điện thoại vang lên phá tan bầu không khí tĩnh mịch.');


  }
  
}
