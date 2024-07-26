import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/comment.dart';
import 'package:storysphere_mobileapp/views/chapters/widgets/comlist_itemwidget.dart';

@RoutePage()
class AddCommentPage extends StatefulWidget {
  final int chapterId;
  const AddCommentPage({super.key, required this.chapterId});

  @override
  State<AddCommentPage> createState() => _AddCommentPage();
}

class _AddCommentPage extends State<AddCommentPage> {
  late int chapterId;
  late int userId;
  final TextEditingController commentController = TextEditingController();
  List<Comment> commentList = [
    Comment(comtId: 1, userId: 1, chapterId: 1, comtTime: DateTime(2021, 2, 18, 15, 30), comtContent: 'Tác phẩm đã cuốn hút tôi ngay từ những trang đầu tiên. Bước vào cung điện của sự huyền bí, cùng với nhân vật Hue, tôi đã được đưa vào một thế giới đầy mê hoặc và kỳ diệu. Tác giả xây dựng cốt truyện chặt chẽ, mỗi chương đều đầy ắp những chi tiết ly kỳ và bất ngờ. Từ những thử thách cam go đến những bí mật cổ xưa, hành trình của Hue đã khiến tôi không thể đặt sách xuống. Một câu chuyện tuyệt vời, đầy sáng tạo và cảm xúc. Rất đáng để đọc!', replyTo: null ),
    Comment(comtId: 2, userId: 2, chapterId: 1, comtTime: DateTime(2021, 3, 20, 14, 21), comtContent: 'Truyện không hay lắm', replyTo: null),
    Comment(comtId: 3, userId: 3, chapterId: 1, comtTime: DateTime(2022, 3, 12, 1, 30), comtContent: 'Tác phẩm mở đầu rất hứa hẹn với một bối cảnh huyền bí và hấp dẫn. Hành trình của Hue bước vào cung điện cổ xưa đã khơi dậy sự tò mò và tưởng tượng. Tuy nhiên, mặc dù câu chuyện có nhiều chi tiết thú vị và đầy bất ngờ, nhưng một số chương lại hơi dàn trải và thiếu điểm nhấn. Một số đoạn cao trào chưa thực sự đủ sức gây ấn tượng mạnh mẽ.', replyTo: null),
    Comment(comtId: 4, userId: 2, chapterId: 1, comtTime: DateTime(2022, 3, 12, 1, 30), comtContent: 'Đọc tới chương 5 thì drop vì chịu không nổi nữ9', replyTo: 2),
    Comment(comtId: 5, userId: 2, chapterId: 1, comtTime: DateTime(2022, 3, 12, 3, 30), comtContent: 'Same, mình drop ở chương 10. Truyện này 3*', replyTo: 2),
  ];

  @override
  void initState() {
    // TODO: implement initState
    _loadUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    chapterId = widget.chapterId;
  
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             60.verticalSpace,
             Center(
              child: Text(Strings.userComments, style: FontConstant.bookTitleDisplay,),
             ),
             
             5.verticalSpace,
             Container(
              width: 340.sp,
              height: 1.sp,
              color: ColorConstants.formStrokeColor,
             ),

             30.verticalSpace,
             Text(Strings.writeNewComment, style: FontConstant.bookTitleItem,),
             10.verticalSpace,
             commentEditor(),
            //SUBMIT BUTTON
            20.verticalSpace,
            Center(
              child: 
               ElevatedButton(
                style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.transparent,
                          shadowColor: ColorConstants.transparent,
                          padding: EdgeInsets.zero, // Remove padding
                          minimumSize: Size.zero,   // Remove minimum size constraints
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink wrap the button
                        ),
                  onPressed: () {
                  
                  },
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.buttonLightGreen,
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                  child: 
                        Text(Strings.submitConmment, style: FontConstant.bookTitleItem,),
                      )
                
                )
                ),
            ),

             ListView.builder(
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: commentList.length,
              itemBuilder: (context, index) {
                Comment comment = commentList.elementAt(index);
                if (comment.replyTo == null) {
                  List<Comment> replyComment = commentList
                    .where((review1) => review1.replyTo != null && review1.replyTo == comment.comtId)
                    .toList();
                  return Padding(
                        padding: EdgeInsets.only(top: 10.sp),
                        child: CommentListItemWidget(comment: comment, replyComment: replyComment,));
                }
              }),
             
          ],
        )
      ),
    );
  }

  Widget commentEditor (){
   return  Container(
      width: (MediaQuery.of(context).size.width - 25.sp).sp,
      height: 100.sp,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstants.formStrokeColor,
          width: 1.sp,),
        borderRadius: BorderRadius.circular(5.sp),
      ),
      child:Padding(
          padding: EdgeInsets.all(5.sp),
          child: TextField(
            controller: commentController,
            maxLines: 3,
            style:  FontConstant.rateContentDisplay,
            decoration: const InputDecoration(
              hintText: Strings.comment,
              fillColor: ColorConstants.transparent,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintStyle: TextStyle(color: ColorConstants.secondaryText),
            ),
        ),
    ),);
  }

  Future<void> _loadUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('userId') ?? -1;
    });
  }
}
