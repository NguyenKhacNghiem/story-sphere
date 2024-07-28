import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/review.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/services/review_service.dart';
import 'package:storysphere_mobileapp/views/storydetail/widgets/reviewlist_itemwidget.dart';

class StoryReviewWidget extends StatefulWidget {
  final Story story;
  const StoryReviewWidget({super.key, required this.story});

  @override
  State<StoryReviewWidget> createState() => _StoryReviewWidget();
}

class _StoryReviewWidget extends State<StoryReviewWidget> {
  List<Review> reviewList = [];
  int currentPage = 1;
  int totalPages = 1;
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
          padding: EdgeInsets.symmetric(horizontal: 40.sp, vertical: 10.sp),
          child: 
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                Text(Strings.reviewListDisplay, style: FontConstant.headline2White,),
                10.horizontalSpace,
                IconsSVG.starTag,]),
                
                 ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.buttonDarkGreen,
                    shadowColor: ColorConstants.transparent,
                    padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 15.sp), // Remove padding
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                  onPressed: (){
                    context.pushRoute(AddReviewPage(story: widget.story));
                  }, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                          Text(Strings.writeReview, style: FontConstant.subTitleText, textAlign: TextAlign.center,),
                          5.horizontalSpace,
                          IconsSVG.writeReview,
                        ],
                      ),
                      
                    ),
                
             ],),
            ListView.builder(
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: reviewList.length,
              itemBuilder: (context, index) {
                Review review = reviewList.elementAt(index);
                if (review.replyTo == -1) {
                  List<Review> replyReview = reviewList
                    .where((review1) => review1.replyTo != null && review1.replyTo == review.reviewId)
                    .toList();
                  return Padding(
                        padding: EdgeInsets.only(top: 10.sp),
                        child: ReviewListItemWidget(review: review, replyReview: replyReview,),);
                } else {
                  return 0.horizontalSpace;
                }
              })
            
          ])
        
    );
   }

  
  void initData() {
     if (reviewList.isEmpty) {
      final result =  ReviewService().getReviewByStoryId(widget.story.storyId ?? -1, currentPage);
      result.whenComplete(() {
        result.then((value) {
          if (value != null) {
            setState(() {
              reviewList = value.result;
              currentPage = value.currentPage;
              totalPages = value.totalPages;
            });
          }
        });
      });
    }
    

  }
   
}
