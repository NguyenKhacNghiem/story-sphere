import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/review.dart';
import 'package:storysphere_mobileapp/models/user.dart';

class ReviewListItemWidget extends StatefulWidget {
  final Review review;
  List<Review>? replyReview;
  ReviewListItemWidget({super.key, required this.review, this.replyReview});

  @override
  State<ReviewListItemWidget> createState() => _ReviewListItemWidget();
}

class _ReviewListItemWidget extends State<ReviewListItemWidget> {

  User user1 = User(userId: 1, displayName: 'Kathy Alueds', avatar: 'https://i.pinimg.com/564x/f5/6b/c6/f56bc61a256661afc80d2995d1dd0582.jpg');
  User user2 = User(userId: 2, displayName: 'Alexa Meusde', avatar: 'https://i.pinimg.com/564x/15/f6/38/15f63856c0f1db9f4f2ee6a57a50b7f2.jpg');
  User user3 = User(userId: 3, displayName: 'Milo Nguyen', avatar: 'https://i.pinimg.com/564x/27/a9/47/27a9473fbccb0039dc312a19d07df54d.jpg');
  

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(top: 10.sp),
      child:
         widget.review.replyTo == null
         ? buildReview(widget.review)
         : buildReply(widget.review),
    );
   
  }

  Widget buildReview(Review review){
    //get user by userID
    User userReview = user1;
    int ratePoint = review.ratePoint ?? 0;
    String dateString = 'D';
    if (review.reviewTime != null) {
       dateString = "${review.reviewTime!.day}/${review.reviewTime!.month}/${review.reviewTime!.year}";
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
              image: NetworkImage(userReview.avatar ?? 'https://cdn-icons-png.flaticon.com/512/3607/3607444.png'),
              fit: BoxFit.cover,),
          borderRadius: BorderRadius.circular(20.sp)
          ),
        ),
        10.horizontalSpace,
        
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //rate point
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ratePoint >= 1.0 ? IconsSVG.starYellowSmall : IconsSVG.starTagSmall,
                2.horizontalSpace,
                ratePoint >= 2.0 ? IconsSVG.starYellowSmall : IconsSVG.starTagSmall,
                2.horizontalSpace,
                ratePoint >= 3.0 ? IconsSVG.starYellowSmall : IconsSVG.starTagSmall,
                2.horizontalSpace,
                ratePoint >= 4.0 ? IconsSVG.starYellowSmall : IconsSVG.starTagSmall,
                2.horizontalSpace,
                ratePoint > 4.5  ? IconsSVG.starYellowSmall : IconsSVG.starTagSmall,
                
                30.horizontalSpace,
                Text(dateString, style: FontConstant.userIntroduction,
                )
            ],),
           15.verticalSpace,
            //review content
            SizedBox(
              width: 260.sp,
              child: Text(
                review.reviewContent ?? '',
                style: FontConstant.rateContentDisplay,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.justify,
              ),
            ),
            5.verticalSpace,

            //username
            SizedBox(
              width: 260.sp,
              child: 
               Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 75.sp,
                  height: 0.7.sp,
                  color: ColorConstants.bgWhite,
                ),
                10.horizontalSpace,
                Text(userReview.displayName ?? '', style: FontConstant.rateUserNameDisplay,)
              ],),
            ),
           
          ],
        )
      ],
    );

  }
  
  Widget buildReply(Review review){
    //get user by userID
    User userReview = user1;
    int ratePoint = review.ratePoint ?? 0;

    return Row(
      children: [
        Container(
          width: 40.sp,
          height: 40.sp,
          decoration: BoxDecoration(
            image: DecorationImage( 
              image: NetworkImage(userReview.avatar ?? 'https://cdn-icons-png.flaticon.com/512/3607/3607444.png'),
              fit: BoxFit.cover,),
          ),
        ),
        10.horizontalSpace,
        Column(
          children: [
            //rate point
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ratePoint >= 1.0 ? IconsSVG.starYellowSmall : IconsSVG.starTagSmall,
                2.horizontalSpace,
                ratePoint >= 2.0 ? IconsSVG.starYellowSmall : IconsSVG.starTagSmall,
                2.horizontalSpace,
                ratePoint >= 3.0 ? IconsSVG.starYellowSmall : IconsSVG.starTagSmall,
                2.horizontalSpace,
                ratePoint >= 4.0 ? IconsSVG.starYellowSmall : IconsSVG.starTagSmall,
                2.horizontalSpace,
                ratePoint > 4.5  ? IconsSVG.starYellowSmall : IconsSVG.starTagSmall,
            ],),
          
            //review content
            SizedBox(
              width: 300.sp,
              child: Text(
                review.reviewContent ?? '',
                style: FontConstant.rateContentDisplay,
                overflow: TextOverflow.clip,
              ),
            )
          ],
        )
      ],
    );

  }
  
}
