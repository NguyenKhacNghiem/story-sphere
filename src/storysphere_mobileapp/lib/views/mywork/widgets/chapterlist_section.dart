import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/views/mywork/widgets/chapterlistitem_widget.dart';

class ChapterListWriteSection extends StatefulWidget {
  final int storyId;
  const ChapterListWriteSection({super.key, required this.storyId});

  @override
  State<ChapterListWriteSection> createState() => _ChapterListWriteSection();
}

class _ChapterListWriteSection extends State<ChapterListWriteSection> {
  List<Chapter> chapterList = [];

  @override
  Widget build(BuildContext context) {
  
    return 
      Padding(
        padding: EdgeInsets.symmetric(vertical: 20.sp),
        child:
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(Strings.chapterListDisplay.toUpperCase(), style: FontConstant.resultTitleDisplay,),

                chapterList.isEmpty 
                ? buildloading(widget.storyId)
                : 
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    controller: ScrollController(),
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: chapterList.length,
                    itemBuilder: (context, index) {
                    return
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.sp), 
                      child: InkWell(
                        onTap: (){ 
                          context.pushRoute(EditChapterPage(chapter: chapterList.elementAt(index)));
                        },
                        child: ChapterListWriteItemWidget(chapter: chapterList.elementAt(index),),
                      ),
                      
                    );
                }),
              ],)
        );
    
  }

  Widget buildloading(int storyId){
    //get chapter by storyiD
    
    if (chapterList.isEmpty && storyId == -1){
       return const CircularProgressIndicator();
    } else {
      setState(() {
        chapterList = [
          Chapter(chapterId: 1, chapterName: 'Cuộc gọi bí ẩn', chapterOrder: 1, chapterStatus: 2, viewCount: 1203, voteCount: 241, commentCount: 17, createdDate: DateTime(2023, 12, 20, 15, 30), fkStoryId: 1,
            chapterContent: 'Trong căn phòng nhỏ, ánh đèn bàn mờ nhạt chiếu xuống những trang sách cũ kỹ. Minh Anh ngồi bên cửa lặng lẽ ngắm nhìn những chiếc lá rơi ngoài sân. Đêm nay, như mọi đêm khác, cô cảm thấy một nỗi buồn vô định xâm chiếm lòng mình. Bỗng, tiếng chuông điện thoại vang lên phá tan bầu không khí tĩnh mịch.'), 
          Chapter(chapterId: 2, chapterName: 'Cánh cửa huyền bí', chapterOrder: 2, chapterStatus: 2, viewCount: 930, voteCount: 194, commentCount: 10, createdDate: DateTime(2024, 7, 20, 15, 30), fkStoryId: 1,
                  chapterContent: 'Trên đỉnh núi cao, mây trắng bao phủ, một ngôi đền cổ vẫn đứng vững giữa gió lạnh. Những câu chuyện lặng lẽ ngắm nhìn những chiếc lá rơi ngoài sân. Đêm nay, như mọi đêm khác, cô cảm thấy một nỗi buồn vô định xâm chiếm lòng mình. Bỗng, tiếng chuông điện thoại vang lên phá tan bầu không khí tĩnh mịch.'),   
          Chapter(chapterId: 3, chapterName: 'Hành lang cổ kính', chapterOrder: 3, chapterStatus: 2, viewCount: 902, voteCount: 180, commentCount: 9,createdDate: DateTime(2024, 7, 20, 15, 30), fkStoryId: 1,
                  chapterContent: 'Trải dài bên trong lâu đài cổ kính, hành lang vắng lặng như giữ bí mật về quá khứ đầy bí ẩn của hoàng gia. lặng lẽ ngắm nhìn những chiếc lá rơi ngoài sân. Đêm nay, như mọi đêm khác, cô cảm thấy một nỗi buồn vô định xâm chiếm lòng mình. Bỗng, tiếng chuông điện thoại vang lên phá tan bầu không khí tĩnh mịch.'),   
          Chapter(chapterId: 4, chapterName: 'Ánh sáng huyền dịu của Karith Thánh Mẫu', chapterOrder: 4, chapterStatus: 1, viewCount: 704, voteCount: 109, commentCount: 1,createdDate: DateTime(2024, 7, 20, 15, 30), fkStoryId: 1,
                  chapterContent: 'Trải dài bên trong lâu đài cổ kính, hành lang vắng lặng như giữ bí mật về quá khứ đầy bí ẩn của hoàng gia. lặng lẽ ngắm nhìn những chiếc lá rơi ngoài sân. Đêm nay, như mọi đêm khác, cô cảm thấy một nỗi buồn vô định xâm chiếm lòng mình. Bỗng, tiếng chuông điện thoại vang lên phá tan bầu không khí tĩnh mịch.'),   
          Chapter(chapterId: 5, chapterName: 'Ánh sáng huyền dịu của Karith Thánh Mẫu', chapterOrder: 4, chapterStatus: 1, viewCount: 704, voteCount: 109, commentCount: 1,createdDate: DateTime(2024, 7, 20, 15, 30), fkStoryId: 1,
                  chapterContent: 'Trải dài bên trong lâu đài cổ kính, hành lang vắng'),   
          Chapter(chapterId: 6, chapterName: 'Ánh sáng huyền dịu của Karith Thánh Mẫu', chapterOrder: 4, chapterStatus: 1, viewCount: 704, voteCount: 109, commentCount: 1,createdDate: DateTime(2024, 7, 20, 15, 30), fkStoryId: 1,
                  chapterContent: 'Trải dài bên trong lâu đài cổ kính, hành lang vắng lặng như giữ bí mật về quá khứ đầy bí ẩn của hoàng gia. Á...'),   
        ];
      });
      return 0.horizontalSpace;
    }

     
   }
}
