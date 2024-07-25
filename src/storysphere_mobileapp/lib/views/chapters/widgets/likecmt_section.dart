import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';

class ChapterLikeCommentSection extends StatefulWidget {
  final Chapter chapter;
  const ChapterLikeCommentSection({super.key, required this.chapter});

  @override
  State<ChapterLikeCommentSection> createState() => _ChapterLikeCommentSection();
}

class _ChapterLikeCommentSection extends State<ChapterLikeCommentSection> {
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
  bool isLiked = false;


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //get user when hit like
    initData();
    return 
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.sp),
        border: Border.all(color: ColorConstants.lightText, width: 1.sp),
      ),
      child: 
        Padding(
          padding: EdgeInsets.all(10.sp),
          child: 
         Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(Strings.loveStoryAsk, style: FontConstant.headline3White,),
            5.verticalSpace,
            Text(Strings.voteReminder, style: FontConstant.voteReminder,),

            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        isLiked ? IconsSVG.likeBoldBig : IconsSVG.likeNormalBig,
                        10.verticalSpace,
                        Text(isLiked ? Strings.liked : Strings.like, style: FontConstant.voteReminder.copyWith(color: ColorConstants.lightText),),
                      ],
                    )
                ),

                40.horizontalSpace,
                InkWell(
                  onTap: (){
                    context.pushRoute(AddCommentPage(chapterId: widget.chapter.chapterId ?? -1));
                  },
                  child: 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconsSVG.commentBig,
                        10.verticalSpace,
                        Text(Strings.comment, style: FontConstant.voteReminder.copyWith(color: ColorConstants.lightText),),
                      ],
                    )
                ),
                
            ],)
            
          ])
        
    ));
   }

  
  void initData() {
    // Code ở đây sẽ chỉ chạy một lần khi state được khởi tạo
    //data = widget.data;
    

  }
   
}
