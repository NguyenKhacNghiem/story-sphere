import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';
import 'package:storysphere_mobileapp/views/chapters/widgets/likecmt_section.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';
import 'package:storysphere_mobileapp/views/searching/widgets/story_data_widget.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

@RoutePage()
class ChapterPage extends StatefulWidget {
  final Chapter chapter;
  final String storyName;
  const ChapterPage({super.key, required this.chapter, required this.storyName});

  @override
  State<ChapterPage> createState() => _ChapterPage();
}

class _ChapterPage extends State<ChapterPage> {
  late Chapter chapter;

  @override
  Widget build(BuildContext context) {
    chapter = widget.chapter;
    initData();



    return Scaffold(
      bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
          child: 
          Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            40.verticalSpace,
            Center(
              child: Text(widget.storyName, style: FontConstant.storyNameChapterWhite,),
            ),
            2.verticalSpace,
            Center(
              child:SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: Text(chapter.chapterName ?? '', 
                style: FontConstant.resultTitleDisplay,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,),
            ),),

            30.verticalSpace,
            StoryDataWidget(viewCount: chapter.viewCount ?? 0, voteCount: chapter.voteCount ?? 0, commentCount: chapter.commentCount ?? 0,),
            
            20.verticalSpace,
            HtmlWidget(chapter.chapterContent ?? ''),

            30.verticalSpace,
            ChapterLikeCommentSection(chapter: chapter),

          ],
        ))
      ),
    );
   }

   initData(){
    chapter.chapterContent = '''
<p>Trong căn phòng nhỏ, ánh đèn bàn mờ nhạt chiếu xuống những trang sách cũ kỹ. Minh Anh ngồi bên cửa sổ, lặng lẽ ngắm nhìn những chiếc lá rơi ngoài sân. Đêm nay, như mọi đêm khác, cô cảm thấy một nỗi buồn vô định xâm chiếm lòng mình. Bỗng, tiếng chuông điện thoại vang lên phá tan bầu không khí tĩnh mịch.</p>

<p>Minh Anh nhìn chiếc điện thoại cổ xưa nằm trên bàn, chiếc điện thoại mà cô đã tìm thấy trong căn gác xép của bà ngoại. Đó là một chiếc điện thoại quay số màu đen, từ thời bà cô còn trẻ. Cô đã thử sử dụng nó nhiều lần, nhưng chưa bao giờ thấy tín hiệu. Vậy mà đêm nay, chiếc điện thoại ấy lại đổ chuông.</p>

<p>Do dự một lát, Minh Anh cầm ống nghe lên. Tiếng rè rè phát ra từ đầu dây bên kia. Cô khẽ nói:</p>

<p>"Alo, ai đó?"</p>

<p>Im lặng kéo dài một lúc, rồi một giọng nói khàn khàn cất lên:</p>

<p>"Minh Anh, là cháu phải không?"</p>

<p>Minh Anh giật mình, tim đập thình thịch. Giọng nói này quen thuộc nhưng cô không thể nhớ ra là của ai. Cô hỏi lại, giọng run run:</p>

<p>"Vâng, là cháu đây. Ai đang nói vậy?"</p>

<p>Giọng nói kia tiếp tục:</p>

<p>"Cháu không nhận ra ta sao? Ta là bà ngoại của cháu đây."</p>

<p>Minh Anh kinh ngạc, chiếc điện thoại suýt nữa rơi khỏi tay cô. Bà ngoại cô đã mất từ ba năm trước. Cô không tin vào tai mình, nhưng giọng nói ấy thật sự là của bà ngoại.</p>

<p>"Bà ngoại? Làm sao... làm sao bà có thể gọi cho cháu được?"</p>

<p>Giọng nói bên kia nhẹ nhàng nhưng đầy vẻ bí ẩn:</p>

<p>"Đừng lo, cháu yêu. Bà không có nhiều thời gian. Bà muốn cảnh báo cháu về một nguy hiểm đang đến gần. Cháu phải cẩn thận, và nhớ kỹ rằng, những gì cháu tìm thấy trong căn gác xép sẽ giúp cháu."</p>

<p>Minh Anh cảm thấy rùng mình. Cô nhớ lại những hộp cũ, những cuốn sách và bức ảnh đã tìm thấy trên gác xép, nhưng không thấy gì đặc biệt. Cô hỏi:</p>

<p>"Bà nói rõ hơn được không? Cháu phải làm gì?"</p>

<p>Tiếng rè rè lại vang lên, giọng bà ngoại bắt đầu yếu dần:</p>

<p>"Hãy tin vào trực giác của cháu, và luôn cẩn trọng với những người xung quanh. Bà phải đi rồi, nhớ kỹ lời bà."</p>

<p>Cuộc gọi kết thúc đột ngột, tiếng rè rè biến mất, để lại Minh Anh với vô số câu hỏi và nỗi sợ hãi không tên. Cô đặt ống nghe xuống, tâm trí rối bời. Chuyện gì đang xảy ra? Làm sao bà ngoại có thể gọi từ bên kia thế giới?</p>

<p>Minh Anh nhìn quanh căn phòng, ánh đèn bàn bỗng trở nên lạnh lẽo hơn bao giờ hết. Cô quyết định sẽ lên gác xép kiểm tra lại mọi thứ vào sáng mai. Nhưng trước khi đi ngủ, cô khóa chặt cửa sổ và cửa ra vào, cảm giác có điều gì đó rất đáng sợ đang rình rập bên ngoài.</p>

<p>Đêm ấy, Minh Anh không tài nào chợp mắt được. Những lời cảnh báo của bà ngoại cứ vang vọng trong đầu, như một lời tiên tri đầy ám ảnh. Cô cảm nhận rõ ràng rằng cuộc sống của mình sẽ không còn như trước nữa. Cái gì đó bí ẩn và nguy hiểm đang đến gần, và cô phải sẵn sàng đối mặt với nó.</p>''';
   }
}
