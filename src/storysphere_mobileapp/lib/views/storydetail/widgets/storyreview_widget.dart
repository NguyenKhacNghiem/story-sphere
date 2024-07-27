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
  //   Review(reviewId: 1, userId: 1, storyId: 1, ratePoint: 5, reviewTime: DateTime(2021, 2, 18, 15, 30), reviewContent: 'Tác phẩm đã cuốn hút tôi ngay từ những trang đầu tiên. Bước vào cung điện của sự huyền bí, cùng với nhân vật Hue, tôi đã được đưa vào một thế giới đầy mê hoặc và kỳ diệu. Tác giả xây dựng cốt truyện chặt chẽ, mỗi chương đều đầy ắp những chi tiết ly kỳ và bất ngờ. Từ những thử thách cam go đến những bí mật cổ xưa, hành trình của Hue đã khiến tôi không thể đặt sách xuống. Một câu chuyện tuyệt vời, đầy sáng tạo và cảm xúc. Rất đáng để đọc!', replyTo: null ),
  //   Review(reviewId: 2, userId: 2, storyId: 1, ratePoint: 1, reviewTime: DateTime(2021, 3, 20, 14, 21), reviewContent: 'Truyện không hay lắm', replyTo: null),
  //   Review(reviewId: 3, userId: 3, storyId: 1, ratePoint: 1, reviewTime: DateTime(2022, 3, 12, 1, 30), reviewContent: 'Tác phẩm mở đầu rất hứa hẹn với một bối cảnh huyền bí và hấp dẫn. Hành trình của Hue bước vào cung điện cổ xưa đã khơi dậy sự tò mò và tưởng tượng. Tuy nhiên, mặc dù câu chuyện có nhiều chi tiết thú vị và đầy bất ngờ, nhưng một số chương lại hơi dàn trải và thiếu điểm nhấn. Một số đoạn cao trào chưa thực sự đủ sức gây ấn tượng mạnh mẽ.', replyTo: null),
  //   Review(reviewId: 4, userId: 2, storyId: 1, ratePoint: null, reviewTime: DateTime(2022, 3, 12, 1, 30), reviewContent: 'Đọc tới chương 5 thì drop vì chịu không nổi nữ9', replyTo: 2),
  //   Review(reviewId: 5, userId: 2, storyId: 1, ratePoint: null, reviewTime: DateTime(2022, 3, 12, 3, 30), reviewContent: 'Same, mình drop ở chương 10. Truyện này 3*', replyTo: 2),
  // ];
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
