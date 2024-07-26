import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/comment.dart';
import 'package:storysphere_mobileapp/models/user.dart';

class CommentListItemWidget extends StatefulWidget {
  final Comment comment;
  List<Comment>? replyComment;
  CommentListItemWidget({super.key, required this.comment, this.replyComment});

  @override
  State<CommentListItemWidget> createState() => _CommentListItemWidget();
}

class _CommentListItemWidget extends State<CommentListItemWidget> {

  User user = User(userId: 1, displayName: 'Kathy Alueds', avatar: 'https://i.pinimg.com/564x/f5/6b/c6/f56bc61a256661afc80d2995d1dd0582.jpg');

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 10.sp),
      child:
      Column(
        children: [
          buildcomment(widget.comment),
          widget.replyComment != null && widget.replyComment!.isNotEmpty
          ? ListView.builder(
            scrollDirection: Axis.vertical,
                controller: ScrollController(),
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.replyComment!.length,
                itemBuilder: (context, index) {
                return buildReply(widget.replyComment!.elementAt(index));
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
  
}
