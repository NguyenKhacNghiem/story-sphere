import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/review.dart';
import 'package:storysphere_mobileapp/models/user.dart';
import 'package:storysphere_mobileapp/services/review_service.dart';

// ignore: must_be_immutable
class ReviewListItemWidget extends StatefulWidget {
  final Review review;
  List<Review>? replyReview;
  ReviewListItemWidget({super.key, required this.review, this.replyReview});

  @override
  State<ReviewListItemWidget> createState() => _ReviewListItemWidget();
}

class _ReviewListItemWidget extends State<ReviewListItemWidget> {
  final TextEditingController commentController = TextEditingController();
  User user = User(userId: 1, displayName: 'Kathy Alueds', avatar: 'https://i.pinimg.com/564x/f5/6b/c6/f56bc61a256661afc80d2995d1dd0582.jpg');
  bool isReply = false;
  late int currentUser;
  List<Review> replyComment = [];

  @override
  void initState() {
    _loadUserId();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    replyComment = widget.replyReview ?? [];

    return SingleChildScrollView(
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
          child: buildReview(widget.review)),
          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            child: isReply
                ? commentEditor()
                : 0.verticalSpace,
          ),
          widget.replyReview != null && widget.replyReview!.isNotEmpty
          ? ListView.builder(
            scrollDirection: Axis.vertical,
                controller: ScrollController(),
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.replyReview!.length,
                itemBuilder: (context, index) {
                return buildReply(widget.replyReview!.elementAt(index));
          })
          : 0.verticalSpace,
        ]   
    ));
   
  }

  Widget buildReview(Review review){
    //get user by userID
    User userReview = user;
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
              child: HtmlWidget(
                review.reviewContent ?? '',
                textStyle: FontConstant.rateContentDisplay,
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

  Future<void> _loadUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentUser = prefs.getInt('userId') ?? 100004;
    });
  }
  
  Widget buildReply(Review review){
    //get user by userID
    User userReview = user;
    String dateString = 'D';
    if (review.reviewTime != null) {
       dateString = "${review.reviewTime!.day}/${review.reviewTime!.month}/${review.reviewTime!.year}";
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
                review.reviewContent ?? '',
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
    Review newComment = Review();
     var temptstoryContentString = commentController.text;
      newComment.reviewContent = temptstoryContentString;
      newComment.replyTo = widget.review.reviewId;
      newComment.reviewTime = DateTime.now();
      newComment.userId = currentUser;
      newComment.storyId = widget.review.storyId;

    try {
      final response = await ReviewService().sendReview(newComment);
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
