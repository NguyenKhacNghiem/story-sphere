import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/views/storydetail/widgets/chapterName_widget.dart';

class StoryChapterListWidget extends StatefulWidget {
  final Story story;
  const StoryChapterListWidget({super.key, required this.story});

  @override
  State<StoryChapterListWidget> createState() => _StoryChapterListWidget();
}

class _StoryChapterListWidget extends State<StoryChapterListWidget> {
  List<Chapter> chapterList = [
    Chapter(chapterId: 1, chapterName: 'Cuộc gọi bí ẩn', chapterOrder: 1, chapterStatus: 1, viewCount: 1203, voteCount: 241, commentCount: 17, createdDate: DateTime(2023, 12, 20, 15, 30),
            chapterContent: 'Trong căn phòng nhỏ, ánh đèn bàn mờ nhạt chiếu xuống những trang sách cũ kỹ. Minh Anh ngồi bên cửa lặng lẽ ngắm nhìn những chiếc lá rơi ngoài sân. Đêm nay, như mọi đêm khác, cô cảm thấy một nỗi buồn vô định xâm chiếm lòng mình. Bỗng, tiếng chuông điện thoại vang lên phá tan bầu không khí tĩnh mịch.'), 
    Chapter(chapterId: 2, chapterName: 'Cánh cửa huyền bí', chapterOrder: 2, chapterStatus: 1, viewCount: 930, voteCount: 194, commentCount: 10, createdDate: DateTime(2024, 7, 20, 15, 30),
            chapterContent: 'Trên đỉnh núi cao, mây trắng bao phủ, một ngôi đền cổ vẫn đứng vững giữa gió lạnh. Những câu chuyện lặng lẽ ngắm nhìn những chiếc lá rơi ngoài sân. Đêm nay, như mọi đêm khác, cô cảm thấy một nỗi buồn vô định xâm chiếm lòng mình. Bỗng, tiếng chuông điện thoại vang lên phá tan bầu không khí tĩnh mịch.'),   
    Chapter(chapterId: 3, chapterName: 'Hành lang cổ kính', chapterOrder: 3, chapterStatus: 1, viewCount: 902, voteCount: 180, commentCount: 9,createdDate: DateTime(2024, 7, 20, 15, 30),
            chapterContent: 'Trải dài bên trong lâu đài cổ kính, hành lang vắng lặng như giữ bí mật về quá khứ đầy bí ẩn của hoàng gia. lặng lẽ ngắm nhìn những chiếc lá rơi ngoài sân. Đêm nay, như mọi đêm khác, cô cảm thấy một nỗi buồn vô định xâm chiếm lòng mình. Bỗng, tiếng chuông điện thoại vang lên phá tan bầu không khí tĩnh mịch.'),   
    Chapter(chapterId: 4, chapterName: 'Ánh sáng huyền dịu của Karith Thánh Mẫu', chapterOrder: 4, chapterStatus: 1, viewCount: 704, voteCount: 109, commentCount: 1,createdDate: DateTime(2024, 7, 20, 15, 30),
            chapterContent: 'Trải dài bên trong lâu đài cổ kính, hành lang vắng lặng như giữ bí mật về quá khứ đầy bí ẩn của hoàng gia. lặng lẽ ngắm nhìn những chiếc lá rơi ngoài sân. Đêm nay, như mọi đêm khác, cô cảm thấy một nỗi buồn vô định xâm chiếm lòng mình. Bỗng, tiếng chuông điện thoại vang lên phá tan bầu không khí tĩnh mịch.'),   
    Chapter(chapterId: 5, chapterName: 'Ánh sáng huyền dịu của Karith Thánh Mẫu', chapterOrder: 4, chapterStatus: 1, viewCount: 704, voteCount: 109, commentCount: 1,createdDate: DateTime(2024, 7, 20, 15, 30),
            chapterContent: 'Trải dài bên trong lâu đài cổ kính, hành lang vắng'),   
    Chapter(chapterId: 6, chapterName: 'Ánh sáng huyền dịu của Karith Thánh Mẫu', chapterOrder: 4, chapterStatus: 1, viewCount: 704, voteCount: 109, commentCount: 1,createdDate: DateTime(2024, 7, 20, 15, 30),
            chapterContent: 'Trải dài bên trong lâu đài cổ kính, hành lang vắng lặng như giữ bí mật về quá khứ đầy bí ẩn của hoàng gia. Á...'),   
    
  ];
  late Widget showMoreButton;
  bool isExpanded = false;


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //get chapters from story id
    initData();
    return 
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.sp),
          child: 
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(Strings.chapterList, style: FontConstant.headline2White,),
            10.verticalSpace,
            
            chapterList.isNotEmpty
            ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${chapterList.length} ${Strings.chapter}', style: FontConstant.chapterDisplay,),
                GestureDetector(
                  onTap: () {
                    context.pushRoute(ChapterListPage(chapters: chapterList, story: widget.story));
                  },
                  child: Text(
                    Strings.showAll,
                    style: FontConstant.purpleText,
                  ),
                ),
              ],)
            : 2.horizontalSpace,

            10.verticalSpace,
            Container(
              height: 230.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.sp),
                border: Border.all(color: ColorConstants.primaryText, width: 1.sp)
              ),
              child: 
              Padding(padding: EdgeInsets.all(5.sp),
              child: 
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  controller: ScrollController(),
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: chapterList.length < 5 ? chapterList.length : 5,
                  itemBuilder: (context, index) {
                    if (chapterList.length > 5 && index == 4 ) {
                      return Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: Text('...', style: FontConstant.dataDisplay,),
                      );
                    }
                    else {
                      return Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: ChapterNameWidget(chapter: chapterList.elementAt(index),),
                      );
                    }
                    })
              ), 
            )
            
            
            
          ])
        
    );
   }

  
  void initData() {
    // Code ở đây sẽ chỉ chạy một lần khi state được khởi tạo
    //data = widget.data;
    

  }
   
}
