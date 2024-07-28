import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/comment.dart';
import 'package:storysphere_mobileapp/models/user.dart';
import 'package:storysphere_mobileapp/services/comment_service.dart';

// ignore: must_be_immutable
class CommentListItemWidget extends StatefulWidget {
  final Comment comment;
  List<Comment>? replyComment;
  final int userId;
  CommentListItemWidget({super.key, required this.comment, this.replyComment, required this.userId});

  @override
  State<CommentListItemWidget> createState() => _CommentListItemWidget();
}

class _CommentListItemWidget extends State<CommentListItemWidget> {
  final TextEditingController commentController = TextEditingController();
  User user = User(userId: 1, displayName: 'Kathy Alueds', avatar: 'https://i.pinimg.com/564x/f5/6b/c6/f56bc61a256661afc80d2995d1dd0582.jpg');
  bool isReply = false;
  late int currentUser;
  List<Comment> replyComment = [];

  @override
  Widget build(BuildContext context) {
    currentUser = widget.userId;
    replyComment = widget.replyComment ?? [];

    return Padding(
      padding: EdgeInsets.only(top: 10.sp),
      child:
      Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isReply = !isReply;
              });
            },
          child: buildcomment(widget.comment)),
          
          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            child: isReply
                ? commentEditor()
                : 0.verticalSpace,
          ),
          replyComment != null && replyComment!.isNotEmpty
          ? ListView.builder(
            scrollDirection: Axis.vertical,
                controller: ScrollController(),
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: replyComment!.length,
                itemBuilder: (context, index) {
                return buildReply(replyComment!.elementAt(index));
          })
          : 0.verticalSpace,
    ]));
   
  }

  Widget buildcomment(Comment comment){
    //get user by userID
    User usercomment = user;
    String dateString = 'D';
    if (comment.comtTime != null) {
       dateString = "${comment.comtTime!.day}/${comment.comtTime!.month}/${comment.comtTime!.year}";
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40.sp,
          height: 40.sp,
          decoration: BoxDecoration(
            image: DecorationImage( 
              image: NetworkImage(usercomment.avatar ?? 'https://cdn-icons-png.flaticon.com/512/3607/3607444.png'),
              fit: BoxFit.cover,),
          borderRadius: BorderRadius.circular(15.sp)
          ),
        ),
        10.horizontalSpace,
        
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
              Text(usercomment.displayName ?? '', style: FontConstant.rateUserNameDisplay.copyWith(color: ColorConstants.secondaryText)),
              50.horizontalSpace,
              Text(dateString, style: FontConstant.userIntroduction,),
              ],
            ),
            10.verticalSpace,
            //comment content
            SizedBox(
              width: 290.sp,
              child: Text(
                comment.comtContent ?? '',
                style: FontConstant.rateContentDisplay,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.justify,
              ),
            ),
            5.verticalSpace,

            
           
          ],
        )
      ],
    );

  }
 
  Widget buildReply(Comment comment){
    //get user by userID
    User userReview = user;
    String dateString = 'D';
    if (comment.comtTime != null) {
       dateString = "${comment.comtTime!.day}/${comment.comtTime!.month}/${comment.comtTime!.year}";
    }

    return 
    Padding(padding: EdgeInsets.only(left: 10.sp, top: 15.sp),
    child: 
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconsSVG.reply,
        5.horizontalSpace,
        Container(
          width: 30.sp,
          height: 30.sp,
          decoration: BoxDecoration(
            image: DecorationImage( 
              image: NetworkImage(userReview.avatar ?? 'https://cdn-icons-png.flaticon.com/512/3607/3607444.png'),
              fit: BoxFit.cover,),
          borderRadius: BorderRadius.circular(15.sp)
          ),
        ),
        10.horizontalSpace,
        
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
              Text(userReview.displayName ?? '', style: FontConstant.rateUserNameDisplay.copyWith(color: ColorConstants.secondaryText)),
              50.horizontalSpace,
              Text(dateString, style: FontConstant.userIntroduction,),
              ],
            ),
            10.verticalSpace,
            //comment content
            SizedBox(
              width: 240.sp,
              child: Text(
                comment.comtContent ?? '',
                style: FontConstant.rateContentDisplay,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.justify,
              ),
            ),
            5.verticalSpace,

            
           
          ],
        )
      ],
    ));
  }
  
  
  Widget commentEditor (){
   return  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
   Container(
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
            decoration: InputDecoration(
              hintText: '${Strings.replyTo} ${user.displayName ?? ''}',
              fillColor: ColorConstants.transparent,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintStyle: const TextStyle(color: ColorConstants.secondaryText),
            ),
        ), 
    ),),
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
              validationAndSubmit();
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
    
    ]);
  }

  
   Future<void> validationAndSubmit() async {
    Comment newComment = Comment();
     var temptstoryContentString = commentController.text;
      newComment.comtContent = temptstoryContentString;
      newComment.replyTo = widget.comment.comtId;
      newComment.comtTime = DateTime.now();
      newComment.userId = currentUser;
      newComment.chapterId = widget.comment.chapterId;

    try {
      final response = await CommentService().sendComment(newComment);
      if (response.statusCode == 200) {
        debugPrint('Review sent successfully: ${response.body}');
        setState(() {
          isReply = false;
          replyComment.add(newComment);
        });

      }
      
    } catch (e) {
      debugPrint('Error sending review: $e');
    }
    
  }
}
